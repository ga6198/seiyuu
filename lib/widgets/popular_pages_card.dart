import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/database.dart';
import 'package:seiyuu/util/seiyuu.dart';
import 'package:seiyuu/widgets/custom_progress_indicator.dart';
import 'package:seiyuu/widgets/error_display.dart';
import 'package:seiyuu/widgets/primary_card.dart';

class PopularPagesCard extends StatefulWidget {
  PopularPagesCard({Key key}) : super(key: key);

  @override
  _PopularPagesCardState createState() => _PopularPagesCardState();
}

class _PopularPagesCardState extends State<PopularPagesCard> {
  String dropdownValue = Constants.DROPDOWN_TIMES[0];

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      headerContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Popular Pages", style: Theme.of(context).textTheme.headline5),
          buildDropdown(),
        ],
      ),
      bodyContent: Column(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //buildHeaderRow(),

          FutureBuilder(
              future: getSeiyuuList(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return CustomProgressIndicator();
                  case ConnectionState.waiting:
                    return CustomProgressIndicator();
                  default:
                    if (snapshot.hasData) {
                      List<dynamic> seiyuuList = snapshot.data;

                      List<DataRow> seiyuuRows = seiyuuList.map((seiyuuInfo) {
                        //seiyuuInfo format:
                        /*
                        [
                          [seiyuu1, viewCount1],
                          [seiyuu2, viewCount2],
                        ]
                        */

                        Seiyuu seiyuu = seiyuuInfo[0];
                        int viewCount = seiyuuInfo[1];

                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text("${seiyuu.name}"),
                            ),
                            DataCell(Text("${viewCount}")),
                          ],
                        );
                      }).toList();

                      //return Text("${seiyuuList[0].name}");
                      return DataTable(
                        columns: <DataColumn>[
                          DataColumn(label: Text('Seiyuu')),
                          DataColumn(label: Text('Page Views')),
                        ],
                        rows: seiyuuRows,
                      );
                    } else {
                      return Expanded(
                        child: ErrorDisplay(message: "Nothing to Show"),
                      );
                    }
                }
              }),
        ],
      ),
    );
  }

  Widget buildDropdown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Theme.of(context).accentColor),
      underline: Container(
        height: 2,
        color: Theme.of(context).accentColor, //Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: Constants.DROPDOWN_TIMES
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget buildHeaderRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border(
            bottom:
                BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.lock),
              Text(
                "Temp",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<dynamic>> getSeiyuuList() async {
    QuerySnapshot viewSnapshot = await Firestore.instance
        .collection('pageviews')
        .orderBy('viewCount', descending: true)
        .limit(5)
        .getDocuments();

    List<DocumentSnapshot> viewDocs = viewSnapshot.documents;
    List<dynamic> seiyuuList = [];
    //This code was problematic, since the async was in a callback
    /*await viewDocs.forEach((doc) async {
      Seiyuu currentSeiyuu = await Database.getSeiyuu(id: doc.documentID);
      seiyuuList.add(currentSeiyuu);
    });*/
    //This for loop works instead
    for (DocumentSnapshot doc in viewDocs) {
      Seiyuu currentSeiyuu = await Database.getSeiyuu(id: doc.documentID);

      //create a list with the seiyuu and the viewCount
      List seiyuuInfo = [currentSeiyuu, doc['viewCount']];

      seiyuuList.add(seiyuuInfo);
    }

    return seiyuuList;
  }

  /*Future<List<Seiyuu>> getSeiyuuList(List<DocumentSnapshot> idDocs) async {
    List<Seiyuu> seiyuuList = [];
    await idDocs.forEach((doc) async {
      Seiyuu currentSeiyuu = await Database.getSeiyuu(id: doc.documentID);
      seiyuuList.add(currentSeiyuu);
    });
    return seiyuuList;
  }*/
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seiyuu/util/seiyuu.dart';

//class for database queries
//used when saving information for getting info when a page loads
//do not use when real-time updates are preferred. In that case, use StreamBuilder()

class Database {
  //retrieve all seiyuu from the database in a list
  static Future<List<Seiyuu>> getAllSeiyuu() async {
    //NOTE: May need to add orderBy field eventually
    QuerySnapshot seiyuuSnap =
        await Firestore.instance.collection('seiyuu').getDocuments();

    //create a list that will hold all seiyuu
    List<Seiyuu> seiyuuList = List<Seiyuu>();

    for (int i = 0; i < seiyuuSnap.documents.length; i++) {
      DocumentSnapshot currentSeiyuuDoc = seiyuuSnap.documents[i];

      //make a seiyuu object from the document
      Seiyuu currentSeiyuu = Seiyuu(currentSeiyuuDoc);

      //add the seiyuu to the list
      seiyuuList.add(currentSeiyuu);
    }

    return seiyuuList;
  }

  static Future<void> addPageView(String seiyuuId) async {
    //may not need the await, since the user should not have to wait for this to finish
    //await
    Firestore.instance.runTransaction((Transaction tx) {
      Firestore.instance.collection("pageviews").document().setData({
        "seiyuuId": "$seiyuuId",
        "timeViewed": Timestamp.fromDate(DateTime.now()),
      });
    });
  }
}

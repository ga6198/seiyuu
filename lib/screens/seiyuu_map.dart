import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seiyuu/util/constants.dart';
import 'package:seiyuu/util/database.dart';
import 'package:seiyuu/util/decoration.dart';
import 'package:seiyuu/util/seiyuu.dart';
import 'package:seiyuu/widgets/custom_progress_indicator.dart';
import 'package:seiyuu/widgets/drawer_only.dart';

class SeiyuuMap extends StatefulWidget {
  SeiyuuMap({Key key}) : super(key: key);

  @override
  _SeiyuuMapState createState() => _SeiyuuMapState();
}

class _SeiyuuMapState extends State<SeiyuuMap> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seiyuu Birthplace Map",
          style: Theme.of(context)
              .textTheme
              .headline4, //Theme.of(context).textTheme.headline6
        ),
        centerTitle: true,
      ),
      drawer: DrawerOnly(),
      body: Container(
        decoration: backgroundDecoration(),
        child: FutureBuilder(
          future: Database.getAllSeiyuu(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return CustomProgressIndicator();
              case ConnectionState.waiting:
                return CustomProgressIndicator();
              default:
                if (snapshot.hasData) {
                  List<Seiyuu> seiyuuList = snapshot.data;

                  Set<Marker> seiyuuMarkers = createMarkers(seiyuuList);

                  return GoogleMap(
                    mapType: MapType.hybrid,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: Constants.COORDINATES_JAPAN,
                      zoom: 4.5,
                    ),
                    markers: seiyuuMarkers,
                  );
                } else {
                  return CustomProgressIndicator();
                }
            }
          },
        ),
      ),
      //NOTE: May need to add a single child scroll view
    );
  }

  Set<Marker> createMarkers(List<Seiyuu> seiyuuList) {
    Set<Marker> markerSet = Set<Marker>();

    seiyuuList.forEach((seiyuu) {
      Marker currentMarker = seiyuu.getMarker();
      markerSet.add(currentMarker);
    });

    return markerSet;
  }
}

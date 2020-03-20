import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//Use this class to hold a seiyuu's Birthplace
//This class allows conversion of the birthplace map into latLang

class Birthplace {
  //Stores the map as it was originally obtained from the passed in map
  Map<String, dynamic> birthplaceMap;

  String name;

  GeoPoint location;

  //default constructor
  Birthplace() {
    this.birthplaceMap = Map<String, dynamic>();
    this.name = "";
    this.location = null; //GeoPoint(0, 0);
  }

  //takes in a map of "name" and "lcoation" from the database
  //To set up the Birthplace parameter correctly, you will generally use this code: this.birthplace = doc["birthplace"];
  Birthplace.fromMap(Map<String, dynamic> birthplace) {
    this.birthplaceMap = birthplace;
    this.name = birthplace['name'];
    this.location = birthplace['location'];
  }

  //convert the location into a latitude and longitude
  LatLng toLatLng() {
    if (location != null) {
      double lat = location.latitude;
      double lng = location.longitude;
      LatLng latLng = LatLng(lat, lng);

      return latLng;
    } else {
      return null;
    }
  }

  //print out the Birthplace for debugging
  void printInfo() {
    print("Birthplace info:");
    print("Map: $birthplaceMap");
    print("Name: $name");
    print("Location: $location");
  }
}

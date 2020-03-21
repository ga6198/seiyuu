import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:seiyuu/util/birthplace.dart';
import 'package:seiyuu/util/roles.dart';

class Seiyuu {
  String id; //Firestore document id

  int age;
  String agency;
  String astrologicalSign;
  String birthday; //DateTime birthday; //Timestamp birthday;
  Birthplace
      birthplace; //Map<String, dynamic> birthplace; //includes location (Geopoint) and name (String)
  String bloodType;
  String gender;
  double height;
  List<String> imageUrls;
  String kanaName;
  String kanjiName;
  String name;
  Roles roles;
  //List<Map<String, dynamic>> roles; //contains a map, which holds "character" (String) and "work" (String)

  Seiyuu(DocumentSnapshot doc) {
    this.id = doc.documentID;

    this.agency = doc["agency"];
    this.astrologicalSign = doc["astrologicalSign"];

    //convert Timestamp to dateTime
    DateFormat dateFormat =
        DateFormat.yMd(); //DateFormat dateFormat = DateFormat.yMMMMd("en_US");
    Timestamp time = doc["birthday"];
    DateTime birthdayDate = DateTime.parse(time.toDate().toString());
    this.birthday = dateFormat.format(birthdayDate);
    this.age = calculateAge(birthdayDate);

    if (doc["birthplace"] != null) {
      //this.birthplace = doc["birthplace"]; //includes location (Geopoint) and name (String)
      Map<String, dynamic> birthplaceMap = doc["birthplace"];
      this.birthplace = Birthplace.fromMap(birthplaceMap);
    }
    //Calling map values on a null will break, so set birthplace to a map with no value if no birthplace is in the database
    else {
      this.birthplace = Birthplace();
    }

    this.bloodType = doc["bloodType"];
    this.gender = doc["gender"];
    this.height = doc["height"].toDouble();

    //wrap with this if statement when using List.from().
    if (doc["imageUrls"] != null) {
      this.imageUrls = List.from(doc["imageUrls"]);
    }
    this.kanaName = doc["kanaName"];
    this.kanjiName = doc["kanjiName"];
    this.name = doc["name"];

    if (doc["roles"] != null) {
      List<Map<String, dynamic>> rolesList = List.from(doc["roles"]);
      this.roles = Roles.fromList(rolesList);
    } else {
      this.roles = Roles();
    }

    print("Initialized Seiyuu object with the following values:");
    printInfo();
  }

  //create a map marker based on the seiyuu's birthplace location
  Marker getMarker() {
    String id = name + "-" + kanjiName + "-" + kanaName;

    return Marker(
      markerId: MarkerId("$id"),
      position: birthplace.toLatLng(),
      icon: BitmapDescriptor.defaultMarker,
    );
  }

  //get the seiyuu's age by subtracting the current date and the birthdate
  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  void printInfo() {
    print("Agency: ${agency}");
    print("Astrological Sign: ${astrologicalSign}");
    print("Birthday: ${birthday}");
    print("Birthplace: ${birthplace}");
    print("Blood Type: ${bloodType}");
    print("Gender: ${gender}");
    print("Height: ${height}");

    print("Image Urls: ");
    imageUrls.forEach((url) {
      print(url);
    });

    print("Kana Name: ${kanaName}");
    print("Kanji Name: ${kanjiName}");
    print("Name: ${name}");

    print("Roles:");
    if (roles != null) {
      roles.printInfo();
      /*roles.forEach((role) {
        print(role);
      });*/

    }
  }
}

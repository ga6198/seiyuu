import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:seiyuu/util/roles.dart';

class Seiyuu {
  String agency;
  String astrologicalSign;
  String birthday; //DateTime birthday; //Timestamp birthday;
  Map<String, dynamic>
      birthplace; //includes location (Geopoint) and name (String)
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
    this.agency = doc["agency"];
    this.astrologicalSign = doc["astrologicalSign"];

    //convert Timestamp to dateTime
    DateFormat dateFormat = DateFormat.yMMMMd("en_US");
    Timestamp time = doc["birthday"];
    DateTime birthdayDate = DateTime.parse(time.toDate().toString());
    this.birthday = dateFormat.format(birthdayDate);

    if (doc["birthplace"] != null) {
      this.birthplace =
          doc["birthplace"]; //includes location (Geopoint) and name (String)
    }
    //Calling map values on a null will break, so set birthplace to a map with no value if no birthplace is in the database
    else {
      this.birthplace = Map<String, dynamic>();
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

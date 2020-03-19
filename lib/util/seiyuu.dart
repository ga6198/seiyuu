import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Seiyuu {
  String agency;
  String astrologicalSign;
  String birthday; //DateTime birthday; //Timestamp birthday;
  Map<String, dynamic> birthplace;
  String bloodType;
  String gender;
  double height;
  List<String> imageUrls;
  String kanaName;
  String kanjiName;
  String name;
  List<String> roles;

  Seiyuu(DocumentSnapshot doc) {
    this.agency = doc["agency"];
    this.astrologicalSign = doc["astrologicalSign"];

    //convert Timestamp to dateTime
    DateFormat dateFormat = DateFormat.yMMMMd("en_US");
    Timestamp time = doc["birthday"];
    DateTime birthdayDate = DateTime.parse(time.toDate().toString());
    this.birthday = dateFormat.format(birthdayDate);

    this.birthplace =
        doc["birthplace"]; //inclues location (Geopoint) and name (String)

    this.bloodType = doc["bloodType"];
    this.gender = doc["gender"];
    this.height = doc["height"].toDouble();
    this.imageUrls = List.from(doc["imageUrls"]);
    this.kanaName = doc["kanaName"];
    this.kanjiName = doc["kanjiName"];
    this.name = doc["name"];
    //this.roles = List.from(doc["roles"]);

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
    /*roles.forEach((role) {
      print(role);
    });*/
  }
}

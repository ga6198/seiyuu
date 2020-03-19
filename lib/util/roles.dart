//Use this class to hold a seiyuu's roles
//This class allows conversion of the List of Roles into Strings

class Roles {
  List<Map<String, dynamic>> roles;

  //default constructor
  Roles() {
    this.roles = List<Map<String, dynamic>>();
  }

  //takes in a List of roles, which are maps of "character" and "work" from the database
  //To set up the roles parameter correctly, you will generally use this code: this.roles = List.from(doc["roles"]);
  Roles.fromList(List<Map<String, dynamic>> rolesList) {
    this.roles = rolesList;
  }

  //formats roles into bulleted strings. Similar to ul and li in html
  String getBulletedStrings() {
    String bulletedList = "";

    roles.forEach((role) {
      bulletedList += getBulletedString(role);
    });

    return bulletedList;
  }

  //prints the character and work, with a bullet point in front
  String getBulletedString(Map<String, dynamic> role) {
    return "• ${role['character']} (${role['work']})\n";
  }

  //print out the roles for debugging
  void printInfo() {
    roles.forEach((role) {
      print(role);
    });
  }
}

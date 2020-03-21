import 'package:flutter/material.dart';
import 'package:seiyuu/screens/seiyuu_map_screen.dart';
import 'package:seiyuu/screens/seiyuu_profiles.dart';

// A navigation drawer that guarantees the drawer will always be in the top left

class DrawerOnly extends StatelessWidget {
  const DrawerOnly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //TODO: Replace this header with profile information
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
          ),
          buildPathTile(context, "Seiyuu Profiles", SeiyuuProfiles()),
          buildPathTile(context, "Seiyuu Birthplace Map", SeiyuuMapScreen()),
          //buildPathTile(context, "Temp", )
        ],
      ),
    );
  }

  Widget buildPathTile(BuildContext context, String title, Widget targetPage) {
    return ListTile(
      title: Text('${title}'),
      onTap: () {
        //Get rid of the current page
        Navigator.pop(context);

        //Move to the next page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetPage,
          ),
        );
      },
    );
  }
}

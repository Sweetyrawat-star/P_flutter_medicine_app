import 'package:flutter/material.dart';
import 'package:medicine/theme.dart';
import 'package:medicine/utilFolder/StringUtils.dart';
import 'package:provider/provider.dart';

class DrawerUtil extends StatefulWidget {
  @override
  _DrawerUtilState createState() => _DrawerUtilState();
}

class _DrawerUtilState extends State<DrawerUtil> {
  drawerHeader() {
    return Container(
      height: 100.0,
      //color: Colors.greenAccent,
      decoration: BoxDecoration(
          color: Color(0xff74f5f3),
          border:
              Border(bottom: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: Align(
        alignment: FractionalOffset.center,
        child: ListTile(
          title: Text(
            StringUtils.needADoctor,
            style: TextStyle(fontSize: 24.0),
          ),
          subtitle: Text(StringUtils.howMayIHelpYou),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          drawerHeader(),
          SizedBox(
            height: 10.0,
          ),
          _buildDrawerItems(
            icon: Icons.done_outline,
            text: StringUtils.checkup,
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildDrawerItems(
            icon: Icons.assignment,
            text: StringUtils.oppoinment,
          ),
          SizedBox(
            height: 10.0,
          ),
          _buildDrawerItems(
            icon: Icons.info,
            text: StringUtils.information,
            onTap: () {},
          ),
          SizedBox(
            height: 6.0,
          ),
          _buildDrawerItems(
            icon: Icons.person_add,
            text: StringUtils.contactDoctor,
          ),
          SizedBox(
            height: 6.0,
          ),
          _buildDrawerItems(
            icon: Icons.brightness_2,
            text: "Change Theme",
            onTap: () {
              if (themeChanger.getTheme() == ThemeData.dark()) {
                themeChanger.setTheme(ThemeData.light());
              } else {
                themeChanger.setTheme(ThemeData.dark());
              }
            },
          ),
        ],
      ),
    );
  }

  _buildDrawerItems({IconData icon, String text, GestureTapCallback onTap,}) {
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 15.0, top: 6),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Color(0xff74f5f3),
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: themeChanger.getTheme() == ThemeData.dark()
                          ? Colors.white
                          : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }

  buildLogoutAndSettingContainers() {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      height: 50,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey[300], width: 0.5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.settings,
                  color: Color(0xff4cd1ae),
                  size: 18.0,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                 StringUtils.setting,
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
            onTap: () {},
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.exit_to_app,
                  color: Color(0xff4cd1ae),
                  size: 18.0,
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  StringUtils.logOut,
                  style: TextStyle(color: Colors.black87),
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

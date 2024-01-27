import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'PortfolioScreen.dart';
import 'themeswitch.dart';

class PortfolioDrawer extends StatefulWidget {
  final Function(bool) onThemeChanged;

  PortfolioDrawer({required this.onThemeChanged});

  @override
  _PortfolioDrawerState createState() => _PortfolioDrawerState();
}
class _PortfolioDrawerState extends State<PortfolioDrawer> {
  GlobalKey projectsKey = GlobalKey();
GlobalKey certificatesKey = GlobalKey();
GlobalKey contactMeKey = GlobalKey();

  bool isDarkMode = false; // Local state for the drawer

  @override
  Widget build(BuildContext context) {
    // Determine if dark mode is currently enabled
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return 
    Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      UserAccountsDrawerHeader( // 
        accountName: Text(
          'brahim beloucif'.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: Text(
          'L3 Student',
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_picture.jpg'),
          
        ),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('Home'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(FontAwesomeIcons.layerGroup),
        title: Text('Projects'),
       onTap: () {
   Navigator.pop(context);
              scrollToSection((context.findAncestorStateOfType<PortfolioScreenState>()?.projectsKey)!);
  },
      ),
      ListTile(
            leading: Icon(Icons.verified),
            title: Text('Certificates'),
            onTap: () {
              Navigator.pop(context);
              scrollToSection((context.findAncestorStateOfType<PortfolioScreenState>()?.certificatesKey)!);
            },
          ),
      ListTile(
        leading: Icon(Icons.contact_mail),
        title: Text('Contact Me'),
        onTap: () {
         Navigator.pop(context);
              scrollToSection((context.findAncestorStateOfType<PortfolioScreenState>()?.contactMeKey)!);
        },
      ),
               SwitchListTile(
  title: Text('Dark Mode'),
  secondary: ThemeSwitch(
    isDarkMode: isDarkMode,
    onToggle: (isOn) {
      widget.onThemeChanged(isOn); // Update the main state theme
    },
  ),
  value: isDarkMode,
  onChanged: (value) {
    setState(() {
      
      isDarkMode = value;
      widget.onThemeChanged(value);
    });
  },
),
     
    ],
  ),
);
  }
}

void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(context,
        duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }
}
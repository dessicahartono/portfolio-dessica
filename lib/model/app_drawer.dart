import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Montserrat',
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title:
                const Text('Home', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/home'); //navigate to HomePage
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title:
                const Text('About', style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about'); //navigate to AboutPage
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact',
                style: TextStyle(fontFamily: 'Montserrat')),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                  context, '/contact'); //navigate to ContactPage
            },
          ),
        ],
      ),
    );
  }
}

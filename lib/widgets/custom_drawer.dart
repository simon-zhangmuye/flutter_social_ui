import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOpiton(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOpiton(
              Icon(Icons.dashboard),
              'Home',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOpiton(
              Icon(Icons.chat),
              'Chat',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOpiton(
              Icon(Icons.location_on),
              'Map',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          _buildDrawerOpiton(
              Icon(Icons.account_circle),
              'Your Profile',
              () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProfileScreen(currentUser)))),
          _buildDrawerOpiton(
              Icon(Icons.settings),
              'Settings',
              () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOpiton(
                  Icon(Icons.directions_run),
                  'Logout',
                  () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => LoginScreen()))),
            ),
          ),
        ],
      ),
    );
  }
}

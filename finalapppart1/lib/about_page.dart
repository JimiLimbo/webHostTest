import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        centerTitle: true,  
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Jester.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), 
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'About This App',
                  style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold, fontFamily: 'Jokerman'),
                ),
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 26, 
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Welcome to '),
                      TextSpan(
                        text: 'Jokester',
                        style: TextStyle(
                          fontFamily: 'Jokerman',
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      TextSpan(
                        text: ', the ultimate destination for every programmer who appreciates a good laugh! In the world of coding, where complexities and challenges are a daily encounter, a dash of humor is not just refreshing but necessary. That is precisely what Jokester brings to your fingertips, an endless stream of jokes tailored for the programming community.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 155), 
                Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.black), 
                    children: <TextSpan>[
                      TextSpan(text: 'Developed By '),
                      TextSpan(
                        text: 'Seth Caster',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange), 
                      ),
                      TextSpan(text: ' for CMSC 2204'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


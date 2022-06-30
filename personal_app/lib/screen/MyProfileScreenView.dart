import 'package:flutter/material.dart';

import 'package:personal_app/screen/MessagesBoardScreenView.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProfileScreenView extends StatefulWidget {
  const MyProfileScreenView({Key? key}) : super(key: key);

  @override
  State<MyProfileScreenView> createState() => MyProfileScreenViewState();
}

class MyProfileScreenViewState extends State<MyProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 88,
                backgroundColor: Color(0xFFbdffd7),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2013/05/11/08/28/sunset-110305_1280.jpg'),
                  radius: 80,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Text(
                "Araz Zuher Mohammed",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 101,
              width: 257,
              child: Text(
                "Solving problems, learning something new and improving knowledge, skills and abilities are my passions.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://www.linkedin.com/in/araz-zuher-4a7630240");
                    },
                    child: Card(
                      color: Color(0xFFF3F2FF),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.linkedinIn),
                        title: Center(child: Text("LinkedIn Profile")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl(
                          "https://www.facebook.com/araz.lawe");
                    },
                    child: Card(
                      color: Color(0xFFC7E4FF),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.facebook),
                        title: Center(child: Text("Facebook Profile")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://www.instagram.com/invites/contact/?i=120l65nr7jiu0&utm_content=49b0qts");
                    },
                    child: Card(
                      color: Color(0xFFFFF2F2),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.instagram),
                        title: Center(child: Text("Instagram Profile")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl("https://github.com/ArazZuher22");
                    },
                    child: Card(
                      color: Color(0xFFFFFBF2),
                      child: ListTile(
                        leading: Icon(FontAwesomeIcons.globe),
                        title: Center(child: Text("My Website")),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Icon(FontAwesomeIcons.solidEnvelope)
                      //Icon(FontAwesomeIcons.solidMessage)
                      //Icon(FontAwesomeIcons.whatsapp)
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFFF3F2FF),
                          child: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                          radius: 25,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFFF3F2FF),
                          child: Icon(
                            FontAwesomeIcons.solidEnvelope,
                            color: Colors.grey,
                          ),
                          radius: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MessagesBoardScreenView(),
                            ));
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFFFF2F2),
                            child: Icon(
                              FontAwesomeIcons.solidMessage,
                              color: Color.fromARGB(255, 1, 214, 243),
                            ),
                            radius: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _launchUrl(String vistUrl) async {
  if (!await launchUrl(Uri.parse(vistUrl))) throw 'Could not launch ';
}

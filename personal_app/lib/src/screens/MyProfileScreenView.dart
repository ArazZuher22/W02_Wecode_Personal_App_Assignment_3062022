
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_app/src/screens/LoginScreenView.dart';
import 'package:personal_app/src/screens/MessagesAnonymousScreenView.dart';
import '../widgets/link_card_widget.dart';



class MyProfileScreenView extends StatefulWidget {
  const MyProfileScreenView({Key? key}) : super(key: key);

  @override
  State<MyProfileScreenView> createState() => _MyProfileScreenViewState();
}

class _MyProfileScreenViewState extends State<MyProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(5),
                    
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFFFF2F2),
                            style: BorderStyle.solid,
                            width: 2.0,
                        ),
                        color: const Color(0xFFFFF2F2),

                        borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextButton(
                      onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreenView(),
                            ));
                      },
                      child: const Text('Login',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        
                      ),),
                    ),
                  ),
                ),

              ],
            ),
            Container(
              alignment: Alignment.topCenter,
              child: const CircleAvatar(
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
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: const Text(
                "Araz Zuher Mohammed",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
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
              margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Column(
                children: [
                  LinkCardWidget().rectangleCard(
                    url: "https://www.linkedin.com/in/araz-zuher-4a7630240",
                    cardColor: const Color(0xFFF3F2FF),
                    cardName: "LinkedIn Profile",
                    cardIcon: const Icon(FontAwesomeIcons.linkedinIn),
                  ),

                  LinkCardWidget().rectangleCard(
                    url: "https://www.facebook.com/araz.lawe",
                    cardColor: const Color(0xFFC7E4FF),
                    cardName: "Facebook Profile",
                    cardIcon: const Icon(FontAwesomeIcons.facebook),
                  ),

                  LinkCardWidget().rectangleCard(
                    url: "https://www.instagram.com/invites/contact/?i=120l65nr7jiu0&utm_content=49b0qts",
                    cardColor: const Color(0xFFFFF2F2),
                    cardName: "Instagram Profile",
                    cardIcon: const Icon(FontAwesomeIcons.instagram),
                  ),

                  LinkCardWidget().rectangleCard(
                    url: "https://github.com/ArazZuher22",
                    cardColor: const Color(0xFFFFFBF2),
                    cardName: "My Website",
                    cardIcon: const Icon(FontAwesomeIcons.globe),
                  ),

                  
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        LinkCardWidget().circularCard(
                          url: "tel:+9747515391409",
                          cardColor: const Color(0xFFF3F2FF),
                          cardIcon: const Icon(FontAwesomeIcons.whatsapp,color: Colors.green,),
                        ),
                        LinkCardWidget().circularCard(
                          url: "mailto:arazzuher2@gmail.com",
                          cardColor: const Color(0xFFF3F2FF),
                          cardIcon: const Icon(FontAwesomeIcons.solidEnvelope,color: Colors.grey,),
                        ),

                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MessagesAnonymousScreenView(),
                            ));
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xFFFFF2F2),
                            radius: 25,
                            child: Icon(
                              FontAwesomeIcons.solidMessage,
                              color: Color.fromARGB(255, 1, 214, 243),
                            ),
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
      
    );
  }
}

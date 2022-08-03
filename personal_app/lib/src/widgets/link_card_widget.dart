import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCardWidget {
  
  
  Widget rectangleCard(
    {required String url,
      required String cardName,
      required Color cardColor,
      required Icon cardIcon,}
  ) {
    return GestureDetector(
      onTap: () {
        _launchUrl(url);
      },
      child: Card(
        color: cardColor,
        child: ListTile(
          leading: cardIcon,
          title: Center(child: Text(cardName)),
        ),
      ),
    );
  }


  Widget circularCard({
      required String url,
      required Color cardColor,
      required Icon cardIcon,
      }){
        return  GestureDetector(
                          onTap: () {
                            _launchUrl(url);
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xFFF3F2FF),
                            child: cardIcon,
                            radius: 25,
                          ),
                        );
  }


  void _launchUrl(String vistUrl) async {
    if (!await launchUrl(Uri.parse(vistUrl))) throw 'Could not launch ';
  }
}

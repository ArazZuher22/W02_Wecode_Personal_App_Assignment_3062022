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

  Widget textLinkCard({
      required String url,
      required String text,
      required Color textColor,
      required int textSize,
      }){
        return  GestureDetector(
                          onTap: () {
                            _launchUrl(url);
                          },
                          child: Text(text,style: TextStyle(
                            color: textColor,
                            fontSize: textSize.toDouble(),
                          ),)
                        );
  }
  void _launchUrl(String vistUrl) async {
    if (!await launchUrl(Uri.parse(vistUrl))) throw 'Could not launch ';
  }
}

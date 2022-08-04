import 'package:flutter/material.dart';
import 'package:personal_app/src/widgets/link_card_widget.dart';

// ignore: must_be_immutable
class MessageCardWidget extends StatelessWidget {
  String messageName;
  String messageDetails;
  bool? haveLink = false;
  String? linkText;
  String? linkURL;

  MessageCardWidget({
    Key? key,
    required this.messageName,
    required this.messageDetails,
    this.haveLink,
    this.linkURL,
    this.linkText,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(13),
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Color(0xff12bf42)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: const Color(0xfff6f6f6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            messageName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          haveLink == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      messageDetails,
                      style: const TextStyle(
                        color: Color(0xff777777),
                        fontSize: 12,
                      ),
                    ),
                    LinkCardWidget().textLinkCard(
                      url: linkURL!,
                      text: linkText!,
                      textColor: const Color(0xff12bf42),
                      textSize: 16,
                    ),
                  ],
                ): Text(
                  messageDetails,
                  style: const TextStyle(
                    color: Color(0xff777777),
                    fontSize: 12,
                  ),
                ),
        ],
      ),
    );
  }
}

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/auth_with_google.dart';
import '../services/message_database.dart';
import '../widgets/message_card_widget.dart';
import '../widgets/textfieldform_widget.dart';

class MessageCompanyScreenView extends StatefulWidget {
  const MessageCompanyScreenView({Key? key, required this.user})
      : super(key: key);
  final User user;
  @override
  State<MessageCompanyScreenView> createState() => _MessageCompanyScreenView();
}

class _MessageCompanyScreenView extends State<MessageCompanyScreenView> {
  final _companyOrgController = TextEditingController();
  final _roleController = TextEditingController();
  final _urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 86, 168, 109),
        title: const Center(child: Text('Company Messages')),
        actions: [
          Container(
            padding: const EdgeInsets.fromLTRB(2, 2, 6, 2),
            child: InkWell(
              child: const Icon(Icons.logout),
              onTap: () {
                Authentication.signOut(context: context);
                debugPrint('sign out worked ');
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 15, 25, 0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(50,0, 50, 10),
                        child: Text(
                          'Wellcome ${widget.user.displayName.toString()}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                    ),
                    Container(width: 75,height: 5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.black),),
                    Expanded(
                      child: SizedBox(
                        height: 240,
                        child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          future: DatabaseOperation().readTheMessagesCompaynDocument(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox(
                                height: 45,
                                width: 45,
                                child: CircularProgressIndicator(
                                    color: Color(0xff12bf42)),
                              );
                            } else if (snapshot.hasError) {
                              return Text('err ${snapshot.error}');
                            } else if (snapshot.data == null) {
                              return const Text('no Data');
                            }

                            return ListView.builder(
                              reverse: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return MessageCardWidget(
                                  messageName: snapshot.data!.docs[index].data()['companyOrg'].toString(),
                                  messageDetails: snapshot.data!.docs[index].data()['role'].toString(),
                                  haveLink: true,
                                  linkURL: snapshot.data!.docs[index].data()['url'].toString(),
                                  linkText: 'link',
                                );
                                
                              },
                            );
                          
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 5),
            Container(
              height: 250,
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'SEND ME A MESSAGE',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            labelTextField: 'COMPANY/ORG',
                            nameController: _companyOrgController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            labelTextField: 'ROLE',
                            nameController: _roleController,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: TextFormFieldWidget(
                          labelTextField: 'URL',
                          nameController: _urlController,
                        )),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          width: 50,
                          child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate() == true) {
                                  debugPrint('form validated');
                                  debugPrint("message send......");
                                  setState(() {
                                    buttonFlag = true;
                                  });
                                  await DatabaseOperation()
                                      .addAMessageCompanyToTheDB(
                                              companyorg: _companyOrgController.text,
                                              role: _roleController.text,
                                              url: _urlController.text,
                                              user: widget.user,
                                      )
                                      .then((value) => debugPrint(value.path));
                                  setState(() {
                                    buttonFlag = false;
                                  });
                                } else {
                                  debugPrint('form not validated');
                                }
                              },
                              child: buttonFlag == false
                                  ? const Icon(
                                      FontAwesomeIcons.solidPaperPlane,
                                      color: Color(0xFF00FF85),
                                    )
                                  : const SizedBox(
                                      height: 45,
                                      width: 45,
                                      child: CircularProgressIndicator(
                                        color: Color(0xff12bf42),
                                      ),
                                    )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

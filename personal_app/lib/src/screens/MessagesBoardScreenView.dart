import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../services/message_database.dart';
import '../widgets/message_card_widget.dart';
import '../widgets/textfieldform_widget.dart';

class MessagesBoardScreenView extends StatefulWidget {
  const MessagesBoardScreenView({Key? key}) : super(key: key);

  @override
  State<MessagesBoardScreenView> createState() =>
      MessagesBoardScreenViewState();
}

class MessagesBoardScreenViewState extends State<MessagesBoardScreenView> {
  
  final _nameController = TextEditingController();
  final _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonFlag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.fromLTRB(50, 50, 50, 10),
                        child: const Text(
                          'MESSAGES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )),
                    SizedBox(
                      height: 320,
                      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        future: DatabaseOperation().readTheMessagesDocument(),
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
                                messageName: snapshot.data!.docs[index].data()['userName'].toString(),
                                messageDetails: snapshot.data!.docs[index].data()['userMessage'].toString(),
                              );
                              
                            },
                          );
                        },
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
                          child:TextFormFieldWidget(
                            labelTextField: 'MESSAGE',
                            nameController: _messageController,
                            messageFlag: true,
                            ), 
                          ),
                      
                        
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormFieldWidget(
                            labelTextField: 'NAME',
                            nameController: _nameController,
                            )
                        ),
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
                                  await DatabaseOperation().addAMessageToTheDB(
                                          name: _nameController.text,
                                          message: _messageController.text)
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

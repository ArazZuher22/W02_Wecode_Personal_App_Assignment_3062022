
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/src/screens/LoginScreenView.dart';
import 'package:personal_app/src/screens/RegisterScreenView.dart';
import 'package:personal_app/src/widgets/google_sign_in_button.dart';

import '../services/auth_with_google.dart';
import '../widgets/textfieldform_widget.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({Key? key}) : super(key: key);

  @override
  State<RegisterScreenView> createState() => _RegisterScreenView();
}

class _RegisterScreenView extends State<RegisterScreenView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 86, 168, 109),
        ),
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40,), 
                Container(
                              margin: const EdgeInsets.fromLTRB(50, 50, 50, 10),
                              child: const Text(
                                'Create account',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              )
                  ),
                const SizedBox(height: 60,), 
                Row(
                  children: [
                    Expanded(
                      child:
                      Container(
                        padding: const EdgeInsets.all(10),
                        child:TextFormFieldWidget(
                              labelTextField: 'User Name',
                              nameController: _nameController,
                            ), 
                        ),
                    )       
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                      Container(
                        padding: const EdgeInsets.all(10),
                        child:TextFormFieldWidget(
                              labelTextField: 'Password',
                              nameController: _passwordController,
                              isPasswordFlag: true,
                            ), 
                        ),
                    )       
                  ],
                ),
            
                  const SizedBox(height: 25,),
                  Container(
                    width: 150,
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 86, 168, 109),
                      ),
                      child: const Text('Register'),
                      onPressed: () async { 
                        if (_formKey.currentState!.validate() == true) {
                        debugPrint('form validated');
                        User? _user =
                          await Authentication.registerWithEmailAndPassword(_nameController.text, _passwordController.text);
                            debugPrint(_passwordController.text);
                          } else {
                            debugPrint('form not validated');
                          }                       
                        
                      },
                    )),
                  
                  const SizedBox(height: 25,),
                  GoogleSignInButton(),

                  const SizedBox(height: 40,),

                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Already have account'),
                    TextButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color.fromARGB(255, 86, 168, 109),
                          fontSize: 20),
                      ),
                      onPressed: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreenView()),
                        );
                      },
                    ),
                  
                    
                  ],
                ),
                
              
              ],
            ),
          ),
        
    );
  }
  
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_app/src/screens/MessagesCompanyScreen.dart';
import 'package:personal_app/src/screens/RegisterScreenView.dart';
import 'package:personal_app/src/services/auth_with_google.dart';

import '../widgets/google_sign_in_button.dart';
import '../widgets/textfieldform_widget.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  State<LoginScreenView> createState() => _LoginScreenView();
}

class _LoginScreenView extends State<LoginScreenView> {
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
            const SizedBox(
              height: 40,
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(50, 50, 50, 10),
                child: const Text(
                  'User Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                )),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormFieldWidget(
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
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormFieldWidget(
                      labelTextField: 'Password',
                      nameController: _passwordController,
                      isPasswordFlag: true,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                width: 150,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 86, 168, 109),
                  ),
                  child: const Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate() == true) {
                      debugPrint('form validated');
                      User? _user =
                          await Authentication.loginWithUserAndPassword(
                            email:_nameController.text,
                            password: _passwordController.text
                          );

                      debugPrint('this is run ');
                      debugPrint(_nameController.text);
                      debugPrint(_passwordController.text);

                      if (_user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => MessageCompanyScreenView(
                              user: _user,
                            ),
                          ),
                        );
                      }
                    } else {
                      debugPrint('form not validated');
                      
                    }
                  },
                )),
            const SizedBox(
              height: 25,
            ),
            GoogleSignInButton(),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Color.fromARGB(255, 86, 168, 109), fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreenView()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

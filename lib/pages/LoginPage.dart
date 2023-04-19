import 'package:chat_two/Constans.dart';
import 'package:chat_two/widgets/CoustomTexTBottom.dart';
import 'package:chat_two/widgets/CoustomTextFild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widget_helpers/ShowSnakPar.dart';
import 'ChatPage.dart';
import 'RegesterPage.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String Id = 'LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  GlobalKey<FormState> FormKey = GlobalKey();
  bool IsLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoading,
      child: Scaffold(
        backgroundColor: Kprimary_Color,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: FormKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                Center(
                  child: Image.asset('Assets/images/scholar.png'),
                ),
                Center(
                  child: Text(
                    'sholarChat ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'pacifico',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                CoustomTextFormFild(
                  hentText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CoustomTextFormFild(
                  hentText: 'password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                CoustomTextBouttom(
                  TextBottom: 'Login',
                  ONtaped: () async {
                    if (FormKey.currentState!.validate()) {
                      IsLoading = true;
                      setState(() {});
                      try {
                        await LoginMethod();
                        Navigator.pushNamed(
                          context,
                          ChatPage.Id,
                          arguments: email,
                        );
                        // SnackbarMethod(context, 'You joind us now');
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'email-already-in-use') {
                          SnackbarMethod(context, 'email-already-in-use');
                        } else if (ex.code == 'weak-password') {
                          SnackbarMethod(context, 'weak-password');
                        }
                      }
                      IsLoading = false;
                      setState(() {});
                    } else {}
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have a account ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.Id);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginMethod() async {
    UserCredential User =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}

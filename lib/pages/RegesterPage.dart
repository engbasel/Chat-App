import 'package:chat_two/pages/ChatPage.dart';
import 'package:chat_two/pages/LoginPage.dart';
import 'package:chat_two/widgets/CoustomTexTBottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Constans.dart';
import '../widget_helpers/ShowSnakPar.dart';
import '../widgets/CoustomTextFild.dart';

class RegisterPage extends StatefulWidget {
  static String Id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? password;
  String? email;
  bool IsLoading = false;
  GlobalKey<FormState> FormKey = GlobalKey();
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
                  height: 100,
                ),
                Spacer(
                  flex: 1,
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
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                CoustomTextFormFild(
                  onChanged: (DataUser) {
                    email = DataUser;
                  },
                  hentText: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                CoustomTextFormFild(
                  onChanged: (DataUser) {
                    password = DataUser;
                  },
                  hentText: 'password',
                ),
                SizedBox(
                  height: 30.0,
                ),
                CoustomTextBouttom(
                  ONtaped: () async {
                    if (FormKey.currentState!.validate()) {
                      IsLoading = true;
                      setState(() {});
                      // Navigator.pushNamed(context, ChatPage.Id);
                      try {
                        await Register_user();
                        // SnackbarMethod(context, 'You joind us now');
                        Navigator.pushNamed(
                          context,
                          ChatPage.Id,
                          arguments: email,
                        );
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
                  TextBottom: 'Register',
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have a acount ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.Id);
                      },
                      child: Text(
                        'login',
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

  Future<void> Register_user() async {
    UserCredential User = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}

import 'package:chat_two/Constans.dart';
import 'package:chat_two/widgets/CoustomTexTBottom.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String Id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kprimary_Color,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(KLogo_App),
            Text(
              'Welcom in your app ',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'pacifico',
              ),
            ),
            CoustomTextBouttom(
              ONtaped: () {
                Navigator.pushNamed(context, 'LoginPage');
              },
              TextBottom: 'Login',
            ),
            CoustomTextBouttom(
              ONtaped: () {
                Navigator.pushNamed(context, 'RegisterPage');
              },
              TextBottom: 'Register',
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}

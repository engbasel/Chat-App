import 'package:chat_two/Constans.dart';
import 'package:chat_two/pages/Homepage.dart';
import 'package:chat_two/pages/LoginPage.dart';
import 'package:chat_two/widgets/coustmchatpubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Models/MassageModel.dart';

class ChatPage extends StatelessWidget {
  final _scrollController = ScrollController();
  static String Id = 'ChatPage';
  TextEditingController eControlloerSendMassag = TextEditingController();
  String? message;

  get dataMassage => null;
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    CollectionReference Massages =
        FirebaseFirestore.instance.collection(KColoectionData);
    return StreamBuilder<QuerySnapshot>(
      stream: Massages.orderBy(KCreatedAt).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MassageModel> MassageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            MassageList.add(
              MassageModel.fromJson(snapshot.data!.docs[i]),
            );
          }
          // print(snapshot.data!.docs[0][Massages]);
          return Scaffold(
            backgroundColor: Color(0xFFF213655),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('HomePage');
                    },
                    icon: Icon(Icons.home),
                  ),
                ),
              ],
              backgroundColor: Kprimary_Color,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 55.0,
                  ),
                  Image.asset(KLogo_App, scale: 2.0),
                  Text('Chat'),
                  SizedBox(width: 25.0),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: MassageList.length,
                    itemBuilder: (context, index) {
                      return MassageList[index].id == email
                          ? CoustomChatbuble(
                              MassageText: MassageList[index],
                            )
                          : CoustomChatFrind(
                              MassageText: MassageList[index],
                            );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Get data from dataMassage and save it in String message;
                  child: TextField(
                    controller: eControlloerSendMassag,
                    onChanged: (dataMassage) {
                      message = dataMassage;
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: 'Send your massage ',
                      hintStyle: TextStyle(color: Colors.white),
                      suffixIcon: IconButton(
                          onPressed: () {
                            Massages.add({
                              KMassageSendTo_db: message,
                              KCreatedAt: DateTime.now(),
                              Kid: email
                            });
                            eControlloerSendMassag.clear();
                            // ------- After Make clear to chat box scrool down -----------
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              // curve: Curves.easeOut to change shape of move in chat
                              curve: Curves.easeOut,
                              duration: Duration(milliseconds: 10),
                            );

                            // ------here
                          },
                          icon: Icon(Icons.send)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Kprimary_Color,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return ModalProgressHUD(
              inAsyncCall: true,
              child: Scaffold(
                backgroundColor: Kprimary_Color,
              ));
        }
        ;
      },
    );
  }
}

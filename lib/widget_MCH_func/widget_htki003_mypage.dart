// ignore_for_file: camel_case_types, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import '../../dictionary/dictionary_const.dart';
import 'package:firebase_auth/firebase_auth.dart';

class widget_htki003_mypage extends StatefulWidget {
  const widget_htki003_mypage({super.key});

  @override
  State<widget_htki003_mypage> createState() => _widget_htki003_mypage();
}

class _widget_htki003_mypage extends State<widget_htki003_mypage> {
  // 入力されたメールアドレス
  String input_mailAddress = "";
  // 入力されたパスワード
  String input_Password = "";
  // 登録・ログインに関する情報を表示
  String infoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage('images/background_test.png'),
                //   fit: BoxFit.fill,
                // ),
                ),
          ),
          //戻るボタン
          Column(
            children: [
              SafeArea(
                child: TextButton(
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                  ),
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              )
            ],
          ),

          //フォーム
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //「ログイン」テキスト
                    Text(
                      MD003,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(height: 20),
                    getUserIDField(MD001),
                    const SizedBox(height: 20),
                    getPasswordField(MD002),
                    ElevatedButton(
                      child: const Text(MD003),
                      onPressed: () async {
                        if (input_mailAddress == "" || input_Password == "") {
                          setState(() {
                            infoText = ME002;
                          });
                        } else {
                          try {
                            // メール/パスワードでユーザー登録
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final UserCredential result =
                                await auth.createUserWithEmailAndPassword(
                              email: input_mailAddress,
                              password: input_Password,
                            );

                            // 登録したユーザー情報
                            final User user = result.user!;

                            //画面をポップする
                            Navigator.of(context).pop(true);
                          } catch (e) {
                            // 登録に失敗した場合
                            setState(() {
                              infoText = ME003;
                            });
                          }
                        }
                      },
                    ),
                    Text(
                      infoText,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /*******************************
 * private method
 ******************************/

//テキストフィールドを返します。
  TextField getUserIDField(String X_HINT) {
    var returnTextField = TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(),
        hintText: X_HINT,
      ),
      onChanged: (String value) {
        setState(() {
          input_mailAddress = value;
        });
      },
    );
    return returnTextField;
  }

  TextField getPasswordField(String X_HINT) {
    var returnTextField = TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.password),
        border: OutlineInputBorder(),
        hintText: X_HINT,
      ),
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          input_Password = value;
        });
      },
    );
    return returnTextField;
  }
}

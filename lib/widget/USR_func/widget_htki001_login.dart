import 'package:flutter/material.dart';
import '../../dictionary/dictionary_const.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'widget_htki002_register.dart';

class widget_htki001_Login extends StatefulWidget {
  const widget_htki001_Login({super.key});

  @override
  State<widget_htki001_Login> createState() => _widget_htki001_Login();
}

class _widget_htki001_Login extends State<widget_htki001_Login> {
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
          //通常表示するウェジェット
          Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //「ログイン」テキスト
                    Text(
                      MD004,
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),

                    const SizedBox(height: 20),

                    //「メールアドレス」テキストボックス
                    getUserIDField(MD001),

                    const SizedBox(height: 20),

                    //「パスワード」テキストボックス
                    getPasswordField(MD002),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //「ログイン」ボタン
                        ElevatedButton(
                          child: Text(MD004),
                          onPressed: () async {
                            if (input_mailAddress == "" ||
                                input_Password == "") {
                              setState(() {
                                infoText = ME002;
                              });
                            } else {
                              try {
                                // メール/パスワードでログイン
                                final FirebaseAuth auth = FirebaseAuth.instance;
                                final UserCredential result =
                                    await auth.signInWithEmailAndPassword(
                                  email: input_mailAddress,
                                  password: input_Password,
                                );
                                // ログインに成功した場合
                                final User user = result.user!;
                                setState(() {
                                  infoText = "ログインOK：${user.email}";
                                });
                              } catch (e) {
                                // ログインに失敗した場合
                                setState(() {
                                  infoText = "ログインNG：${e.toString()}";
                                });
                              }
                            }
                          },
                        ),
                        const SizedBox(width: 20),
                        //「ユーザー登録」ボタン
                        TextButton(
                          child: Text(
                            MD003,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // ユーザー登録画面へ遷移
                                    builder: (context) =>
                                        const widget_htki002_Register()));
                          },
                        ),
                      ],
                    ),
                    Text(infoText),
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
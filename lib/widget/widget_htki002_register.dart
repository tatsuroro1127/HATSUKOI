import 'package:flutter/material.dart';
import '../dictionary/dictionary_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class widget_htki002_Register extends StatefulWidget {
  const widget_htki002_Register({super.key});

  @override
  State<widget_htki002_Register> createState() => _widget_htki002_register();
}

class _widget_htki002_register extends State<widget_htki002_Register> {
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
                    Navigator.of(context).pop();
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
                            setState(() {
                              infoText = "登録OK：${user.email}";
                            });
                          } catch (e) {
                            // 登録に失敗した場合
                            setState(() {
                              infoText = ME001;
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

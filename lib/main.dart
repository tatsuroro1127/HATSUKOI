// ignore_for_file: slash_for_doc_comments

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'dictionary/dictionary_const.dart';

/**********************************************
 * Main関数
 *********************************************/
void main() async {
  //runAppの前にFireBase変数を初期化する
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //アプリを実行
  runApp(const ApplicationHatsukoi());
}

/***********************************************
 * アプリの既定クラス。
***********************************************/
class ApplicationHatsukoi extends StatelessWidget {
  const ApplicationHatsukoi({super.key});

  @override
  Widget build(BuildContext context) {
    return materialDesign;
  }
}

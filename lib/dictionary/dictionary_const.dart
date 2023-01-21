import 'package:flutter/material.dart';
import '../widget/USR_func/widget_htki001_login.dart';

var materialDesign = const MaterialApp(
  home: widget_htki001_Login(),
);

const MD001 = "メールアドレス";
const MD002 = "パスワード";
const MD003 = "ユーザー登録";
const MD004 = "ログイン";
const MD005 = "マイページ";

const MD101 = "ユーザー登録を行いました。\nログインしてください。";

const ME001 = "ログインできませんでした。\nメールアドレス、もしくはパスワードが間違っています。";
const ME002 = "メールアドレス、もしくはパスワードが入力されていません。";
const ME003 = "ユーザー登録ができませんでした。";
const ME004 = "入力したメールアドレスはすでに登録されています。";
const ME005 = "メールアドレスの形式が正しくありません。";
const ME006 = "パスワードは6文字以上にしてください。";

String getErrorMsgOnFireBase(String x_ErrorCd) {
  String returnVal = "";
  switch (x_ErrorCd) {
    case 'email-already-in-use':
      returnVal = ME004;
      break;
    case 'invalid-email':
      returnVal = ME005;
      break;
    case 'weak-password':
      returnVal = ME006;
      break;
  }
  return returnVal;
}

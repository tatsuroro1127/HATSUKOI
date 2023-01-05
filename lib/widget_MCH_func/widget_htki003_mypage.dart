// ignore_for_file: camel_case_types, non_constant_identifier_names, sort_child_properties_last, slash_for_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class widget_htki003_mypage extends StatefulWidget {
  const widget_htki003_mypage({super.key});

  @override
  State<widget_htki003_mypage> createState() => _widget_htki003_mypage();
}

class _widget_htki003_mypage extends State<widget_htki003_mypage> {
  late File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      createNewButton(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  /*******************************
 * private method
 ******************************/
  InkWell createNewButton() {
    var button = InkWell(
      onTap: () {
        _getImage();
      },
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        // child: Image.file(_image),
      ),
    );
    return button;
  }

  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
}

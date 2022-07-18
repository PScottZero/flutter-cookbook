import 'package:cookbook/constants/view_constants.dart';
import 'package:cookbook/model/app_model.dart';
import 'package:cookbook/views/all_recipes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: ViewConstants.primaryColor,
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppModel(),
      child: const Cookbook(),
    ),
  );
}

class Cookbook extends StatelessWidget {
  const Cookbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookbook',
      theme: ThemeData(
        fontFamily: GoogleFonts.comfortaa().fontFamily,
        primarySwatch: ViewConstants.primaryColor,
      ),
      home: const AllRecipesView(),
    );
  }
}

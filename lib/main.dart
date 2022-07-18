import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'model/app_model.dart';
import 'views/all_recipes_view.dart';

void main() {
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
    return Consumer<AppModel>(
      builder: (context, model, child) => MaterialApp(
        title: 'Cookbook',
        theme: ThemeData(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
          primarySwatch: model.theme,
        ),
        debugShowCheckedModeBanner: false,
        home: const AllRecipesView(),
      ),
    );
  }
}

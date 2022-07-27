import 'package:cookbook/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Color appBarColor;
  final Color appBarTextColor;
  final Color backgroundColor;
  final List<Widget>? appBarActions;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    Key? key,
    required this.title,
    required this.body,
    required this.appBarColor,
    required this.appBarTextColor,
    required this.backgroundColor,
    this.appBarActions,
    this.floatingActionButton,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(color: appBarTextColor),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: appBarColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarColor,
        ),
        actions: appBarActions,
        iconTheme: IconThemeData(color: appBarTextColor),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: SearchBar(),
        ),
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: body,
    );
  }
}

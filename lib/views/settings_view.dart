import 'package:cookbook/components/confirm_cancel_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/header.dart';
import '../components/rounded_button.dart';
import '../components/theme_chooser.dart';
import '../constants/view_constants.dart';
import '../model/app_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  BuildContext? buildContext;

  void _showSnackbar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );

  void _showLoadingIndicator(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(ViewConstants.largeBorderRadius),
          ),
          child: const SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );

  void _backupRecipes(AppModel model) => showDialog(
        context: context,
        builder: (context) => ConfirmCancelDialog(
          title: 'Backup Recipes',
          color: model.theme,
          message: 'Are you sure you want to backup your recipes? '
              'Any existing backup will be overwritted.',
          confirmAction: 'Backup',
          onConfirmed: () async {
            Navigator.pop(buildContext!);
            if (buildContext != null) {
              _showLoadingIndicator(buildContext!);
              var result = await model.backupRecipes();
              Navigator.pop(buildContext!);
              _showSnackbar(buildContext!, result);
            }
          },
        ),
      );

  void _restoreRecipes(AppModel model) => showDialog(
        context: context,
        builder: (context) => ConfirmCancelDialog(
          title: 'Restore Recipes',
          color: model.theme,
          message:
              'Are you sure you want to restore your recipes from a backup? '
              'Any existing recipes in the app will be deleted.',
          confirmAction: 'Restore',
          onConfirmed: () async {
            Navigator.pop(buildContext!);
            if (buildContext != null) {
              _showLoadingIndicator(buildContext!);
              var result = await model.restoreRecipes();
              Navigator.pop(buildContext!);
              _showSnackbar(buildContext!, result);
            }
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        buildContext = context;
        return CustomScaffold(
          title: 'Settings',
          body: ListView(
            children: [
              ThemeChooser(selectedTheme: model.theme),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    text: 'Backup/Restore',
                    color: model.theme,
                  ),
                  RoundedButton(
                    text: 'Backup Recipes',
                    color: model.theme,
                    padding: true,
                    onPressed: () => _backupRecipes(model),
                  ),
                  RoundedButton(
                    text: 'Restore Recipes',
                    color: model.theme,
                    padding: true,
                    onPressed: () => _restoreRecipes(model),
                  ),
                ],
              ),
            ],
          ),
          appBarColor: model.primaryColor,
          appBarTextColor: model.accentColor,
          backgroundColor: model.accentColor,
        );
      },
    );
  }
}

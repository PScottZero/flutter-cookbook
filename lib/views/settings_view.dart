import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/confirm_cancel_dialog.dart';
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
  AppModel? _model;
  BuildContext? _context;

  void _backupRecipes() => showDialog(
        context: context,
        builder: (context) => ConfirmCancelDialog(
          title: 'Backup Recipes',
          backgroundColor: _model!.theme.accentColor1,
          message: 'Are you sure you want to backup your recipes? '
              'Any existing backup will be overwritted.',
          confirmText: 'Backup',
          onConfirmed: () async {
            Navigator.pop(_context!);
            if (_context != null) {
              _showLoadingIndicator();
              var result = await _model!.backupRecipes();
              Navigator.pop(_context!);
              _showSnackbar(_context!, result);
            }
          },
        ),
      );

  void _restoreRecipes() => showDialog(
        context: _context!,
        builder: (context) => ConfirmCancelDialog(
          title: 'Restore Recipes',
          backgroundColor: _model!.theme.accentColor1,
          message:
              'Are you sure you want to restore your recipes from a backup? '
              'Any existing recipes in the app will be deleted.',
          confirmText: 'Restore',
          onConfirmed: () async {
            Navigator.pop(_context!);
            if (_context != null) {
              _showLoadingIndicator();
              var result = await _model!.restoreRecipes();
              Navigator.pop(_context!);
              _showSnackbar(_context!, result);
            }
          },
        ),
      );

  void _showLoadingIndicator() => showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (context) => Dialog(
          backgroundColor: _model!.theme.accentColor1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ViewConstants.largeBorderRadius,
            ),
          ),
          child: const SizedBox(
            height: ViewConstants.progressBarHeight,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );

  void _showSnackbar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) {
        _model = model;
        _context = context;
        return CustomScaffold(
          title: 'Settings',
          appBarColor: model.theme.primaryColor,
          appBarTextColor: model.theme.accentColor1,
          backgroundColor: model.theme.accentColor1,
          body: ListView(
            children: [
              const ThemeChooser(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                      text: 'Backup/Restore',
                      textColor: model.theme.primaryColor),
                  RoundedButton(
                    text: 'Backup Recipes',
                    theme: model.theme,
                    padding: true,
                    onPressed: _backupRecipes,
                  ),
                  RoundedButton(
                    text: 'Restore Recipes',
                    theme: model.theme,
                    padding: true,
                    onPressed: _restoreRecipes,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

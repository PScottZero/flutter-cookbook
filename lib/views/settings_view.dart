import 'package:cookbook/components/backup_restore.dart';
import 'package:cookbook/components/theme_chooser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../model/app_model.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => CustomScaffold(
        title: 'Settings',
        body: ListView(
          children: [
            ThemeChooser(selectedTheme: model.theme),
            BackupRestore(backupButtonColor: model.theme),
          ],
        ),
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
      ),
    );
  }
}

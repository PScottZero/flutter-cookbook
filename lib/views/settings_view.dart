import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/custom_scaffold.dart';
import '../components/rounded_button.dart';
import '../components/theme_chooser.dart';
import '../constants/view_constants.dart';
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(ViewConstants.smallPadding),
                  child: Text(
                    'Backup/Restore',
                    style: TextStyle(
                      fontSize: ViewConstants.smallFont,
                      color: model.primaryColor,
                    ),
                  ),
                ),
                RoundedButton(
                  text: 'Backup Recipes',
                  color: model.theme,
                  padding: true,
                  onPressed: () => model.backupRecipes(),
                ),
                RoundedButton(
                  text: 'Restore Recipes',
                  color: model.theme,
                  colorCode: 700,
                  padding: true,
                  onPressed: () => model.restoreRecipes(),
                ),
              ],
            ),
          ],
        ),
        appBarColor: model.primaryColor,
        appBarTextColor: model.accentColor,
        backgroundColor: model.accentColor,
      ),
    );
  }
}

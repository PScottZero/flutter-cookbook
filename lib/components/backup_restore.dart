import 'package:cookbook/components/rounded_button.dart';
import 'package:cookbook/model/app_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';

class BackupRestore extends StatelessWidget {
  final MaterialColor backupButtonColor;

  const BackupRestore({
    Key? key,
    required this.backupButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Column(
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
            color: backupButtonColor,
            onPressed: () => model.backupRecipes(),
          ),
          RoundedButton(
            text: 'Restore Recipes',
            color: backupButtonColor,
            colorCode: 700,
            onPressed: () => model.restoreRecipes(),
          ),
        ],
      ),
    );
  }
}

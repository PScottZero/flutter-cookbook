import 'package:cookbook/components/rounded_button.dart';
import 'package:flutter/material.dart';

class BackupRecipes extends StatelessWidget {
  const BackupRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          text: 'Backup Recipes',
          color: Colors.blue,
          onPressed: () {},
        ),
        RoundedButton(
          text: 'Restore Recipes',
          color: Colors.red,
          onPressed: () {},
        ),
      ],
    );
  }
}

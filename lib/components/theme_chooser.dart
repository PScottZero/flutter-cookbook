import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/theme_options.dart';

class ThemeChooser extends StatelessWidget {
  final MaterialColor selectedTheme;

  const ThemeChooser({
    Key? key,
    required this.selectedTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(
              ViewConstants.smallPadding,
            ),
            child: Text(
              'Theme',
              style: TextStyle(
                fontSize: ViewConstants.smallFont,
                color: model.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 400,
            child: GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: ViewConstants.smallPadding,
              crossAxisSpacing: ViewConstants.smallPadding,
              padding: const EdgeInsets.all(ViewConstants.smallPadding),
              children: themeOptions
                  .map(
                    (theme) => GestureDetector(
                      onTap: () => model.setTheme(theme),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

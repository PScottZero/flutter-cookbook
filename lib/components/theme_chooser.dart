import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../constants/theme_options.dart';
import 'header.dart';

class ThemeChooser extends StatelessWidget {
  const ThemeChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            text: 'Themes',
            textColor: model.theme.primaryColor,
          ),
          SizedBox(
            height: 230,
            child: GridView.count(
              crossAxisCount: 5,
              mainAxisSpacing: ViewConstants.smallPadding,
              crossAxisSpacing: ViewConstants.smallPadding,
              padding: const EdgeInsets.only(
                left: ViewConstants.smallPadding,
                right: ViewConstants.smallPadding,
                bottom: ViewConstants.smallPadding,
              ),
              children: themeOptions
                  .map(
                    (theme) => GestureDetector(
                      onTap: () => model.setTheme(theme),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.materialColor,
                          borderRadius: BorderRadius.circular(100),
                          border: model.theme == theme
                              ? Border.all(
                                  color: theme.highlightColor, width: 3)
                              : Border.all(
                                  color: theme.materialColor, width: 3),
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

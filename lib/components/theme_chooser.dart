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
            height: ViewConstants.themeChooserHeight,
            child: GridView.count(
              crossAxisCount: ViewConstants.themeChooserColumnCount,
              mainAxisSpacing: ViewConstants.mediumPadding,
              crossAxisSpacing: ViewConstants.mediumPadding,
              padding: const EdgeInsets.only(
                left: ViewConstants.mediumPadding,
                right: ViewConstants.mediumPadding,
                bottom: ViewConstants.mediumPadding,
              ),
              children: themeOptions
                  .map(
                    (theme) => GestureDetector(
                      onTap: () => model.setTheme(theme),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.primaryColor,
                          borderRadius: BorderRadius.circular(
                            ViewConstants.maxBorderRadius,
                          ),
                          border: model.theme == theme
                              ? Border.all(
                                  color: theme.highlightColor,
                                  width: ViewConstants.highlightedBorderWidth,
                                )
                              : Border.all(
                                  color: theme.primaryColor,
                                  width: ViewConstants.highlightedBorderWidth,
                                ),
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

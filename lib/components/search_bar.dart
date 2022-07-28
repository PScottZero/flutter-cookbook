import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';
import '../model/app_theme.dart';
import 'custom_text_field.dart';

class SearchBar extends StatelessWidget {
  final AppTheme theme;

  const SearchBar({Key? key, required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(ViewConstants.mediumPadding),
        child: Container(
          padding: const EdgeInsets.only(
            left: ViewConstants.mediumPadding,
            right: ViewConstants.largePadding,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: theme.accentColor2,
            borderRadius: BorderRadius.circular(
              ViewConstants.maxBorderRadius,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: theme.primaryColor),
              const SizedBox(width: ViewConstants.smallPadding),
              Expanded(
                child: CustomTextField(
                  onChanged: (search) => model.setSearchString(search),
                  textColor: model.theme.primaryColor,
                  plain: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cookbook/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/view_constants.dart';
import '../model/app_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(
      builder: (context, model, child) => Padding(
        padding: const EdgeInsets.all(ViewConstants.smallPadding),
        child: Container(
          padding: const EdgeInsets.only(
            left: ViewConstants.smallPadding,
            right: ViewConstants.largePadding,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: model.theme[100],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: model.theme[300],
              ),
              const SizedBox(width: ViewConstants.smallPadding / 2),
              Expanded(
                child: CustomTextField(
                  onChanged: (search) => model.setSearchString(search),
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

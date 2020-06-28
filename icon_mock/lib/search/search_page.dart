import 'package:flutter/material.dart';
import 'package:icon_mock/extensions/context_ext.dart';
import 'package:icon_mock/search/search_list.dart';
import 'package:icon_mock/theme.dart';
import 'package:icon_mock/widgets/input.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyDark,
      body: ListView(physics: BouncingScrollPhysics(), children: [
        Search(),
        SizedBox(height: 8),
        SearchList(),
      ]),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: greyLight),
      height: context.heightPx * .11,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.arrow_back_ios, color: white),
              onPressed: () => Navigator.pop(context)),
          ShadowInputBox(
              // onChanged: (search) => userState.firstName = first,
              hintText: 'חפש קטגוריה',
              width: context.widthPx * .8,
              maxLines: 1),
        ],
      ),
    );
  }
}

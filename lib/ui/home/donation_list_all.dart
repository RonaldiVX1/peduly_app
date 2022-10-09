import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/category.dart';
import 'package:peduly_app/ui/home/donation_list.dart';
import 'package:peduly_app/widgets/items/category_item.dart';

class CategoryAll extends StatefulWidget {
  @override
  _CategoryAllState createState() => _CategoryAllState();
}

class _CategoryAllState extends State<CategoryAll> {
  var selectedTitle = 'pantiAsuhan';

  selectedIndex(String a) {
    setState(() {
      selectedTitle = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildHorizontalCategoryList(),
        DonationList(),
        // DonationList(selectedTitle),
      ],
    );
  }

  Widget buildHorizontalCategoryList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        child: ListView.builder(
          itemCount: listCategory.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Category category = listCategory[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () {
                    selectedIndex(category.arrTitle);
                  },
                  child: categoryItem(category: category)),
            );
          },
        ),
      ),
    );
  }
}

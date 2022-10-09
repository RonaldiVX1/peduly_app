import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/category.dart';
import 'package:peduly_app/ui/donation/donation_screen.dart';
import 'package:peduly_app/ui/home/donation_list.dart';
import 'package:peduly_app/widgets/items/category_item.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
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
        Container(height: 336, child: DonationList()
            // child: DonationList(selectedTitle)
            ),
        // _buildButton(selectedTitle)
      ],
    );
  }

  Widget buildHorizontalCategoryList() {
    return Container(
      height: 60,
      child: ListView.builder(
        itemCount: listCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category category = listCategory[index];
          return InkWell(
              onTap: () {
                selectedIndex(category.arrTitle);
              },
              child: categoryItem(
                category: category,
              ));
        },
      ),
    );
  }

  // Widget _buildButton(String arr) {
  //   final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  //     onPrimary: Colors.deepOrange,
  //     primary: Colors.white,
  //     side: BorderSide(width: 1, color: Colors.deepOrange),
  //     minimumSize: Size(130, 55),
  //     padding: EdgeInsets.symmetric(horizontal: 16),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(15)),
  //     ),
  //   );

  //   return Center(
  //     child: Container(),
  //   );
  // }
}

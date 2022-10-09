import 'package:flutter/material.dart';
import 'package:peduly_app/ui/detail/widget/detail/build_detail.dart';
import 'package:peduly_app/ui/detail/widget/detail/doa_dukungan.dart';
import 'package:peduly_app/ui/detail/widget/detail/donatur_list.dart';
import 'package:peduly_app/ui/detail/widget/detail/donatur_list_dua.dart';

class PedulyContentTabBar extends StatelessWidget {
  const PedulyContentTabBar(this.tabController, this.image, this.text);

  final TabController tabController;
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
      child: TabBarView(controller: tabController, children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 280,
              ),
            ),
            Expanded(
              child: BuildDetailDonation(
                detailDonation: text,
              ),
            ),
          ],
        ),
        Container(
          child: DoaDukungan(),
        ),
        Container(
          child: Text("3"),
        ),
        Container(
          child: DonaturListDua(),
        ),
        Container(
          child: Text("5"),
        ),
      ]),
    );
  }
}

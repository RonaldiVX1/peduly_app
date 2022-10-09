import 'package:flutter/material.dart';

import '../../../../widgets/theme/theme_color.dart';

Widget pedulyTabBar(TabController tabController) {
  return TabBar(
      labelColor: pPrimaryColor,
      isScrollable: true,
      indicatorColor: pPrimaryColor,
      unselectedLabelColor: pFourGreyColor,
      controller: tabController,
      tabs: [
        Tab(
          text: "Detail",
        ),
        Tab(
          text: "Kabar Terbaru",
        ),
        Tab(
          text: "Doa & Dukungan (2340)",
        ),
        Tab(
          text: "Donatur(30)",
        ),
        Tab(
          text: "Fundraiser",
        ),
      ]);
}

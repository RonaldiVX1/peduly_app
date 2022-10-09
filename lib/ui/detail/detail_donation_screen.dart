import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:peduly_app/data/model/test.dart';
import 'package:peduly_app/ui/detail/widget/detail/build_detail.dart';
import 'package:peduly_app/ui/detail/widget/detail/doa_dukungan.dart';
import 'package:peduly_app/ui/detail/widget/detail/donatur_list.dart';
import 'package:peduly_app/ui/detail/widget/detail/fundraiser.dart';
import 'package:peduly_app/ui/detail/widget/fab/fab_detail_donation.dart';
import 'package:peduly_app/ui/detail/widget/manfaat/build_manfaat.dart';
import 'package:peduly_app/ui/detail/widget/rate/build_rate.dart';
import 'package:peduly_app/ui/detail/widget/tabbar/peduly_content_tabBar.dart';
import 'package:peduly_app/ui/detail/widget/tabbar/peduly_tabBar.dart';
import 'package:peduly_app/ui/detail/widget/top/buildCategorySection.dart';
import 'package:peduly_app/ui/detail/widget/top/buildCounterSection.dart';
import 'package:peduly_app/ui/detail/widget/top/buildDonatorTotal.dart';
import 'package:peduly_app/ui/detail/widget/top/buildTitleText.dart';
import 'package:peduly_app/ui/detail/widget/top/build_donation_total.dart';
import 'package:peduly_app/ui/lanjutdonation/lanjut_donation_screen.dart';
import 'package:peduly_app/ui/rencanapenggunaandana/rencana_penggunaan_dana.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border.dart';
import 'package:html/parser.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:share_plus/share_plus.dart';

import '../../widgets/theme/theme_weight.dart';

class DetailDonationScreen extends StatefulWidget {
  static const routeName = '/detailDonation';
  const DetailDonationScreen({
    Key key,
    this.donation,
    this.nominal,
  }) : super(key: key);
  final Bencana donation;
  final String nominal;

  @override
  _DetailDonationScreenState createState() => _DetailDonationScreenState();
}

class _DetailDonationScreenState extends State<DetailDonationScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  void initState() {
    tabController = new TabController(vsync: this, length: 5);
    super.initState();
  }

  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              NestedScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context, i) {
                    return [
                      SliverAppBar(
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(20),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                            child: Text(" "),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        expandedHeight: screen.height * 0.4,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Image.asset(
                              'assets/anakkorbanperahu.jpeg',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ];
                  },
                  body: _buildContent()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isEnable = !isEnable;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screen.height * 0.34),
                      child: Image.asset(
                        isEnable
                            ? 'assets/icon_love.png'
                            : 'assets/icon_love_color.png',
                        width: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Color(0xffDDDDDD),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15),
                  child: pedulyButton(
                      context: context,
                      text: "Donasi Sekarang",
                      isEnabled: true,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LanjutDonationScreen(
                                  donation: widget.donation,
                                )));
                      }),
                ),
              ),
              RawMaterialButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () async {
                  await Share.share("Yuk galang dana untuk \"" +
                      widget.donation.title +
                      "\"\n\n Kunjungi https://www.peduly.com");
                },
                elevation: 0.0,
                fillColor: Color(0xffFCAE03),
                child: SvgPicture.asset(
                  IC_SHARE,
                ),
                padding: EdgeInsets.all(16.0),
                shape: CircleBorder(),
              )
            ],
          ),
        ),
      ],
    );
    // return Column(
    //   children: [
    //     Expanded(
    //       child: Stack(
    //         children: [
    //           // Image.network(
    //           //   'https://api.peduly.com/images/images_campaign/' +
    //           //       widget.donation.imageUrl,
    //           //   errorBuilder:
    //           //       (BuildContext context, Object exception, StackTrace stackTrace) {
    //           //     return Image(image: AssetImage('assets/blank.jpg'));
    //           //   },
    //           //   fit: BoxFit.fill,
    //           //   height: screen.height * 0.5,
    //           // ),
    //           Image.asset('assets/anakkorbanperahu.jpeg',
    //               fit: BoxFit.cover, height: screen.height * 0.4),

    //           DraggableScrollableSheet(
    //               maxChildSize: 1,
    //               minChildSize: 0.575,
    //               initialChildSize: 0.7,
    //               builder: (context, controller) => _buildContent(controller)),
    //         ],
    //       ),
    //     ),
    //     Divider(
    //       height: 1,
    //       thickness: 1,
    //       color: Color(0xffDDDDDD),
    //     ),
    //     Container(
    //       decoration: BoxDecoration(color: Colors.white),
    //       padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Expanded(
    //             child: Container(
    //               margin: EdgeInsets.only(left: 15),
    //               child: pedulyButton(
    //                   context: context,
    //                   text: "Donasi Sekarang",
    //                   isEnabled: true,
    //                   onPressed: () {
    //                     Navigator.of(context).push(MaterialPageRoute(
    //                         builder: (context) => LanjutDonationScreen(
    //                               donation: widget.donation,
    //                             )));
    //                   }),
    //             ),
    //           ),
    //           RawMaterialButton(
    //             materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    //             onPressed: () async {
    //               await Share.share("Yuk galang dana untuk \"" +
    //                   widget.donation.title +
    //                   "\"\n\n Kunjungi https://www.peduly.com");
    //             },
    //             elevation: 0.0,
    //             fillColor: Color(0xffFCAE03),
    //             child: SvgPicture.asset(
    //               IC_SHARE,
    //             ),
    //             padding: EdgeInsets.all(16.0),
    //             shape: CircleBorder(),
    //           )
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.black26,
              ),
              width: 30,
              height: 4,
            ),
          ),
          SizedBox(height: 16),
          buildCategorySection(widget.donation.campaign),
          SizedBox(height: 16),
          buildTitleText(widget.donation.title),
          SizedBox(height: 16),
          buildDonationTotal(
              // currentTotal: widget.donation.currentTotal,
              // goalTotal: widget.donation.targetTotal),
              //pakai target total dulu, yg current beda object api
              currentTotal: int.parse(widget.nominal),
              goalTotal: int.parse(widget.donation.targetTotal)),
          SizedBox(height: 16),
          buildCounterSection(
              //pakai target total dulu, yg current beda object api
              currentTotal: int.parse(widget.nominal),
              goalTotal: int.parse(widget.donation.targetTotal)),
          SizedBox(height: 16),
          //? jangan lupa mengubah donatur total dengan data dinamis
          buildDonatorTotal(
              donaturTotal: 1685,
              dayRemaining: TimeRemain(widget.donation.dayRemaining)),
          SizedBox(height: 16),
          Divider(),
          BuildRate(rating: 4.5, name: "Untuk Teman"),
          Divider(),
          SizedBox(height: 19),
          // buildTitleText('Penerima Manfaat'),
          // BuildManfaat(namaPenerima: 'Afiyah Salma Purwanintyas'),
          // SizedBox(height: 16),
          PedulyButtonCorner(
              text: 'Rencana Penggunaan Dana',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            RencanaPenggunaanDana(widget.donation)));
              }),
          SizedBox(height: 54),
          //Disini FIII
          pedulyTabBar(tabController),
          PedulyContentTabBar(tabController, "assets/anakkorbanperahu.jpeg",
              widget.donation.detailCampaign.toString()),

          Divider(),

          // SizedBox(height: 16),
          // BuildDetailDonation(
          //   detailDonation: _parseHtmlString(
          //     widget.donation.detailCampaign.toString(),
          //   ),
          // ),
          // SizedBox(height: 16),
          // Divider(),
          // SizedBox(height: 16),
          // buildTitleText("Doa dan Dukungan"),
          // DoaDukungan(),
          // SizedBox(height: 16),
          // Divider(),
          // SizedBox(height: 16),
          // buildTitleText("Donatur"),
          // DonaturList(),
          // SizedBox(height: 16),
          // Divider(),
          // SizedBox(height: 16),
          // FundraiserSection(),
          // SizedBox(height: 22),
        ],
      ),
    );
  }
}

//Diajarkan Puad

TimeRemain(String time) {
  final date2 = DateTime.now();
  if (time == 'Tanpa Batas Waktu') {
    return 0;
  } else {
    final tempDate = DateFormat("yyyy-MM-dd").parse(time);
    if (tempDate.year < date2.year || tempDate.month < date2.month) {
      return 0;
    } else {
      final difference = date2.difference(tempDate).inDays;
      return difference * (-1);
    }
  }
}

String _parseHtmlString(String htmlString) {
  final document = parse(htmlString);
  final String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/ui/donation/widget/divider_up.dart';
import 'package:peduly_app/ui/donation/widget/filter_square.dart';
import 'package:peduly_app/ui/donation/widget/first_page.dart';
import 'package:peduly_app/ui/donation/widget/menu_filter.dart';
import 'package:peduly_app/ui/donation/widget/second_page.dart';
import 'package:peduly_app/ui/donation/widget/three_page.dart';
import 'package:peduly_app/ui/home/donation_list.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main_screen.dart';

class DonationScreen extends StatefulWidget {
  int filterUrutkanSelectedIndex = 0;
  static int selectedMenuFilter = -1;
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: pWhiteColor,
                  pinned: true,
                  toolbarHeight: 0,
                  expandedHeight: 70,
                  bottom: TabBar(
                    indicatorWeight: 3,
                    indicatorColor: pPrimaryColor,
                    tabs: [
                      Tab(
                        child: Text(
                          "Donasi",
                          style: pDetailTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Rutin",
                          style: pDetailTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Barang",
                          style: pDetailTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                      ),
                    ],
                  ),
                )
              ];
            },
            body: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 24,
                    left: 29,
                    right: 29,
                  ),
                  child: Row(
                    children: [
                      FilterSquare("assets/icon_setting.png", "Kategori"),
                      DividerUp(),
                      FilterSquare("assets/icon_sort.png", "Rutin"),
                      DividerUp(),
                      GestureDetector(
                          onTap: () {
                            _showFilter();
                          },
                          child:
                              FilterSquare("assets/icon_filter.png", "Barang"))
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                _buildDonationList(),
              ],
            ),
          ),
        ),
      ),
    );

    //     body: SafeArea(
    //         child: SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: 10,
    //       ),
    //       backToNamedButton(
    //           text: 'Donasi',
    //           onPressed: () {
    //             Navigator.of(context).push(
    //                 MaterialPageRoute(builder: (context) => MainScreen()));
    //           }),
    //       _buildDonationMenus(screen),
    //       _buildDonationList(),
    //     ],
    //   ),
    // )));
  }

  Widget _buildDonationList() {
    return DonationList();
  }

  Widget _buildDonationMenus(Size screen) {
    final hintSearch = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(

          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 21.0, right: 38),
          //     child: Row(
          //       children: [
          //         Icon(Icons.search),
          //         TextField(

          //         )
          //     ]),
          //   ),
          // ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12.0, bottom: 12.0, left: 21.0, right: 38),
                child: Row(
                  children: [
                    SvgPicture.asset(IC_SEARCH),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        controller: hintSearch,
                        decoration: InputDecoration.collapsed(
                            hintText: "Cari yang ingin kamu bantu",
                            hintStyle: TextStyle(fontSize: 13)),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: Color(0xffDBDBDB),
                    width: 1 //                   <--- border width here
                    ),
              ),
            ),
          ),
          SizedBox(
            width: 13,
          ),
          _menuItem(
              text: 'Filter',
              svgPath: FILTER_ICON,
              onPressed: () {
                _showFilter();
              }),
        ],
      ),
    );
  }

  Widget _showFilter() {
    showModalBottomSheet(
        isDismissible: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              color: Colors.white12,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 35),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Color(0xffE3E3E3),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 14.0),
                          child: Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                                letterSpacing: 1.0),
                          ),
                        )),
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 35),
                          _subFilter(text: "Kategori"),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Column(
                              children: [
                                SizedBox(height: 14),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    menuFilter(
                                      text: "Kesehatan",
                                      isSelected:
                                          DonationScreen.selectedMenuFilter ==
                                              0,
                                      menuFilterTap: () {
                                        setState(() {
                                          DonationScreen.selectedMenuFilter = 0;
                                          setCategory(0);
                                        });
                                      },
                                    ),
                                    menuFilter(
                                      text: "Yatim Piatu",
                                      isSelected:
                                          DonationScreen.selectedMenuFilter ==
                                              1,
                                      menuFilterTap: () {
                                        setState(() {
                                          DonationScreen.selectedMenuFilter = 1;
                                          setCategory(1);
                                        });
                                      },
                                    ),
                                    menuFilter(
                                      text: "Masjid",
                                      isSelected:
                                          DonationScreen.selectedMenuFilter ==
                                              2,
                                      menuFilterTap: () {
                                        setState(() {
                                          DonationScreen.selectedMenuFilter = 2;
                                          setCategory(2);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    menuFilter(
                                      text: "Cacat",
                                      isSelected:
                                          DonationScreen.selectedMenuFilter ==
                                              3,
                                      menuFilterTap: () {
                                        setState(() {
                                          DonationScreen.selectedMenuFilter = 3;
                                          setCategory(3);
                                        });
                                      },
                                    ),
                                    menuFilter(
                                      text: "Bencana",
                                      isSelected:
                                          DonationScreen.selectedMenuFilter ==
                                              4,
                                      menuFilterTap: () {
                                        setState(() {
                                          DonationScreen.selectedMenuFilter = 4;
                                          setCategory(4);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 34),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Divider(
                                height: 1.0,
                                thickness: 3.0,
                                color: Color(0xffE3E3E3),
                              ),
                              SizedBox(height: 20),
                              _subFilter(text: "Urutkan"),
                              SizedBox(height: 24),
                              _devider(),
                              _filter(
                                  text: "Paling Sesuai",
                                  index: 0,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 0;
                                    });
                                  }),
                              _devider(),
                              _filter(
                                  text: "Terbaru",
                                  index: 1,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 1;
                                    });
                                  }),
                              _devider(),
                              _filter(
                                  text: "Terkumpul dana paling sedikit",
                                  index: 2,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 2;
                                    });
                                  }),
                              _devider(),
                              _filter(
                                  text: "Donasi mendesak",
                                  index: 3,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 3;
                                    });
                                  }),
                              SizedBox(height: 24),
                              _subFilter(text: "Tipe Galang Dana"),
                              SizedBox(height: 16),
                              _devider(),
                              _filter(
                                  text: "individu",
                                  index: 0,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 0;
                                    });
                                  }),
                              _devider(),
                              _filter(
                                  text: "Organisasi",
                                  index: 1,
                                  onPressed: () {
                                    setState(() {
                                      widget.filterUrutkanSelectedIndex = 1;
                                    });
                                  }),
                              SizedBox(height: 20),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _btnAturUlang(),
                              _btnTerapkan(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Future<void> setCategory(int num) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedMenu', num.toString());

    if (num == 0) {
      prefs.setString('kategori', 'kesehatanDanMedis');
    } else if (num == 1) {
      prefs.setString('kategori', 'pantiAsuhan');
    } else if (num == 2) {
      prefs.setString('kategori', 'rumahIbadah');
    } else if (num == 3) {
      prefs.setString('kategori', 'beasiswaDanPendidikan');
    } else {
      prefs.setString('kategori', 'bencanaAlam');
    }
  }

  Widget _ListFilter() {
    return Column(
      children: [
        Divider(
          height: 1.0,
          thickness: 3.0,
          color: Color(0xffE3E3E3),
        ),
        SizedBox(height: 20),
        _subFilter(text: "Urutkan"),
        SizedBox(height: 24),
        _devider(),
        _filter(text: "Paling Sesuai", index: 0, onPressed: () {}),
        _devider(),
        _filter(text: "Terbaru", index: 1, onPressed: () {}),
        _devider(),
        _filter(
            text: "Terkumpul dana paling sedikit", index: 2, onPressed: () {}),
        _devider(),
        _filter(text: "Donasi mendesak", index: 3, onPressed: () {}),
        SizedBox(height: 24),
        _subFilter(text: "Tipe Galang Dana"),
        SizedBox(height: 16),
        _devider(),
        _filter(text: "individu", index: 0, onPressed: () {}),
        _devider(),
        _filter(
          text: "Organisasi",
          index: 1,
          onPressed: () {},
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _btnAturUlang() {
    return Container(
      height: 43,
      width: 103,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(0xffE7513B)),
        color: Colors.white12,
      ),
      child: Center(
        child: Text(
          "Atur Ulang",
          style: TextStyle(
              color: Color(0xffE7513B),
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1,
              letterSpacing: 1.0),
        ),
      ),
    );
  }

  Widget _btnTerapkan() {
    return InkWell(
      child: Container(
        height: 43,
        width: 103,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xffE7513B)),
          color: Color(0xffE7513B),
        ),
        child: Center(
          child: Text(
            "Terapkan",
            style: TextStyle(
                color: Color(0xffFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                height: 1,
                letterSpacing: 1.0),
          ),
        ),
      ),
      onTap: () {
        setState(() {});
        Navigator.of(context).pop();
      },
    );
  }

  Widget _filter({
    @required String text,
    @required int index,
    @required Function() onPressed,
  }) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          height: 1,
                          letterSpacing: 1.0),
                    ),
                  ),
                  if (widget.filterUrutkanSelectedIndex == index) ...[
                    Image.asset('assets/centang.png'),
                  ]
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}

Widget _devider() {
  return Divider(
    height: 1.0,
    thickness: 1.0,
    color: Color(0xffE3E3E3),
  );
}

Widget _subFilter({
  @required String text,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0),
    child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.2,
              letterSpacing: 1.0),
        )),
  );
}

Widget _menuItem(
    {@required String text,
    @required String svgPath,
    @required Function() onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SvgPicture.asset(
            svgPath,
            width: 20,
            height: 20,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

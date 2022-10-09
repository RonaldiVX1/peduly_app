import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/category.dart';
import 'package:peduly_app/data/model/donation.dart';
import 'package:peduly_app/ui/donation/donation_screen.dart';
import 'package:peduly_app/ui/home/dampak_donasi_list.dart';
import 'package:peduly_app/ui/home/doa_list.dart';
import 'package:peduly_app/ui/home/horizontal_category_list.dart';
import 'package:peduly_app/ui/home/horizontal_donation_list.dart';
import 'package:peduly_app/ui/home/menu_donation.dart';
import 'package:peduly_app/utils/dummy_data.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/commons/shimmer_loading.dart';
import 'package:peduly_app/widgets/text/title_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:peduly_app/provider/google_signIn.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchResult = [
    'Covid',
    'Bencana Alam',
    'Relwan',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(
          fontSize: 50,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        var result = suggestions[index];
        return ListTile(
          title: Text(result),
          onTap: () {
            query = result;
          },
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  void _timer() {
    // contoh loading
    Future.delayed(Duration(seconds: 4)).then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: _isLoading
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appbar(),
              _topUp(),
              buildMenuDonation(_isLoading),
              _buildCarouselBanner(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  titleText(
                      title: 'Butuh Bantuan Mendesak', isLoading: _isLoading),
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat semua',
                        style: TextStyle(
                            color: Color(0xffE7513B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 14,
              ),
              buildHorizontalDonationList(
                  isLoading: _isLoading, listDonation: listDonation),
              Divider(
                color: Color(0xffE4E4E4),
                thickness: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  titleText(
                      title: 'Kategori Galang Dana', isLoading: _isLoading),
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DonationScreen()));
                      },
                      child: Text(
                        'Lihat semua',
                        style: TextStyle(
                            color: Color(0xffE7513B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              CategoryList(),
              Divider(
                color: Color(0xffE4E4E4),
                thickness: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  titleText(
                      title: 'Lihat Dampak Donasimu', isLoading: _isLoading),
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat semua',
                        style: TextStyle(
                            color: Color(0xffE7513B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              dampakDonasi(_isLoading),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  titleText(
                      title: 'Doa & Kabar dari Orang Baik',
                      isLoading: _isLoading),
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat semua',
                        style: TextStyle(
                            color: Color(0xffE7513B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              DoaList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => GoogleSignInProvider(),
      //   child: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.waiting) {
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       } else if (snapshot.hasData) {
      //         return _buildBody(screen);
      //       } else if (snapshot.hasError) {
      //         return Center(
      //           child: Text('Something Went Wrong'),
      //         );
      //       } else {
      //         return _buildBody(screen);
      //       }
      //     },
      //   ),
      // ),
    );
  }

  Widget _buildBody(Size screen) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: _isLoading
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            _buildCarouselBanner(),
            buildMenuDonation(_isLoading),
            titleText(title: 'Butuh Bantuan Mendesak', isLoading: _isLoading),
            SizedBox(
              height: 14,
            ),
            buildHorizontalDonationList(
                isLoading: _isLoading, listDonation: listDonation),
            Divider(
              color: Colors.black38,
            ),
            titleText(title: 'Kategori Galang Dana', isLoading: _isLoading),
            CategoryList(),
            Divider(
              color: Colors.black38,
            ),
            titleText(
                title: 'Doa & Kabar Baik Hari Ini', isLoading: _isLoading),
            // DoaList(),
            SizedBox(height: 12),
            pedulyButton(
                context: context,
                text: 'Lihat Kabar Lainnya',
                isEnabled: true,
                onPressed: () {}),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/peduly.png',
            width: 48,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: Image.asset(
              'assets/search.png',
              width: 48,
            ),
          ),
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/notifikasi');
            },
            child: Image.asset(
              'assets/bell.png',
              width: 48,
            ),
          ),
          SizedBox(width: 12),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/wishlist.png',
              width: 48,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: Container(
        height: 54,
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Cari yang ingin kamu bantu',
              prefixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }

  Widget _topUp() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 1,
              offset: Offset(0.5, 0.5))
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Image.asset(
                  'assets/wallet.png',
                  width: 48,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rp. 0',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'Isi saldo dompet',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff717171),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: BorderSide(
                color: Color(0xffE7513B),
                width: 2,
              ),
              primary: Color(0xffE7513B),
            ),
            onPressed: () {},
            child: Text(
              'Top up',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCarouselBanner() {
    final caraousel = Carousel(
      images: [
        NetworkImage(imagesUrl[0]),
        NetworkImage(imagesUrl[1]),
        NetworkImage(imagesUrl[2]),
        NetworkImage(imagesUrl[3])
      ],
      onImageChange: (prevIndex, currentIndex) {},
      animationCurve: Curves.easeIn,
      autoplay: false,
      dotSize: 5,
      dotIncreasedColor: Colors.redAccent,
      dotBgColor: Colors.transparent,
      animationDuration: Duration(seconds: 4),
    );

    final List<String> texts = [
      "Bantu Anak Pedalaman\nTerbebas dari Kelaparan",
      "Bantu mereka yang\nMembutuhkan Bantuan",
      "Ukir Senyum pada\nWajah mereka",
      "Bersama Kita bisa\nMengalahkan Kemiskinan"
    ];
    return ShimmerLoading(
      isLoading: _isLoading,
      child: Center(
        child: Container(
          color: Colors.transparent,
          height: 210,
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  caraousel,
                  Padding(
                    padding: const EdgeInsets.fromLTRB(22, 22, 0, 0),
                    child: Text(
                      texts[0],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  // Widget _buildButton() {
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
  //     child: Container(
  //       height: 65,
  //       padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
  //       child: ElevatedButton(
  //         style: raisedButtonStyle,
  //         child: Text(
  //           'Lihat Semua',
  //           style: TextStyle(fontSize: 15),
  //         ),
  //         onPressed: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context)=> DonationScreen()));
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }
}

Selectcategory(int index) {
  String selected = listCategory[index].arrTitle;
  return selected;
}

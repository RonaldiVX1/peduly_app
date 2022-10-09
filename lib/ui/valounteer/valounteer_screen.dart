import 'package:flutter/material.dart';
import 'package:peduly_app/ui/detail/widget/rate/RatingStart.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class ValounteerScreen extends StatefulWidget {
  final controller = TextEditingController();
  @override
  State<ValounteerScreen> createState() => _ValounteerScreenState();
}

class _ValounteerScreenState extends State<ValounteerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return NestedScrollView(
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
                background: Image.asset('assets/anakkorbanperahu.jpeg',
                    fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: _buildContent());

    // return CustomScrollView(
    //   slivers: [
    //     SliverAppBar(
    //       bottom: PreferredSize(
    //         preferredSize: Size.fromHeight(20),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(30),
    //             topRight: Radius.circular(30),
    //           )),
    //         ),
    //       ),
    //       backgroundColor: Colors.white,
    //       expandedHeight: screen.height * 0.4,
    //       flexibleSpace: FlexibleSpaceBar(
    //         background:
    //             Image.asset('assets/anakkorbanperahu.jpeg', fit: BoxFit.cover),
    //       ),
    //     ),
    //     SliverToBoxAdapter(
    //         child: Text(
    //             "Terkadang pada perubahan yang kita lakukan terjadi kesalahan dan kita ingin mengembalikannya seperti keadaan sebelumnya. Maka kita perlu menyuruh git untuk megembalikannya. Ada beberapa perintah yang digunakan diantaranya: git checkout, git reset, dan git revert."))
    //   ],
    // );
  }

  // Expanded(
  //   child: Container(
  //     child: Stack(
  //       children: [
  //         // Image.network(
  //         //   widget.donation.imageUrl,
  //         //   fit: BoxFit.fill,
  //         //   height: screen.height * 0.5,
  //         // ),
  //         Image.asset('assets/anakkorbanperahu.jpeg',
  //             fit: BoxFit.cover, height: screen.height * 0.4),
  //         DraggableScrollableSheet(
  //             maxChildSize: 1,
  //             minChildSize: 0.75,
  //             initialChildSize: 1,
  //             builder: (context, controller) =>
  //                 _buildContent(controller)),
  //       ],
  //     ),
  //   ),
  // ),

  Widget _textKemanusiaan() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 100,
        height: 25,
        margin: EdgeInsets.only(top: 14),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(color: pPrimaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "Kemanusiaan",
          style: pPrimaryTextStyle.copyWith(fontSize: 12),
        ),
      ),
    );
  }

  Widget _textHeaderValunteer() {
    return Container(
      margin: EdgeInsets.only(
        top: 21,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Open Volunteer Malang",
            style: pBlackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                "Batas Registrasi :",
                style: pGreyTextStyle,
              ),
              Text(
                "17 Agustus 2021",
                style: pBlackTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _textHeaderRelawanIndicator() {
    return Container(
      margin: EdgeInsets.only(top: 42),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "80/100",
                      style: pBlackTextStyle.copyWith(fontWeight: bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Relawan",
                      style: pBlackTextStyle.copyWith(fontWeight: semiBold),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "192",
                    style: pBlackTextStyle.copyWith(fontWeight: bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "hari lagi",
                    style: pBlackTextStyle.copyWith(fontSize: 11),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            color: pSecondGreyColor,
            thickness: 1,
          ),
        ],
      ),
    );
  }

  Widget _textHeaderStars() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        children: [
          Image.asset(
            "assets/anakkorbanperahu.jpeg",
            width: 40,
          ),
          SizedBox(
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2,
              ),
              Text(
                "Peduly Malang",
                style: pDetailTextStyle.copyWith(fontWeight: bold),
              ),
              Row(
                children: [
                  RatingStar(starCount: 4, rating: 4, color: Colors.amber)
                ],
              )
            ],
          ),
          SizedBox(
            width: 33,
          ),
          Container(
            width: 1,
            height: 30,
            decoration: BoxDecoration(color: pSecondGreyColor),
          )
        ],
      ),
    );
  }

  Widget _dividerCenterContent(double thicknes) {
    return Divider(
        color: pSecondGreyColor.withOpacity(0.5), thickness: thicknes);
  }

  Widget _detailDescription() {
    return Container(
      margin: EdgeInsets.only(top: 24, right: 20, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail",
            style: pBlackSecondTextStyle.copyWith(
                fontSize: 18, fontWeight: semiBold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "Peduly Malang Calling for volunteers!Halo rek, Peduly malang membuka kesempatan besar buat kamu yang berdomisili di malang dan ingin menambah wawasan, pengalaman, dan relasi dalam sebuah...",
            style: pBlackSecondTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.justify,
          ),
          Text(
            "Baca selengkapnya",
            style: pPrimaryTextStyle.copyWith(
                decoration: TextDecoration.underline, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Widget _linearIndecator() {
  //   return Container(
  //     margin: EdgeInsets.only(top: 24, left: 20, right: 20),
  //     child: LinearPercentIndicator(
  //       padding: EdgeInsets.all(0),
  //       percent: 80 / 100,
  //       animation: true,
  //       animationDuration: 1500,
  //       lineHeight: 4,
  //       progressColor: pPrimaryColor,
  //       barRadius: Radius.circular(10),
  //     ),
  //   );
  // }

  Widget _contentDetailPekerjaan(String text) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: pDetailTextStyle.copyWith(fontSize: 16),
            ),
          ),
          Image.asset(
            "assets/user.png",
            width: 24,
          )
        ],
      ),
    );
  }

  Widget _detailPekerjaan() {
    return Container(
      margin: EdgeInsets.only(top: 24, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Pekerjaan",
            style: pBlackSecondTextStyle.copyWith(
                fontSize: 16, fontWeight: semiBold),
          ),
          _contentDetailPekerjaan("Copywritter"),
          _contentDetailPekerjaan("Graphics Designer"),
          _contentDetailPekerjaan("Social Media Marketing"),
          SizedBox(
            height: 39,
          ),
          _dividerCenterContent(4.0),
        ],
      ),
    );
  }

  Widget _contentRelawanTerdaftar() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Row(
        children: [
          Image.asset(
            "assets/user.png",
            width: 40,
          ),
          SizedBox(
            width: 11,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Intan Permata Putri",
                style: pBlackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "1 bulan lalu",
                style: pGreyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _relawanTerdaftar() {
    return Container(
      margin: EdgeInsets.only(top: 36, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Relawan Terdaftar",
                style: pBlackTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "(",
                style: pBlackTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                "80",
                style: pPrimaryTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
              Text(
                ")",
                style: pBlackTextStyle.copyWith(
                    fontSize: 18, fontWeight: semiBold),
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          _contentRelawanTerdaftar(),
          _contentRelawanTerdaftar(),
          _contentRelawanTerdaftar(),
          _contentRelawanTerdaftar(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              _textKemanusiaan(),
              // _linearIndecator(),
              _textHeaderValunteer(),
              _textHeaderRelawanIndicator(),
              _textHeaderStars(),
              _dividerCenterContent(4.0),
              _detailDescription(),
              _dividerCenterContent(4.0),
              _detailPekerjaan(),
              _relawanTerdaftar(),
            ],
          ),
        ),
      ),
    );
  }
}

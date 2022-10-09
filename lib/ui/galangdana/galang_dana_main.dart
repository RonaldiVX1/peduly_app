import 'package:flutter/material.dart';

class GalangDanaMain extends StatefulWidget {
  @override
  State<GalangDanaMain> createState() => _GalangDanaMainState();
}

class _GalangDanaMainState extends State<GalangDanaMain> {
  String dropDownValueStatus = "Semua Status";

  Widget _sedangBerjalan() {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          _sedangBerjalanCard(),
          _sedangBerjalanCard(),
        ],
      ),
    );
  }

  Widget _riwayat() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      color: Colors.white,
      child: ListView(
        children: [
          _statusList(),
          _riwayatCard(status: true),
          _riwayatCard(status: false),
          _riwayatCard(status: true),
          _riwayatCard(status: true),
        ],
      ),
    );
  }

  Widget _statusList() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(left: 20, right: 194),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            value: dropDownValueStatus,
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                dropDownValueStatus = value;
              });
            },
            items: <String>['Semua Status', 'Selesai', 'Ditolak']
                .map<DropdownMenuItem<String>>(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  Widget _riwayatCard({bool status}) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/blank.jpg',
                      width: 180,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 8,
                      left: 8,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: status == true
                          ? Color(0xff34A853)
                          : Color(0xffE7513B),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      status == true ? 'Selesai' : 'Ditolak',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bangun Rumah Singgah Surabaya',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffE7513B),
                        ),
                        child: Text(
                          'Penarikan Dana',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            color: Color(0xffE4E4E4),
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget _sedangBerjalanCard() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/blank.jpg',
                  width: 180,
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bangun Rumah Singgah Surabaya',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        color: Color(0xffE7513B),
                        backgroundColor: Color(0xffE4E4E4),
                        value: 0.8,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Terkumpul',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Rp 10.200.654',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dilihat',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '56087',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Divider(
            color: Color(0xffE4E4E4),
            thickness: 1,
          )
        ],
      ),
    );
  }

  Widget _buatGalangDanaButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/galang_dana');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffE7513B),
        ),
        padding: EdgeInsets.symmetric(vertical: 19),
        margin: EdgeInsets.only(
          bottom: 20,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Text(
          'BUAT GALANG DANA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: false,
            backgroundColor: Colors.white,
            toolbarHeight: 0,
            bottom: const TabBar(
              indicatorColor: Color(0xffE7513B),
              labelColor: Colors.black,
              tabs: [
                Tab(text: 'Sedang Berjalan'),
                Tab(text: 'Riwayat'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              _sedangBerjalan(),
              _riwayat(),
            ],
          ),
          bottomNavigationBar: _buatGalangDanaButton(context),
        ),
      ),
    );
  }
}

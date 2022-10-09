import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';

class VerifAkunOrganisasi extends StatelessWidget {
  Widget _buildbody(BuildContext context) {
    TextEditingController _noTelpController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          _subTitleText('No. Telepon Penanggung Jawab'),
          SizedBox(height: 16),
          TextField(
            textAlignVertical: TextAlignVertical.center,
            showCursor: true,
            controller: _noTelpController,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text('+62')),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            // controller
          ),
          SizedBox(height: 20),
          _subTitleText('Foto KTP'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff34A853),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7513B),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          _subTitleText('Ketentuan'),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('● '),
                    Text('Gunakan foto asli, bukan fotokopi KTP.'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('● '),
                    Text('Pastikan foto KTP dalam kondisi terang dan jelas.'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('● '),
                    Flexible(
                        child: Text(
                            'Pastikan foto KTP tidak terpotong atau terhalang objek lain.'))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  hintText: 'Upload foto',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      CupertinoIcons.photo,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              onTap: () async {},
            ),
          ),
          SizedBox(height: 24),
          _subTitleText('Foto Diri & KTP'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff34A853),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7513B),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
              'Tunjukkan bagian depan KTP dengan posisi di bawah dagu tanpa menutupi wajah.'),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  hintText: 'Upload foto',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      CupertinoIcons.photo,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              onTap: () async {},
            ),
          ),
          SizedBox(height: 25),
          _subTitleText('Foto NPWP'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff34A853),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7513B),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          _subTitleText('Ketentuan'),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Text('● '),
                    Text('Gunakan foto asli, bukan fotokopi NPWP.'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('● '),
                    Text('Pastikan foto NPWP dalam kondisi terang dan jelas.'),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('● '),
                    Flexible(
                        child: Text(
                            'Pastikan foto NPWP tidak terpotong atau terhalang objek lain.'))
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  hintText: 'Upload foto',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      CupertinoIcons.photo,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              onTap: () async {},
            ),
          ),
          SizedBox(height: 24),
          _subTitleText('Foto Diri & NPWP'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff34A853),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 132,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                  ),
                  Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width * 0.5 - 26.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: MediaQuery.of(context).size.width * 0.25 - 25,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffE7513B),
                      ),
                      child: Center(
                        heightFactor: 12.5,
                        child: Icon(
                          Icons.clear_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(
              'Tunjukkan bagian depan NPWP dengan posisi di bawah dagu tanpa menutupi wajah.'),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  hintText: 'Upload foto',
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      CupertinoIcons.photo,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              onTap: () async {},
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: pedulyButton(
              context: context,
              text: 'Simpan',
              isEnabled: true,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _subTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: backToNamedButton(
                text: 'Verifikasi Akun Organisasi',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildbody(context),
        ),
      ),
    );
  }
}

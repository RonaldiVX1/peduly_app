import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';

String dropDownValueBank = "Pilih Bank";

class Rekening extends StatelessWidget {
  Widget _subTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _subTitleText('Bank'),
            ),
            SizedBox(height: 16),
            DropdownSearch<String>(
              mode: Mode.MENU,
              showSelectedItem: true,
              items: <String>[
                'Bank BNI',
                'Bank Mandiri',
                'Bank BCA',
                'Bank BTN',
                'Bank OCBC',
              ],
              hint: 'Pilih Bank',
              dropDownButton: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              dropdownSearchDecoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _subTitleText('Atas Nama'),
            ),
            SizedBox(height: 16),
            new TextField(
              showCursor: true,
              // controller: _nameController = TextEditingController(),
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Nama Pemilik',
                  // hintText: orang.data != null ? orang.data.name : "",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              // controller
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _subTitleText('No. Rekening'),
            ),
            SizedBox(height: 16),
            new TextField(
              showCursor: true,
              // controller: _nameController = TextEditingController(),
              cursorColor: Colors.black45,
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black45,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'No. Rekkening',
                  // hintText: orang.data != null ? orang.data.name : "",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
              // controller
            ),
            SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: backToNamedButton(
                text: 'Rekening',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          preferredSize: Size.fromHeight(100),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildBody(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: pedulyButton(
            context: context,
            text: 'Simpan',
            isEnabled: true,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

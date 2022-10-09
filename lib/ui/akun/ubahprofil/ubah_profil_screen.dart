import 'dart:convert';
import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:peduly_app/ui/akun/models/DetailUser.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum JenisAkun { individu, organisasi }

class UbahProfileScreen extends StatefulWidget {
  // static const routeName = "/ubahProfileScreen";
  // final User user;
  // UbahProfileScreen(this.user);

  @override
  _UbahProfileScreenState createState() => _UbahProfileScreenState();
}

class _UbahProfileScreenState extends State<UbahProfileScreen> {
  User user;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _noTelpController = TextEditingController();

  int _groupValue = -1;
  var _jenisAkun;

  var selectedDate = DateTime.now();
  final DateFormat formatter = DateFormat("dd/MM/yyyy");

  List<String> listPekerjaan = [
    'Administrator',
    'Advokat',
    'Aktor',
    'Akuntan',
    'Antariksawan',
    'Apoteker',
    'Arsitek',
    'Atlet',
    'Bartender',
    'Bidan',
    'Blogger',
    'Buruh',
    'Calo',
    'Camat',
    'Desainer',
    'Desainer Grafis',
    'Direktur',
    'Dokter',
    'Dosen',
    'Editor',
    'Fotografer',
    'Gamer',
    'Guru',
    'Ilmuwan',
    'Ilustrator',
    'Insinyur',
    'Instruktur',
    'Jaksa',
    'Jurnalis',
    'Kasir',
    'Kiai (Ulama)',
    'Koki',
    'Komikus',
    'Kondektur',
    'Konsultan',
    'Lurah',
    'Manajer',
    'Marketing',
    'Masinis',
    'Model',
    'Montir',
    'Nahkoda',
    'Nelayan',
    'Novelis',
    'Notaris',
    'Operator',
    'Pastor',
    'Pedagang',
    'PNS',
    'Pekerja Sosial',
    'Pelaut',
    'Pelukis',
    'Pelajar',
    'Pemadam Kebakaran',
    'Pemahat',
    'Pemain Sepak Bola',
    'Penari',
    'Pendeta',
    'Peneliti',
    'Penerjemah',
    'Pengacara',
    'Pengantar Surat',
    'Pengusaha',
    'Penulis',
    'Penyanyi',
    'Petani',
    'Peternak',
    'Polisi',
    'Politikus',
    'Pramugari',
    'Programmer',
    'Psikiater',
    'Psikolog',
    'Pilot',
    'Pramusaji',
    'Pramugara',
    'Presiden',
    'Resepsionis',
    'Satpam',
    'Sekretaris',
    'Selebriti',
    'Seniman',
    'Sopir',
    'Tengkulak',
    'TNI',
    'Tukang',
    'Tukang Jahit',
    'Tukang Kayu',
    'Tukang Las',
    'Tukang Listrik',
    'Ustad',
    'Video Editor',
    'Youtuber',
  ];

  List<String> listOrganisasi = [
    "Pilih Jenis Organisasi",
    'Komunitas',
    'Lembaga Swadaya Masyarakat',
    'Organisasi Pemerintah',
    'Organisasi Sukarelawan',
    'Organisasi Keagamaan',
    'Perguruan Tinggi',
    'Perusahaan',
    'Rumah Sakit',
    'Yayasan',
  ];

  Widget _ketVerif(int status) {
    if (status == 1) {
      return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff34A853),
        ),
        child: Center(
          heightFactor: 12.5,
          child: Icon(
            Icons.check_rounded,
            color: Colors.white,
            size: 15,
          ),
        ),
      );
    } else if (status == 2) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Color(0xffFFAF00),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Diproses',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Color(0xffE4E4E4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          'Belum diajukan',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  Widget _textitem(String teks) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        teks,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
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
                text: 'Ubah Profile',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          preferredSize: Size.fromHeight(100),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _organisasi({String email}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textitem('Jenis Organisasi'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: listOrganisasi,
          hint: 'Pilih Organisasi',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Tanggal Berdiri'),
        SizedBox(height: 16),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            showCursor: true,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.calendar_month_outlined),
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
                // orang.data != null ? orang.data.tanggalLahir : "",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
            controller: _tanggalLahirController,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                _tanggalLahirController.text = formattedDate;
              } else {
                print("Date is not selected");
              }
            },
          ),
        ),
        SizedBox(height: 20),
        _textitem('Email'),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            email ?? 'zainalmultazam@gmail.com',
            style: TextStyle(
              color: Color(0xff717171),
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Alamat email tidak bisa diubah',
            style: TextStyle(
              color: Color(0xffFCAE03),
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 20),
        _textitem("No. Telepon"),
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
            )
            // controller
            ),
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Alamat Lengkap",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Provinsi'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Jawa Timur',
            'Sumatera Barat',
            'Sulawesi Utara',
            'Jawa Barat',
            'Bali',
          ],
          hint: 'Pilih Provinsi',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Kota/Kabupaten'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Kota Bogor',
            'Surabaya',
            'Kabupaten Bogor',
            'Nowhere',
          ],
          hint: 'Pilih Kota/Kabupaten',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Kecamatan'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Kota Bogor',
            'Surabaya',
            'Kabupaten Bogor',
            'Nowhere',
          ],
          hint: 'Pilih Kecamatan',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Alamat'),
        SizedBox(height: 16),
        new TextField(
          textAlignVertical: TextAlignVertical.center,
          showCursor: true,
          cursorColor: Colors.black45,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: 'Tulis Alamat Lengkap',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        ),
        SizedBox(height: 16),
        Divider(thickness: 1),
      ],
    );
  }

  Widget _individu({String email}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textitem('Pekerjaan'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: listPekerjaan,
          hint: 'Pilih Pekerjaan',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Tanggal Lahir'),
        SizedBox(height: 16),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextField(
            showCursor: true,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(Icons.calendar_month_outlined),
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
                // orang.data != null ? orang.data.tanggalLahir : "",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
            controller: _tanggalLahirController,
            onTap: () async {
              FocusScope.of(context).requestFocus(new FocusNode());
              DateTime pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(
                      2000), //DateTime.now() - not to allow to choose before today.
                  lastDate: DateTime(2101));
              if (pickedDate != null) {
                print(
                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                print(
                    formattedDate); //formatted date output using intl package =>  2021-03-16
                _tanggalLahirController.text = formattedDate;
              } else {
                print("Date is not selected");
              }
            },
          ),
        ),
        SizedBox(height: 24),
        _textitem("Jenis Kelamin"),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio(
                activeColor: Colors.deepOrange[800],
                value: 0,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                groupValue: _groupValue,
                onChanged: (jenisKelamin) {
                  setState(() {
                    _groupValue = jenisKelamin;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Laki-laki',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 20,
              ),
              Radio(
                activeColor: Colors.deepOrange[800],
                value: 1,
                groupValue: _groupValue,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (jenisKelamin) {
                  setState(() {
                    _groupValue = jenisKelamin;
                  });
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Perempuan',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        _textitem('Email'),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            email ?? 'zainalmultazam@gmail.com',
            style: TextStyle(
              color: Color(0xff717171),
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Alamat email tidak bisa diubah',
            style: TextStyle(
              color: Color(0xffFCAE03),
              fontSize: 12,
            ),
          ),
        ),
        SizedBox(height: 20),
        _textitem("No. Telepon"),
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
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Alamat Lengkap",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Provinsi'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Jawa Timur',
            'Sumatera Barat',
            'Sulawesi Utara',
            'Jawa Barat',
            'Bali',
          ],
          hint: 'Pilih Provinsi',
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Kota/Kabupaten'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Kota Bogor',
            'Surabaya',
            'Kabupaten Bogor',
            'Nowhere',
          ],
          hint: 'Pilih Kota/Kabupaten',
          showSearchBox: true,
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Kecamatan'),
        SizedBox(height: 16),
        DropdownSearch<String>(
          mode: Mode.MENU,
          showSelectedItem: true,
          items: <String>[
            'Kota Bogor',
            'Surabaya',
            'Kabupaten Bogor',
            'Nowhere',
          ],
          hint: 'Pilih Kecamatan',
          showSearchBox: true,
          dropDownButton: Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
          dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        SizedBox(height: 16),
        _textitem('Alamat'),
        SizedBox(height: 16),
        new TextField(
          textAlignVertical: TextAlignVertical.center,
          showCursor: true,
          cursorColor: Colors.black45,
          decoration: InputDecoration(
            isCollapsed: true,
            hintText: 'Tulis Alamat Lengkap',
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBody() {
    return ListView(
      children: [
        Column(
          children: [
            _buildContent(),
          ],
        ),
      ],
    );
  }

  // var NameController =  TextEditingController();
  // var EmailController =  TextEditingController();
  // var PhoneController =  TextEditingController();
  // var AddressController =  TextEditingController();
  // var DescriptionController =  TextEditingController();

  Widget _buildContent() {
    // return FutureBuilder<User>(
    //     future: User.fetchUser(),
    //     builder: (context, orang) {
    //       if (orang.connectionState == ConnectionState.done) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 36,
          ),
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/180'),
                  backgroundColor: Colors.transparent,
                ),
                Positioned(
                  right: -24,
                  bottom: 0,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.black54,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      size: 24.0,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 24),
          _textitem('Nama Lengkap'),
          SizedBox(height: 16),
          TextField(
            showCursor: true,
            controller: _nameController,
            // ..text = orang.data != null ? orang.data.name : "",
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
                // hintText: orang.data != null ? orang.data.name : "",
                hintStyle: TextStyle(fontSize: 16, color: Colors.grey)),
            // controller
          ),
          SizedBox(height: 24),
          _textitem("Username"),
          SizedBox(height: 16),
          TextField(
            textAlignVertical: TextAlignVertical.center,
            showCursor: true,
            controller: _userNameController,
            cursorColor: Colors.black45,
            decoration: InputDecoration(
              isCollapsed: true,
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text('@')),
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
          SizedBox(height: 24),
          _textitem("Jenis Akun"),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Radio(
                  activeColor: Colors.deepOrange[800],
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  value: JenisAkun.individu,
                  groupValue: _jenisAkun,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    _jenisAkun = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Pribadi',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 24,
                ),
                Radio(
                  activeColor: Colors.deepOrange[800],
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  value: JenisAkun.organisasi,
                  groupValue: _jenisAkun,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    _jenisAkun = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Organisasi',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          _jenisAkun == JenisAkun.organisasi ? _organisasi() : _individu(),
          SizedBox(height: 24),
          pedulyButton(
              context: context,
              text: "Simpan",
              isEnabled: true,
              onPressed: () {
                _updateprofile();
              }),
          SizedBox(height: 16),
        ],
      ),
    );
    // } else {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }
    // });
  }

  Future<void> _updateprofile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      print("TOKEN : " + prefs.getString('login').toString());
      final url = Uri.parse('https://api.peduly.com/api/user');

      Map<String, String> requestBody = <String, String>{
        'name': _nameController.text,
        'username': _userNameController.text,
        'tipe': null,
        'pekerjaan': null,
        'jenis_organisasi': null,
        'tanggal_lahir': null,
        'jenis_kelamin': null,
        'no_telp': null,
        'provinsi': null,
        'kabupaten': null,
        'kecamatan': null,
      };

      var body = json.encode(requestBody);

      var request = await http.post(
        url,
        body: body,
        headers: {
          'Authorization': 'Bearer ' + prefs.getString('login'),
          'Accept': 'application/json',
          // HttpHeaders.authorizationHeader: 'Bearer ' + prefs.getString('login'),
        },
      );
      print(body);
      print(request.body);
      if (request.statusCode >= 200 && request.statusCode < 400) {
        print('Profile Updated');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Profile Updated")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Connection Failed")));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Connection Error")));
    }
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

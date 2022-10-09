import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/buttons/peduly_button.dart';
import 'package:peduly_app/widgets/commons/peduly_text_field.dart';
import 'package:peduly_app/widgets/text/reminder_text.dart';

class GalangDanaScreen extends StatefulWidget {
  const GalangDanaScreen({Key key}) : super(key: key);

  @override
  _GalangDanaScreenState createState() => _GalangDanaScreenState();
}

class _GalangDanaScreenState extends State<GalangDanaScreen> {
  bool isCompleted = false;
  int _currentStep = 0;

  String dropDownValueKategori = "Bencana Alam";
  String dropDownValueBatasWaktu = "Pilih tanggal batas waktu";
  String dropDownValueLokasi = "Surabaya";

  bool _isAdministrationChecked = false;
  bool _isAgreementChecked = false;

  // Text Field Controller
  final _judulController = TextEditingController();
  final _targetController = TextEditingController();
  // final _lokasiController = TextEditingController();
  final _alamatLengkapController = TextEditingController();
  final _linkController = TextEditingController();
  final _tujuanController = TextEditingController();
  final _penerimaController = TextEditingController();
  final _rincianController = TextEditingController();
  final _deskripsiController = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isCompleted ? _completed() : _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Campaign Saya",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Theme(
              data: ThemeData(
                  colorScheme:
                      ColorScheme.light(primary: Colors.deepOrange[800])),
              child: Stepper(
                currentStep: _currentStep,
                type: StepperType.horizontal,
                steps: _getSteps(),
                onStepCancel: _currentStep == 0
                    ? null
                    : () => setState(() {
                          _currentStep -= 1;
                        }),
                onStepContinue: () {
                  final isLastStep = _currentStep == _getSteps().length - 1;

                  if (isLastStep) {
                    setState(() {
                      isCompleted = true;
                    });
                    print("Completed");
                  } else {
                    setState(() {
                      _currentStep += 1;
                    });
                  }
                },
                controlsBuilder:
                    (BuildContext context, ControlsDetails controls) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: controls.onStepCancel,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 17,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffEBEBEB),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.chevron_left,
                                        color: Colors.black),
                                    Text(
                                      'KEMBALI',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: controls.onStepContinue,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 17),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xffE7513B),
                                ),
                                child: Text(
                                  _currentStep == 2 ? 'KIRIM' : 'LANJUT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 374,
                          padding: EdgeInsets.symmetric(
                            vertical: 17,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Text(
                            'BATALKAN',
                            style: TextStyle(
                                color: Color(0xffFCAE03),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Step> _getSteps() => [
        Step(
          state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 0 ? true : false,
          title: Text("Detail"),
          content: _halamanPertama(),
        ),
        Step(
          state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: _currentStep >= 1 ? true : false,
          title: Text("Foto & Deskripsi"),
          content: _halamanKedua(),
        ),
        Step(
          isActive: _currentStep >= 2 ? true : false,
          title: Text("Preview"),
          content: _halamanKetiga(),
        ),
      ];

  Widget _halamanPertama() {
    return Container(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Kategori untuk galang ini",
                children: [
                  TextSpan(text: " *", style: TextStyle(color: Colors.red))
                ],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: 12),
            Container(
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
                    value: dropDownValueKategori,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        dropDownValueKategori = value;
                      });
                    },
                    items: <String>['Bencana Alam', 'Sumbangan', 'Free', 'Four']
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
            ),
            SizedBox(height: 12),
            PedulyTextField(
              text: RichText(
                text: TextSpan(
                  text: "Judul yang tepat untuk galang dana ini",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              hint: "Contoh : Bantu pemulihan korban tsunami",
              controller: _judulController,
            ),
            RichText(
              text: TextSpan(
                text: "Target Donasi",
                children: [
                  TextSpan(text: " *", style: TextStyle(color: Colors.red))
                ],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              controller: _targetController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: "tes",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Padding(
                      padding: EdgeInsets.only(right: 12, top: 15, bottom: 15),
                      child: Text("\Rp"),
                    ),
                  ),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(
                  vertical: -5,
                ),
              ),
            ),
            SizedBox(height: 12),
            RichText(
              text: TextSpan(
                text: "Batas Akhir Penggalangan Dana",
                children: [
                  TextSpan(text: " *", style: TextStyle(color: Colors.red))
                ],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(height: 12),
            Container(
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
                    value: dropDownValueBatasWaktu,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        dropDownValueBatasWaktu = value;
                      });
                    },
                    items: <String>[
                      'Pilih tanggal batas waktu',
                      'Besok',
                      'Lusa'
                    ].map<DropdownMenuItem<String>>(
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
            ),
            SizedBox(height: 8),
            reminderText(text: batasWaktu),
            SizedBox(height: 12),
            Container(
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
                    value: dropDownValueLokasi,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        dropDownValueLokasi = value;
                      });
                    },
                    items: <String>['Surabaya', 'Bogor', 'Bali']
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
            ),
            SizedBox(height: 12),
            PedulyTextField(
              text: RichText(
                text: TextSpan(
                  text: "Alamat Lengkap",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              hint: "Contoh : Jl. Kavling DPR no. 27 Sidoarjo",
              controller: _alamatLengkapController,
            ),
            RichText(
              text: TextSpan(
                text: "Buat link untuk penggalang dana",
                children: [
                  TextSpan(text: " *", style: TextStyle(color: Colors.red))
                ],
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            TextField(
              showCursor: true,
              cursorColor: Colors.black45,
              controller: _linkController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black45,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: "Contoh : bantuarya",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: Colors.grey))),
                    child: Padding(
                      padding: EdgeInsets.only(right: 12, top: 15, bottom: 15),
                      child: Text("\peduly.com/"),
                    ),
                  ),
                ),
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(
                  vertical: -5,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            reminderText(text: penggalanganDanaLink),
            SizedBox(
              height: 12,
            ),
            PedulyTextField(
              text: RichText(
                text: TextSpan(
                  text: "Tujuan Galang Dana",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              hint: "Contoh : Membantu para korban tsunami",
              controller: _tujuanController,
            ),
            PedulyTextField(
              text: RichText(
                text: TextSpan(
                  text: "Penerima manfaat",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              hint: "Contoh : Pak Marsani dan tetangganya",
              controller: _penerimaController,
            ),
            PedulyTextField(
              text: RichText(
                text: TextSpan(
                  text: "Penerima manfaat",
                  children: [
                    TextSpan(text: " *", style: TextStyle(color: Colors.red))
                  ],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
              maxLines: 5,
              hint:
                  "Tulis sedetail mungkin rencana penggunaan dana. Contoh : Membeli kursi roda, pembelian material",
              controller: _rincianController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _halamanKedua() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Foto Galang Dana",
              children: [
                TextSpan(text: " *", style: TextStyle(color: Colors.red))
              ],
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 70),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Upload Foto",
                style: TextStyle(fontSize: 20, color: Colors.deepOrange[800]),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          reminderText(text: fotoReminder),
          SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              text: "Deskripsi",
              children: [
                TextSpan(text: " *", style: TextStyle(color: Colors.red)),
              ],
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          SizedBox(height: 12),
          Text(
            deskripsiSubTitle,
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 12),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Contoh Deskripsi"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jangan lupa isi bagian kosong dengan kata yang sesuai untuk penggalangan Anda.',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 12),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 24),
                            child: Text(deskripsiTemplate,
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                          ),
                        ),
                        pedulyButton(
                            context: context,
                            text: "Copy ke deskripsi",
                            isEnabled: true,
                            onPressed: () {
                              _deskripsiController.text = deskripsiTemplate;
                            })
                      ],
                    ),
                  );
                },
              );
            },
            child: Text(
              "Lihat contoh template",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.deepOrange[800],
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          TextField(
            maxLines: 7,
            controller: _deskripsiController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black45,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget _halamanKetiga() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/upload.png",
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 115,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 11),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepOrange, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            child:
                Text('Kemanusiaan', style: TextStyle(color: Colors.deepOrange)),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Bantu Afi Sembuh dari Penyakit Komplikasi",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                "Rp 0",
                style: TextStyle(
                    color: Colors.deepOrange[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                " terkumpul dari ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "Rp 400.000.000 ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: LinearProgressIndicator(
              value: 0.25,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "0",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Donatur",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "192",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "hari lagi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Deskripsi",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              Text(
                "23 Agustus 2021",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            child: Text(contohDeskripisi),
          ),
          SizedBox(
            height: 25,
          ),
          Divider(
            thickness: 4,
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: Row(
                children: [
                  SizedBox(
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      checkColor: Colors.white,
                      activeColor: Color(0xffE7513B),
                      value: _isAdministrationChecked,
                      onChanged: (value) {
                        setState(() {
                          _isAdministrationChecked = value;
                        });
                      },
                    ),
                  ),
                  // NOTE: Buat containernya memiliki radius 15
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.only(right: 16),
                      child: RichText(
                        text: TextSpan(
                          text: "Saya setuju dengan",
                          children: [
                            TextSpan(
                                text: " Syarat & ketentuan Donasi",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12)),
                            TextSpan(
                                text: " di Peduly.com, termasuk",
                                style: TextStyle(fontSize: 12)),
                            TextSpan(
                                text: " biaya administrasi platform",
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12)),
                            TextSpan(
                                text:
                                    " sebesar 5% dari total donasi online yang terkumpul",
                                style: TextStyle(fontSize: 12)),
                          ],
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 48),
                        child: Text(
                          "Komitmen Peduly",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.only(left: 48, right: 16),
                        child: RichText(
                          text: TextSpan(
                            text: "Peduly berkomitmen untuk memastikan",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            children: [
                              TextSpan(
                                  text:
                                      " dana donasi benar-benar diterima oleh penerima manfaat,",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text:
                                      " baik dengan memverifikasi, mendampingi, hingga kunjungan langsung ke lapangan jika diperlukan"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 48, right: 16),
                        child: Text(
                          "Jika penerima manfaat tidak memiliki rekening, Peduly akan membantu penyaluran donasi melalui yayasan atau komunitas terpercaya yang menjadi partner Peduly",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          checkColor: Colors.white,
                          activeColor: Colors.deepOrange[800],
                          value: _isAgreementChecked,
                          onChanged: (value) {
                            setState(() {
                              _isAgreementChecked = value;
                            });
                          },
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.only(right: 16),
                          child: RichText(
                            text: TextSpan(
                              text: 'Dengan klik "Setuju", Anda menjamin',
                              children: [
                                TextSpan(
                                    text: " kebenaran",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                TextSpan(
                                    text:
                                        " dari informasi yang diberikan dan menyetujui untuk",
                                    style: TextStyle(fontSize: 12)),
                                TextSpan(
                                    text: " patuh",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600)),
                                TextSpan(
                                    text:
                                        " dengan segala ketentuan, tindakan, dan keputusan dari Peduly",
                                    style: TextStyle(fontSize: 12)),
                              ],
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _completed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/checklist.png'),
            SizedBox(
              height: 50,
            ),
            Text(
              'Galang Dana Dalam Proses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Review mungkin berlangsung selama 30 menit',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff717171),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 95),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffE7513B)),
                  child: Text(
                    'Ke Halaman Utama',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xffE7513B)),
                      color: Colors.white),
                  child: Text(
                    'Tips Menggalang Dana',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffE7513B)),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

var batasWaktu = "Link ini digunakan untuk menyebarkan pengalangan dana";

var penggalanganDanaLink =
    "Link ini digunakan untuk menyebarkan pengalangan dana";

var fotoReminder =
    "Ukuran foto harus berukuran 1280 x 720 pixels dan format .JPG/.PNG/.JPEG";

var deskripsiSubTitle =
    "Ceritakan tentang diri kami dan alasan penggalangan dana, dan rencana penggunaan dana atau kamu bisa menggunakan template yang kami sediakan dibawah ini :";

var contohDeskripisi =
    ("Peduly Malang Calling for volunteers!\nHalo rek, Peduly malang membuka kesempatan besar buat kamu yang berdomisili di malang dan ingin menambah wawasan, pengalaman, dan relasi dalam sebuah");

var deskripsiTemplate =
    "Halo #Sobat Peduly, \nPerkenalkan saya (Nama), kesibukan saya sehari-hari sebagai (pekerjaan). Saya ingin menggalang dana untuk membantu orang. \nSaya tergerak menggalang dana karena ___ \n\nDonasi yang terkumpul nantinya akan digunakan untuk;\n(kebutuhan)";

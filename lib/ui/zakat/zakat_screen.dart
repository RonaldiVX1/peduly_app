import 'package:flutter/material.dart';
import 'package:peduly_app/ui/zakat/widget/zakat_type.dart';
import 'package:peduly_app/widgets/buttons/peduly_dark_blue_button.dart';
import 'package:peduly_app/widgets/commons/peduly_text_field.dart';

class ZakatScreen extends StatefulWidget {
  static const routeName = "/zakatScreen";

  @override
  _ZakatScreenState createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen>
    with SingleTickerProviderStateMixin {

  TabController _controller;

  int _tabIndex;

  final List<Widget> myTabs = <Widget>[
    Container(
      height: 25,
      child: Text(
        "Zakat Maal",
        style: TextStyle(color: Colors.black),
      ),
    ),
    Container(
      height: 25,
      child: Text(
        "Zakat Profesi",
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  // Tab 1
  TextEditingController _penghasilanPerBulanController;
  TextEditingController _pendapatanLainController;
  TextEditingController _utangCicilanController;

  // Tab 2
  TextEditingController _depositoTabunganGiroController;
  TextEditingController _propertiKendaraanController;
  TextEditingController _emasPerakPermataController;
  TextEditingController _sahamPiutangController;
  TextEditingController _hutangPribadiController;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: myTabs.length);
    //tambahkan SingleTickerProviderStateMikin pada class _HomeState
    _controller.addListener(() {
      setState(() {
        _tabIndex = _controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, top: 16),
            child: Text(
              "Bayar zakat pada amil zakat\nresmi di Indonesia",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(height: 16),
          ZakatType(),
          SizedBox(height: 24),
          Divider(thickness: 4, color: Colors.grey[200]),
          SizedBox(height: 24),
          Center(
            child: Text(
              "Kalkulator Zakat",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide:
                      BorderSide(width: 1, color: Colors.deepOrange[800]),
                  insets: EdgeInsets.symmetric(horizontal: 64.0),
                ),
                indicatorColor: Colors.deepOrange[800],
                controller: _controller,
                tabs: myTabs,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: SizedBox(
              height: 600,
              child: TabBarView(
                controller: _controller,
                children: [
                  // Tab 1 Zakat Maal
                  _buildTabZakatMaal(),
                  // Tab 2 Zakat Profesi
                  _buildTabZakatProfesi(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTabZakatMaal() {
    return Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PedulyTextField(
            text: RichText(
              text: TextSpan(
                text: "Penghasilan per-bulan",
                style: TextStyle(color: Colors.black),
                children: [
                  TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.deepOrange[800]),
                  )
                ],
              ),
            ),
            hint: "Masukkan total penghasilan",
            controller: _penghasilanPerBulanController,
          ),
          PedulyTextField(
            text: Text("Pendapatan lain per-bulan (opsional)"),
            hint: "Masukkan total pendapatan lain jika ada",
            controller: _pendapatanLainController,
          ),
          PedulyTextField(
            text: Text("Utang cicilan per-bulan"),
            hint: "Masukkan total pendapatan lain jika ada",
            controller: _utangCicilanController,
          ),
          pedulyDarkBlueButton(
              context: context,
              text: "Hitung Zakat",
              isEnabled: true,
              onPressed: () {})
        ],
      ),
    );
  }

  Widget _buildTabZakatProfesi() {
    return Container(
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          PedulyTextField(
            text: Text("Nilai Deposito/Tabungan/Giro"),
            hint: "Optional",
            controller: _depositoTabunganGiroController,
          ),
          PedulyTextField(
            text: Text("Nilai properti & kendaraan"),
            hint: "Optional",
            controller: _propertiKendaraanController,
          ),
          PedulyTextField(
            text: Text("Emas, perak, permata atau sejenisnya"),
            hint: "Optional",
            controller: _emasPerakPermataController,
          ),
          PedulyTextField(
            text: Text("Saham Piutang"),
            hint: "Optional",
            controller: _sahamPiutangController,
          ),
          PedulyTextField(
            text: Text("Hutang pribadi yang jatuh tempo tahun ini"),
            hint: "Optional",
            controller: _hutangPribadiController,
          ),
          pedulyDarkBlueButton(
            context: context,
            text: "Hitung Zakat",
            isEnabled: true,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

double _getIndex(int index) {
  if (index == 0) {
    return 400.0;
  } else if (index == 1) {
    return 600.0;
  } else {
    return 0;
  }
}

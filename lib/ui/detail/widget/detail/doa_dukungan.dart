import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/data/model/doa.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_border_small.dart';
import 'package:peduly_app/widgets/buttons/peduly_button_with_icon.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';

class DoaDukungan extends StatefulWidget {
  int itemCount = 2;
  bool isExpanded = false;

  @override
  _DoaDukunganState createState() => _DoaDukunganState();
}

class _DoaDukunganState extends State<DoaDukungan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          height: widget.isExpanded ? 175.0 * listDoa.length : 420,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: !widget.isExpanded ? widget.itemCount : listDoa.length,
            itemBuilder: (BuildContext context, int index) {
              Doa doa = listDoa[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopSection(doa.name, doa.createdDate),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 6, 20, 0),
                      child: _buildBody(doa, context)),
                  Row(
                    children: [
                      SizedBox(
                        width: 68,
                      ),
                    ],
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: Row(
        //     children: [
        //       PedulyButtonCornerSmall(
        //         text: widget.isExpanded ? "Lihat sedikit" : "Lihat Semua",
        //         onPressed: () {
        //           setState(
        //             () {
        //               !widget.isExpanded
        //                   ? widget.isExpanded = true
        //                   : widget.isExpanded = false;
        //             },
        //           );
        //         },
        //       ),
        //       Expanded(
        //         child: PedulyButtonWithIcon(
        //           icon: SvgPicture.asset("assets/tulis_doa_icon.svg"),
        //           text: "Tulis Doa Kamu",
        //           onPressed: () {},
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

Widget _buildTopSection(String nama, int date) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
    child: SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
              backgroundColor: Color.fromRGBO(231, 81, 59, .4),
              child: Image.asset(
                'assets/image_person3.png',
                fit: BoxFit.cover,
              )),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nama,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
          Spacer(),
          Icon(
            Icons.more_vert_rounded,
            color: pGreyColor,
          )
        ],
      ),
    ),
  );
}

Widget _buildBody(Doa doa, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.only(top: 6, bottom: 6),
        child: Text(
          doa.content,
        ),
        width: MediaQuery.of(context).size.width * 0.7,
      ),
      _buildButtosSection(),
    ],
  );
}

Widget _buildButtosSection() {
  return SizedBox(
    height: 40,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(
          HEART_ICON,
          color: Color(0xffE7513B),
          height: 15,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          'Suka',
          style: TextStyle(color: Color(0xff717171), fontSize: 12),
        ),
        SizedBox(
          width: 12,
        ),
        SvgPicture.asset(
          IC_SHARE,
          height: 15,
          color: Color(0xffE7513B),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          'Bagikan',
          style: TextStyle(color: Color(0xff717171), fontSize: 12),
        ),
      ],
    ),
  );
}

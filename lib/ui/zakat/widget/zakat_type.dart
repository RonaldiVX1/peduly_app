import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ZakatType extends StatelessWidget {
  const ZakatType({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 20,
            shadowColor: Colors.black12,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: ListTile(
                  leading: SvgPicture.asset("assets/ic_1.svg"),
                  title: Text("Zakat Maal", style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Zakat yang dikenakan atas harta yang dimiliki oleh individu"),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 20,
            shadowColor: Colors.black12,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: ListTile(
                  leading: SvgPicture.asset("assets/ic_2.svg"),
                  title: Text("Zakat Profesi", style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Zakat dikeluarkan dari penghasilan bila telah mencapai nisab"),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 16,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 20,
            shadowColor: Colors.black12,
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: ListTile(
                  leading: SvgPicture.asset("assets/ic_3.svg"),
                  title: Text("Infaq", style: TextStyle(fontWeight: FontWeight.w600),),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("Mengeluarkan harta yang pokok. mencakup zakat dan non-zakat"),
                  ),
                  trailing: Icon(Icons.chevron_right_rounded),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
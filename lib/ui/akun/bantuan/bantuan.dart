import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peduly_app/utils/const_value.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class BantuanPage extends StatelessWidget {
//   const BantuanPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: pBlackColor),
//         backgroundColor: pWhiteColor,
//         title: Text('Bantuan',
//             style:
//                 pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     return WebView(
//       initialUrl: 'https://peduly.com/bantuan',
//     );
//     // return ListView(
//     //   children: [
//     //     _buildContent(),
//     //   ],
//     // );
//   }

//   Widget _buildContent() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             'Ada yang bisa kami bantu?',
//             style: pBlackTextStyle.copyWith(
//               fontSize: 20,
//               fontWeight: bold,
//             ),
//           ),
//           _boxHelp(
//             color: pPrimaryColor.withOpacity(0.12),
//             title: 'Pusat Bantuan',
//             content: 'Pertanyaan yang sering diajukan',
//             icon: IC_PUSAT_BANTUAN,
//           ),
//           _boxHelp(
//             color: pWhiteColor,
//             title: 'Pertanyaan Pers',
//             content: 'Untuk pertanyaan atau keperluan media ',
//             icon: IC_PERTANYAAN_PERS,
//           ),
//           _boxHelp(
//             color: pWhiteColor,
//             title: 'Permintaan Pembicara',
//             content: 'Permintaan pembicara untuk acara',
//             icon: IC_PERMINTAAN_PEMBICARA,
//           ),
//           _boxHelp(
//             color: pWhiteColor,
//             title: 'Karir',
//             content: 'Punya misi untuk berdampak? klik disini',
//             icon: IC_KARIR,
//           ),
//           _boxHelp(
//             color: pWhiteColor,
//             title: 'Live Chat',
//             content: 'Kirim pesan langsung melalui whatsapp',
//             icon: IC_LIVE_CHAT,
//           ),
//           SizedBox(
//             height: 50,
//           )
//         ],
//       ),
//     );
//   }

//   Widget _boxHelp({
//     @required Color color,
//     @required String title,
//     @required String content,
//     @required String icon,
//   }) {
//     return Container(
//       margin: EdgeInsets.only(top: 24, left: 20, right: 20),
//       padding: EdgeInsets.symmetric(vertical: 24, horizontal: 20),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           // BoxShadow(
//           //   color: pBlackColor,
//           //   offset: Offset(0.0, 0.1),
//           //   blurRadius: 0.16,
//           // ),
//         ],
//       ),
//       child: Row(
//         children: [
//           SvgPicture.asset(
//             icon,
//             width: 32,
//             height: 32,
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: pBlackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
//               ),
//               Text(
//                 content,
//                 style: pBlackTextStyle.copyWith(fontSize: 14),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class BantuanPage extends StatefulWidget {
//   const BantuanPage({Key key}) : super(key: key);

//   @override
//   State<BantuanPage> createState() => _BantuanPageState();
// }

// class _BantuanPageState extends State<BantuanPage> {
//   void initState() {
//     super.initState();
//     // Enable virtual display.
//     if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: pBlackColor),
//         backgroundColor: pWhiteColor,
//         title: Text('Bantuan',
//             style:
//                 pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
//       ),
//       body: _buildBody(),
//     );
//   }

// }

class BantuanPage extends StatelessWidget {
  const BantuanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: pBlackColor),
          backgroundColor: pWhiteColor,
          title: Text('Bantuan',
              style:
                  pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
        ),
        body: WebView(
          initialUrl: 'https://peduly.com/bantuan',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

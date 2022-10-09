import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';
import 'package:timelines/timelines.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class AdaYangBaruPage extends StatelessWidget {
//   const AdaYangBaruPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: pWhiteColor,
//         iconTheme: IconThemeData(color: pBlackColor),
//         title: Text(
//           'Ada yang baru',
//           style: pBlackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
//         ),
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: [
//               _topBox(),
//               SizedBox(height: 32),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Lihat aktivitas donasi untuk mempermudah keberlangsungan donasi yang telah kamu lakukan.\n\nLihat semua pembaruan produk Peduly sebelumnya untuk mengetahui lebih lanjut ',
//               ),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Nikmati kemudahan donasi barang mulai dari pakaian anak atau tupperwar yang masih layak pakai untuk diberikan kepada orang lain',
//               ),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Lihat aktivitas donasi untuk mempermudah keberlangsungan donasi yang telah kamu lakukan.\n\nLihat semua pembaruan produk Peduly sebelumnya untuk mengetahui lebih lanjut ',
//               ),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Nikmati kemudahan donasi barang mulai dari pakaian anak atau tupperwar yang masih layak pakai untuk diberikan kepada orang lain',
//               ),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Lihat aktivitas donasi untuk mempermudah keberlangsungan donasi yang telah kamu lakukan.\n\nLihat semua pembaruan produk Peduly sebelumnya untuk mengetahui lebih lanjut ',
//               ),
//               _timeLines(
//                 tanggal: '17 Juli 2022',
//                 title: 'Riwayat Donasi',
//                 updateMessage:
//                     'Nikmati kemudahan donasi barang mulai dari pakaian anak atau tupperwar yang masih layak pakai untuk diberikan kepada orang lain',
//               ),
//               SizedBox(height: 32),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _topBox() {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
//       color: pFourGreyColor,
//       child: Text(
//         'Lihat semua pembaruan produk Peduly',
//         style: pWhiteTextStyle.copyWith(fontSize: 16, fontWeight: regular),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget _timeLines({
//     @required String tanggal,
//     @required String title,
//     @required String updateMessage,
//   }) {
//     return Container(
//         padding: EdgeInsets.only(left: 30),
//         child: TimelineTile(
//           nodeAlign: TimelineNodeAlign.start,
//           contents: Container(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Text(
//                 tanggal,
//                 style:
//                     pBlackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
//               ),
//               SizedBox(height: 9),
//               Text(
//                 title,
//                 style: pBlackTextStyle.copyWith(
//                     fontWeight: semiBold, fontSize: 18),
//               ),
//               SizedBox(height: 9),
//               Text(
//                 updateMessage,
//                 style:
//                     pBlackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
//               ),
//               SizedBox(height: 32),
//             ]),
//           ),
//           node: TimelineNode(
//             indicatorPosition: 0,
//             indicator: DotIndicator(
//               color: pPrimaryColor,
//               size: 14,
//             ),
//             startConnector: SolidLineConnector(),
//             endConnector: SolidLineConnector(
//               color: pFourGreyColor,
//               thickness: 2,
//             ),
//           ),
//         ));
//   }
// }

class AdaYangBaruPage extends StatelessWidget {
  const AdaYangBaruPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: pBlackColor),
          backgroundColor: pWhiteColor,
          title: Text('Ada yang baru',
              style:
                  pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
        ),
        body: WebView(
          initialUrl: 'https://peduly.com/terbaru',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

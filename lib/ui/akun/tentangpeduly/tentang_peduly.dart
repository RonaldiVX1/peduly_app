import 'package:flutter/material.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class TentangPeduly extends StatelessWidget {
//   const TentangPeduly({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Tentang Kami',
//           style: pBlackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
//         ),
//         backgroundColor: pWhiteColor,
//         iconTheme: IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     return ListView(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 20),
//           child: Column(
//             children: [
//               _logo(),
//               _content(),
//               _boxInfo(),
//               _kataMereka(),
//               _carousel(),
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _logo() {
//     return Image.asset(
//       'assets/logo.png',
//       width: 140,
//       height: 32,
//     );
//   }

//   Widget _content() {
//     return Column(
//       children: [
//         SizedBox(height: 39),
//         Text(
//           'Berdiri sejak tahun 2018, Peduly telah menghubungkan banyak kebaikan masyarakat Indonesia. Mengubah rasa peduli menjadi sebuah tindakan. Di Peduly kami percaya, kepedulian harus disebar luaskan, karena begitulah perubahan bisa terjadi.\n',
//           style: pBlackTextStyle.copyWith(fontSize: 16),
//         ),
//         Text(
//             'Oleh karena itu, kami membuat niat baik menjadi aksi baik lebih mudah dengan melibatkan teknologi. Agar setiap individu atau organisasi bisa menyebar luaskan kisah baiknya sehingga menginspirasi banyak orang.\n',
//             style: pBlackTextStyle.copyWith(fontSize: 16)),
//         // Text(
//         //     'Kami mengawali Peduly dari langkah kecil dan mengubahnya menjadi gerakan yang jauh lebih besar. Dengan gotong royong #WargaBaik kami yakin kita bersama bisa bantu masyarakat lebih banyak lagi.\n',
//         //     style: pBlackTextStyle.copyWith(fontSize: 16)),
//       ],
//     );
//   }

//   Widget _boxInfo() {
//     return Column(
//       children: [
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _box(information: '350', title: 'Galang Dana'),
//             _box(information: '20.000', title: 'Donatur'),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _box(information: '132', title: 'Organisasi'),
//             _box(information: '600', title: 'Perusahaan'),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _box(information: '2.500', title: 'Volunteer'),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _box({
//     @required String information,
//     @required String title,
//   }) {
//     return Container(
//       width: 177,
//       height: 120,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: pPrimaryColor.withOpacity(0.12)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             information,
//             style: pBlackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
//           ),
//           Text(
//             title,
//             style: pBlackTextStyle.copyWith(fontSize: 18, fontWeight: regular),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _kataMereka() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: Text(
//         "Kata Mereka",
//         style: pBlackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
//       ),
//     );
//   }

//   Widget _carousel() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             _boxCarousel(
//                 title: 'Transparansi',
//                 content:
//                     'Prioritas kami menjaga keamanan dan kenyaman kamu dalam menggalang dana dan donasi. Untuk itulah kami bekerka keras sepanjang hari.'),
//             _boxCarousel(
//                 title: 'Fitur Lengkap',
//                 content:
//                     'Peduly memberikan kemudahan dalam melakukan galang dana dan donasi. Kami juga terus berinovasi untuk merubah cara dunia memberi.'),
//             _boxCarousel(
//                 title: 'Jangkauan Luas',
//                 content:
//                     'Kami mempermudah ceritamu lebih menarik serta menyebarkan lebih luas lagi lewat email, sosial media, komunitas, dan platform lainnya. '),
//             _boxCarousel(
//                 title: 'Siap Melayani',
//                 content:
//                     'Semua pertanyaan yang kamu ajukan itu penting. Itulah sebabnya kami terus berusaha memberikan respon yang cepat. ')
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _boxCarousel({
//     @required String title,
//     @required String content,
//   }) {
//     return Container(
//       margin: EdgeInsets.only(right: 40),
//       width: 280,
//       height: 170,
//       decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 1),
//             color: pBlackColor.withOpacity(0.6),
//             blurRadius: 0.16,
//             spreadRadius: 0,
//           )
//         ],
//         color: pWhiteColor,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               title,
//               style: pPrimaryTextStyle.copyWith(
//                   fontSize: 14, fontWeight: semiBold),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             Text(
//               content,
//               style:
//                   pBlackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class TentangPeduly extends StatelessWidget {
  const TentangPeduly({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: pBlackColor),
          backgroundColor: pWhiteColor,
          title: Text('Tentang Kami',
              style:
                  pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
        ),
        body: WebView(
          initialUrl: 'https://peduly.com/tentang',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

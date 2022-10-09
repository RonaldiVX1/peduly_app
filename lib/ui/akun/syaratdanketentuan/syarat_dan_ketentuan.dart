import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../widgets/theme/theme_color.dart';
import '../../../widgets/theme/theme_style.dart';
import '../../../widgets/theme/theme_weight.dart';

class SyaratDanKetentuanPage extends StatelessWidget {
  const SyaratDanKetentuanPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: pBlackColor),
          backgroundColor: pWhiteColor,
          title: Text('Syarat dan Ketentuan',
              style:
                  pBlackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold)),
        ),
        body: WebView(
          initialUrl: 'https://help.peduly.com/syarat-ketentuan/',
          javascriptMode: JavascriptMode.unrestricted,
        ));
  }
}

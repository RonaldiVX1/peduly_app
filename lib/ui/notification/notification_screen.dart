import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/notification.dart';
import 'package:peduly_app/widgets/appbars/back_to_named_button.dart';
import 'package:peduly_app/widgets/items/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final List<Widget> myTabs = <Widget>[
    Container(
      width: double.infinity / 2,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      height: 50,
      child: Tab(
        child: Text(
          "Terbaru",
        ),
      ),
    ),
    Container(
      width: double.infinity / 2,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),
      ),
      height: 50,
      child: Tab(
        child: Text(
          "Update",
        ),
      ),
    ),
  ];

  Widget _createTab(String text) {
    return Tab(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(
            child: Center(child: Text(text)),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 1),
                top: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  @override
  initState() {
    super.initState();
    _controller = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Notifikasi",
            style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          bottom: TabBar(
            tabs: myTabs,
            labelPadding: EdgeInsets.all(0),
            labelColor: Colors.deepOrange[800],
            unselectedLabelColor: Colors.grey,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3, color: Colors.deepOrange[800]),
            ),
          ),
        ),
        body: TabBarView(
            children: [_buildNewestNotification(), _buildUpdateNotification()]),
      ),
    );
  }

  Widget _buildNewestNotification() {
    return ListView.builder(
      itemCount: listNotificationTerbaru.length,
      itemBuilder: (BuildContext context, int index) {
        NotificationList notificationList = listNotificationTerbaru[index];
        return notificationItem(notification: notificationList);
      },
    );
  }

  Widget _buildUpdateNotification() {
    return ListView.builder(
      itemCount: listNotificationUpdate.length,
      itemBuilder: (BuildContext context, int index) {
        NotificationList notificationList = listNotificationUpdate[index];
        return notificationItem(notification: notificationList);
      },
    );
  }
}

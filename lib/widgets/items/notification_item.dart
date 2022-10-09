import 'package:flutter/material.dart';
import 'package:peduly_app/data/model/notification.dart';

Widget notificationItem({NotificationList notification}) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
      color: notification.isWatched ? Colors.white : Colors.red[50],
      border: Border(bottom: BorderSide(width: 1, color: Colors.black12))
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(notification.title, style: TextStyle(fontWeight: FontWeight.w600),),
          SizedBox(height: 8,),
          Text(notification.description, style: TextStyle(color: Colors.grey),)
        ],
      ),
    ),
  );
}

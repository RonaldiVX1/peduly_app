class NotificationList {
  final String title;
  final String description;
  final bool isWatched;

  NotificationList({
    this.title,
    this.description,
    this.isWatched,
  });

}

var listNotificationTerbaru = [
  NotificationList(
    title : "Donasimu Tersalurkan",
    description: "Donasimu sudah diterima oleh penggalang dana, kamu bisa menuliskan doa baik",
    isWatched: false,
  ),
  NotificationList(
    title : "Donasimu Tersalurkan",
    description: "Donasimu sudah diterima oleh penggalang dana, kamu bisa menuliskan doa baik",
    isWatched: true,
  )
];

var listNotificationUpdate = [
  NotificationList(
    title: "Donasi Rutin",
    description : "Fitur baru dari kami agar memudahkan Donasi secara rutin",
    isWatched: false,
  ),
  NotificationList(
    title : "Volueteer",
    description: "Voluenteer telah dibuka, kamu bisa mengikuti volunteer agar bisa berbagi manfaat dengan banyak orang",
    isWatched: true,
  )
];

import 'package:peduly_app/utils/dummy_data.dart';

class Donation {
  final int id;
  final String title;
  final String imageUrl;
  final int currentTotal;
  final int dayRemaining;
  final int targetTotal;
  final String category;

  Donation({
    this.id,
    this.title,
    this.imageUrl,
    this.currentTotal,
    this.dayRemaining,
    this.targetTotal,
    this.category,
  });
}

var listDonation = [
  Donation(
      id: 1,
      title: 'Gotong Royong Melawan Covid',
      imageUrl: imagesUrl[0],
      currentTotal: 10000000,
      dayRemaining: 54,
      targetTotal: 14500000),
  Donation(
    id: 2,
    title: 'Bantu Adik Ini',
    imageUrl: imagesUrl[1],
    currentTotal: 4500000,
    dayRemaining: 24,
    targetTotal: 1000000,
  ),
  Donation(
    id: 3,
    title: 'Bangun Rumah Dengan ',
    imageUrl: imagesUrl[2],
    currentTotal: 600000,
    dayRemaining: 36,
    targetTotal: 7000000,
  )
];

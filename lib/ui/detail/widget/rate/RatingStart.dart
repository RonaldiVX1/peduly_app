import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class RatingStar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingStar(
      {@required this.starCount, @required this.rating, @required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: 11,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
        size: 11,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
        size: 11,
      );
    }
    return SizedBox(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: new List.generate(
              starCount, (index) => buildStar(context, index))),
    );
  }
}

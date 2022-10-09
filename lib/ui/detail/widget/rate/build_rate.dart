import 'package:flutter/material.dart';
import 'package:peduly_app/ui/detail/widget/rate/RatingStart.dart';
import 'package:peduly_app/widgets/theme/theme_color.dart';
import 'package:peduly_app/widgets/theme/theme_style.dart';
import 'package:peduly_app/widgets/theme/theme_weight.dart';

class BuildRate extends StatelessWidget {
  const BuildRate({Key key, @required this.rating, @required this.name})
      : super(key: key);

  final double rating;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(231, 81, 59, .4),
                  child: Icon(
                    Icons.person_outline,
                    color: Color.fromRGBO(231, 81, 59, 1),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              SizedBox(
                height: 50,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: semiBold,
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      // RatingStar(
                      //     starCount: 5, rating: rating, color: Colors.yellow)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.star, color: Colors.yellow, size: 13),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            rating.toString(),
                            style: pBlackSecondTextStyle.copyWith(
                                fontSize: 12, fontWeight: bold),
                          )
                        ],
                      ),
                    ]),
              )
            ],
          ),
          Container(
            height: 30,
            width: 80,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: pPrimaryColor),
            ),
            child: Center(
                child: Text(
              "Ikuti",
              style: pBlackSecondTextStyle.copyWith(fontWeight: semiBold),
            )),
          )
        ],
      ),
    );
  }
}

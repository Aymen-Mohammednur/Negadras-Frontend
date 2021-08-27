import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/star_rating.dart';

class BusinessCard extends StatefulWidget {
  final String businessName;
  final double rating;
  final String locationInfo;
  BusinessCard({
    Key? key,
    required this.businessName,
    required this.rating,
    required this.locationInfo,
  }) : super(key: key);

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Card(
        elevation: 10,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.businessName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  StarRating(
                    color: Colors.blue,
                    rating: widget.rating,
                    onRatingChanged: (rating) => setState(() => {}),
                  ),
                  Text(widget.locationInfo)
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                isFavorite = !isFavorite;
                setState(() {});
              },
              child: isFavorite
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border_outlined),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/images/hacker.jpeg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

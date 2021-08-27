import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:negadras/buisness/screens/widgets/circular_avatar.dart';
import 'package:negadras/buisness/screens/widgets/star_rating.dart';

class BusinessCard extends StatefulWidget {
  final String businessName;
  final double rating;
  final String locationInfo;
  final String imagePath;
  BusinessCard({
    Key? key,
    required this.businessName,
    required this.rating,
    required this.locationInfo,
    required this.imagePath,
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
              child: SizedBox(
                width: 120,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.businessName,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                    StarRating(
                      color: Colors.blue,
                      rating: widget.rating,
                      onRatingChanged: (rating) => setState(() => {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.locationInfo,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                ),
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
            CircularAvatar(imagePath: widget.imagePath),
          ],
        ),
      ),
    );
  }
}


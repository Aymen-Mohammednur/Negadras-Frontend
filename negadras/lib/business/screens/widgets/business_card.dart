import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/business/screens/widgets/circular_avatar.dart';
import 'package:negadras/business/screens/widgets/star_rating.dart';
import 'package:negadras/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

class BusinessCard extends StatefulWidget {
  final String businessId;
  final String businessName;
  final double rating;
  final String locationInfo;
  final String imagePath;
  final String? categoryId;
  bool isFavorite;
  bool isOwner;
  final Function from;
  BusinessCard({
    Key? key,
    required this.businessId,
    required this.businessName,
    required this.rating,
    required this.locationInfo,
    required this.imagePath,
    required this.from,
    this.categoryId,
    this.isFavorite = false,
    this.isOwner = false,
  }) : super(key: key);

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  late bool _isFavorite;
  late bool _isOwner;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
    _isOwner = widget.isOwner;
  }

  @override
  Widget build(BuildContext context) {
    final businessBloc = BlocProvider.of<BusinessBloc>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1.5),
      decoration: new BoxDecoration(
        color: Colors.black87, //background color of box
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 25.0, // soften the shadow
            spreadRadius: 5.0, //extend the shadow
            offset: Offset(
              15.0, // Move to right 10  horizontally
              15.0, // Move to bottom 10 Vertically
            ),
          )
        ],
      ),
      height: 170,
      child: Card(
        color: Color(16770977),
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
                            color: Colors.deepPurple,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    StarRating(
                      color: Colors.amberAccent,
                      rating: widget.rating,
                      onRatingChanged: (rating) => setState(() => {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.locationInfo,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.indigoAccent),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // widget.isFavorite = !widget.isFavorite;
                    // if (widget.isFavorite) {
                    //   businessBloc.add(AddToFavoritesEvent(widget.businessId));
                    // } else {
                    //   businessBloc.add(RemoveFromFavoritesEvent(widget.businessId));
                    // }
                    print("BUSINESS CARD IS CALLED FROM");
                    widget.from(_isFavorite);
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: this._isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        )
                      : Icon(
                          Icons.favorite_outline_outlined,
                          size: 30,
                        ),
                ),
                SizedBox(height: 5),
                this._isOwner
                    ? GestureDetector(
                        onTap: () {
                          // widget.isFavorite = !widget.isFavorite;
                          // if (widget.isFavorite) {
                          //   businessBloc.add(AddToFavoritesEvent(widget.businessId));
                          // } else {
                          //   businessBloc.add(RemoveFromFavoritesEvent(widget.businessId));
                          // }
                          print("BUSINESS CARD IS CALLED FROM");
                          // widget.from(_isFavorite);
                          // setState(() {
                          //   _isFavorite = !_isFavorite;
                          // });
                          Business business = new Business(
                              id: widget.businessId,
                              name: widget.businessName,
                              categoryId: widget.categoryId as String,
                              location: widget.locationInfo,
                              avgRating: 2.5);
                          context.router
                              .push(EditBusinessRoute(business: business));
                        },
                        child: Icon(
                          Icons.edit,
                          color: Colors.red,
                          size: 30,
                        ))
                    : Text("N/A"),
              ],
            ),
            Spacer(),
            CircularAvatar(imagePath: widget.imagePath),
          ],
        ),
      ),
    );
  }
}

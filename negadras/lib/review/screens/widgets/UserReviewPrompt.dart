part of 'widgets.dart';

Widget UserReviewPrompt(BuildContext context) {
  var bloc = BlocProvider.of<ReviewBloc>(context);
  var state = bloc.state;
  if (state is HasNotReviewed) {
    return _ratingPrompt(bloc);
  } else if (state is RatingEntered) {
    // return _reviewPrompt();
    return nullWidget();
  } else if (state is ClientReviewed) {
    // return _reviewSentAndLoading();
    return nullWidget();
  } else {
    return nullWidget();
  }
}

Widget _ratingPrompt(ReviewBloc bloc) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Container(
        // height: 100,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 1),
          ),
        ),
        child: Column(
          children: [
                      Text("Rate your experiece with this place...", style: normalText()),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                children: [
                  // SizedBox(height: 60),
                  Icon(Icons.account_box, size: 50),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("FirstName LastName", style: smallText()),
                    ],
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (i) {
                        return GestureDetector(
                          child: Icon(Icons.star_border),
                          onTap: () {
                            bloc.add(StartReview(rating: i));
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ],
        )),
  );
}

Widget nullWidget() => Container();

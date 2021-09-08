part of 'widgets.dart';

Widget UserReviewPrompt(BuildContext context) {
  var bloc = BlocProvider.of<ReviewBloc>(context);
  var state = bloc.state;
  print("State detected: $state");
  if (state is HasNotReviewed) {
    return _ratingPrompt(bloc);
  } else if (state is Rated) {
    return _reviewPrompt(bloc);
    // return nullWidget();
  } else if (state is ReviewSent) {
    return _userReview(bloc);
    // return nullWidget();
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
                            bloc.add(RatingEnter(rating: i+1));
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

Widget _nextButton(ReviewBloc bloc) => ElevatedButton(
          onPressed: () {
            bloc.add(ReviewAdd());
          },
          child: Text("Continue"),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                // side: BorderSide(color: Colors.red)
              ),
            ),
          ),
        );



Widget _reviewPrompt(ReviewBloc bloc) {
  Widget reviewAcceptor = Padding(
      padding: EdgeInsets.all(14),
      child: TextFormField(
        controller: bloc.reviewController,
        decoration: InputDecoration(labelText: "Describe your experience... (Optional)"),
        keyboardType: TextInputType.multiline,
        minLines: 1, //Normal textInputField will be displayed
        maxLines: 5, // when user presses enter it will adapt to it
      ));
  return Container(
    child: Column(
      children: [
        reviewAcceptor,
        Row(
          children: [
            Padding(padding: const EdgeInsets.only(left:12.0), child: _nextButton(bloc), ),
          ],
        ),
      ],
    ),
  );
}


Widget _userReview(ReviewBloc bloc){
  String dummyJson = '{"name": "FirstName LastName", "content": "${bloc.review}", "rating": "${bloc.rating}"}';
  return reviewBox(dummyJson,0);
}

Widget nullWidget() => Container();

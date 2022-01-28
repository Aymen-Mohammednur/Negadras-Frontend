part of 'widgets.dart';

class UserReviewPromptClass {
  String businessId;
  String userId;
  BuildContext context;

  UserReviewBloc? bloc;

  UserReviewPromptClass(this.context, this.businessId, this.userId) {
    bloc = BlocProvider.of<UserReviewBloc>(context);
  }
  Widget UserReviewPrompt() {
    UserReviewBloc bloc = BlocProvider.of<UserReviewBloc>(context);
    var state = bloc.state;
    if (state is UserReviewInitial)
      return _ratingPrompt(bloc);
    else if (state is Rated)
      return _reviewPrompt(bloc);
    else if (state is ReviewSent) {
      // BlocProvider.of<ReviewBloc>(context).add(PageOpen(businessId, userId));
      return userReviewBox(state.r, 2);
    } else {
      // print("The issue causing state is $state");
      return Container(child: Text("Unrecognized State"));
    }
  }

  Widget userReviewBox(review, i) {
    var userReviewButtons = (i > 0
        ? [
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'Delete your review',
              onPressed: () {
                bloc!.add(ReviewDelete(businessId, userId));
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Edit your review',
              onPressed: () {
                bloc!.add(ReviewReset());
              },
            ),
          ]
        : [Container()]);

    String name = (i == 2 ? "Your Review" : review.username);
    String content = review.reviewText;
    String rating = review.rating.toString();
    // String? ownerReply = review["reply"];

    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
      child: Container(
        // decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Icon(Icons.face),
                ),
                Text(name),
                SizedBox(width: 5),
                Text(rating),
                Icon(Icons.star),
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Text(content),
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: Row(
                children: userReviewButtons,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ratingPrompt(UserReviewBloc bloc) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.blueGrey[200]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Rate your experiece with this place...", style: normalText()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (i) {
                  return GestureDetector(
                    child: Icon(Icons.star_border),
                    onTap: () {
                      bloc.add(RatingAdd(i + 1));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reviewPrompt(UserReviewBloc bloc) {
    Widget reviewAcceptor = Padding(
        padding: EdgeInsets.all(14),
        child: TextFormField(
          controller: bloc.reviewController,

          decoration: InputDecoration(
              // focusColor: Colors.amberAccent,
              // fillColor: Colors.amberAccent,
              // hoverColor: Colors.amberAccent,
              labelText: "Describe your experience... (Optional)"),
          cursorColor: Colors.amberAccent,

          initialValue: null,
          keyboardType: TextInputType.multiline,
          minLines: 1, //Normal textInputField will be displayed
          maxLines: 5, // when user presses enter it will adapt to it
        ));
    return Container(
      decoration: BoxDecoration(color: Colors.blueGrey[200]),
      child: Column(
        children: [
          reviewAcceptor,
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: _nextButton(bloc),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nextButton(UserReviewBloc bloc) => ElevatedButton(
        onPressed: () {
          bloc.add(ReviewAdd(businessId, userId));
        },
        child: Text("Continue"),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.blueGrey[400]!),
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Colors.lightBlue[50]!),
          shadowColor:
              MaterialStateColor.resolveWith((states) => Colors.blueGrey[200]!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              // side: BorderSide(color: Colors.red)
            ),
          ),
        ),
      );

  Widget _userReview(Review reviewObj) {
    // String dummyJson = '{"name": "FirstName LastName", "content": "${bloc.state.review}", "rating": "${bloc.state.rating}"}';
    return reviewBox(reviewObj, 0);
  }

  Widget nullWidget() => Container();
}

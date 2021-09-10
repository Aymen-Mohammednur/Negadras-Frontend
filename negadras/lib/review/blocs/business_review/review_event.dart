part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}


class PageOpen extends ReviewEvent{
  String businessId;
  String userId;
  PageOpen(this.businessId, this.userId);
}


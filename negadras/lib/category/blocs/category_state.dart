part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class Fetching extends CategoryState {}

class FilterSuccess extends CategoryState {
  final List<Business> business;
  FilterSuccess(this.business);
}

class SearchSuccess extends CategoryState {
  final List<Business> business;
  SearchSuccess(this.business);
}

class CategoryOperationSuccess extends CategoryState {
  final List<Category> categories;

  CategoryOperationSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryOperationFailed extends CategoryState {}

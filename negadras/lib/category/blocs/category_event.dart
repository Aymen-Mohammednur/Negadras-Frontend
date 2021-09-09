part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class CategoryFetch extends CategoryEvent {
  const CategoryFetch();

  @override
  List<Object> get props => [];
}

// class CategoryFilter extends CategoryEvent {
//   final String categoryId;
//   CategoryFilter({required this.categoryId});

//   @override
//   List<Object> get props => [categoryId];
// }

// class CategorySearch extends CategoryEvent {
//   @override
//   List<Object> get props => [];
// }

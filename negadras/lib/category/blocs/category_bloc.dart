import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/category/models/category.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/category/repository/category_repository.dart';
import 'package:negadras/business/repository/buisness_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  final BusinessRepository businessRepository;

  CategoryBloc(
      {required this.categoryRepository, required this.businessRepository})
      : super(Fetching());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryFetch) {
      yield Fetching();
      print("Before Try");
      try {
        print("Inside Try before fetch");
        final categories = await categoryRepository.fetchAll();
        print("after fetch");
        // print("Categories: $categories");
        yield CategoryOperationSuccess(categories);
      } catch (e) {
        print(e);
        yield CategoryOperationFailed();
      }
    }

    if (event is CategorySearch) {
      yield Fetching();
      try {
        final business = await businessRepository.fetch();
        yield SearchSuccess(business);
      } catch (_) {
        yield CategoryOperationFailed();
      }
    }

    if (event is CategoryFilter) {
      yield Fetching();
      try {
        final categoryId = event.categoryId;
        final business = await businessRepository.fetchByCategory(categoryId);
        yield FilterSuccess(business);
      } catch (_) {
        yield CategoryOperationFailed();
      }
    }
  }
}

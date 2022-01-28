import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/category/models/category.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/category/repository/category_repository.dart';
import 'package:negadras/business/repository/buisness_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(Fetching());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryFetch) {
      yield Fetching();
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final val = await prefs.getString("user_id");

      try {
        final categories = await categoryRepository.fetchAll();
        yield CategoryOperationSuccess(categories);
      } catch (e) {
        yield CategoryOperationFailed();
      }
    }

  }
}

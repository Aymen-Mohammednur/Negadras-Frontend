import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/business/repository/buisness_repository.dart';
import 'package:negadras/category/blocs/category_bloc.dart';
import 'package:negadras/category/data_providers/category_data_provider.dart';
import 'package:negadras/category/repository/category_repository.dart';

class MockLoginBloc extends MockBloc<BusinessEvent, BusinessState>
    implements BusinessBloc {}

void main() {
  group('Category bloc test', () {
    blocTest<CategoryBloc, CategoryState>(
      'emits [] when nothing is added',
      build: () {
        final CategoryRepository categoryRepository =
            CategoryRepository(CategoryDataProvider());
        return CategoryBloc(categoryRepository: categoryRepository);
      },
      expect: () => <CategoryState>[],
    );

    blocTest<CategoryBloc, CategoryState>(
      'Category Fetch State',
      build: () {
        final CategoryRepository categoryRepository =
            CategoryRepository(CategoryDataProvider());
        return CategoryBloc(categoryRepository: categoryRepository);
      },
      act: (bloc) {
        return bloc.add(CategoryFetch());
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        CategoryState categoryState = Fetching();
        return [isA<CategoryState>(), isA<CategoryState>()];
      },
    );
  });
}

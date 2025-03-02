import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class AddCategoryUsecase {
  final CategoryRepository _categoryRepository;

  AddCategoryUsecase(this._categoryRepository);

  Future<void> execute(CategoryEntity category) async {
    await _categoryRepository.createCategory(category);
  }
}
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class UpdateCategoryUsecase {
  final CategoryRepository _categoryRepository;

  UpdateCategoryUsecase(this._categoryRepository);

  Future<void> call(CategoryEntity category) async {
    return await _categoryRepository.updateCategory(category);
  }
}
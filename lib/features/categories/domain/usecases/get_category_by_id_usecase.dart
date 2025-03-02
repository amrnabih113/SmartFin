import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class GetCategoryByIdUsecase {
  final CategoryRepository _categoryRepository;

  GetCategoryByIdUsecase(this._categoryRepository);

  Future<CategoryEntity> execute(String id)async {
    return await _categoryRepository.getCategoryById(id);
  }
}
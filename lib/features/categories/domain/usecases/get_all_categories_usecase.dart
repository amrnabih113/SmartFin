import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class GetAllCategoriesUsecase {
  final CategoryRepository _categoryRepository;

  GetAllCategoriesUsecase(this._categoryRepository);

  Future<List<CategoryEntity>> execute() {
    return _categoryRepository.getAllCategories();
  }
}
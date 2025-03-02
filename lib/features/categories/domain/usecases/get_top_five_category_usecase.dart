import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class GetTopFiveCategoryUsecase {
  final CategoryRepository _categoryRepository;

  GetTopFiveCategoryUsecase(this._categoryRepository);

  Future<List<CategoryEntity>> call(String type) async {
    return await _categoryRepository.getTopFiveCategories(type);
  }
}
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';

class DeleteCategoryUsecase {
  final CategoryRepository categoryRepository;

  DeleteCategoryUsecase(this.categoryRepository);

  Future<void> call(String id) async {
    return await categoryRepository.deleteCategory(id);
  }
}

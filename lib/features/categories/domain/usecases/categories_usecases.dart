import 'package:smartFin/features/auth/domain/usecases/usecase.dart';
import 'package:smartFin/features/categories/data/models/category_model.dart';
import 'package:smartFin/features/categories/domain/repository/category_repository.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';

// Create Category Use Case
class CreateCategoryUseCase implements UseCase<CategoryEntity, CategoryEntity> {
  final CategoryRepository repository;
  CreateCategoryUseCase(this.repository);

  @override
  Future<CategoryEntity> call(CategoryEntity category) async {
    final CategoryModel categoryModel = CategoryModel.fromEntity(category);
    return repository.createCategory(categoryModel);
  }
}

// Delete Category Use Case
class DeleteCategoryUseCase implements UseCase<void, String> {
  final CategoryRepository repository;
  DeleteCategoryUseCase(this.repository);

  @override
  Future<void> call(String categoryId) async {
    return repository.deleteCategory(categoryId);
  }
}

// Get Categories Use Case
class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, void> {
  final CategoryRepository repository;
  GetCategoriesUseCase(this.repository);

  @override
  Future<List<CategoryEntity>> call(void params) async {
    return repository.getCategories();
  }
}

// Get Top Five Categories Use Case
class GetTopFiveCategoriesUseCase implements UseCase<List<CategoryEntity>, String> {
  final CategoryRepository repository;
  GetTopFiveCategoriesUseCase(this.repository);

  @override
  Future<List<CategoryEntity>> call(String params) async {
    return repository.getTopFiveCategories(params);
  }
}

// Update Category Use Case
class UpdateCategoryUseCase implements UseCase<CategoryEntity, CategoryEntity> {
  final CategoryRepository repository;
  UpdateCategoryUseCase(this.repository);

  @override
  Future<CategoryEntity> call(CategoryEntity category) async {
    final CategoryModel categoryModel = CategoryModel.fromEntity(category);
    return repository.updateCategory(categoryModel);
  }
}

class SyncCategoriesWithRemoteUseCase implements UseCase<void, void> {
  final CategoryRepository repository;
  SyncCategoriesWithRemoteUseCase(this.repository);

  @override
  Future<void> call(void params) async {
    return repository.syncCategoriesWithRemote();
  }
}


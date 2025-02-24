import 'package:get/get.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/data/sqflite/sqlite_service_imp.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/entities/category_section_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/categories_usecases.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final GetCategoriesUseCase getCategoriesUseCase;
  final CreateCategoryUseCase createCategoryUseCase;
  final SyncCategoriesWithRemoteUseCase syncCategoriesWithRemoteUseCase;

  CategoriesController(
    this.getCategoriesUseCase,
    this.createCategoryUseCase,
    this.syncCategoriesWithRemoteUseCase,
  );

  final RxList<CategoryEntity> _categories = <CategoryEntity>[].obs;
  final RxList<CategoryEntity> incomeCategories = <CategoryEntity>[].obs;
  final RxList<CategoryEntity> expenseCategories = <CategoryEntity>[].obs;

  final RxList<CategorySectionEntity> categorySections =
      <CategorySectionEntity>[].obs;

  Future<void> getCategories() async {
    try {
      final result = await getCategoriesUseCase.call(null);
      _categories.assignAll(result);
      incomeCategories.clear();
      expenseCategories.clear();

      for (var category in _categories) {
        if (category.type == "income") {
          incomeCategories.add(category);
        } else {
          expenseCategories.add(category);
        }
      }
      print("Income Categories: ${incomeCategories.length}");

      // Update category sections
      categorySections.assignAll([
        CategorySectionEntity(title: "Income", categories: incomeCategories),
        CategorySectionEntity(title: "Expense", categories: expenseCategories),
      ]);
    } catch (e) {
      MyLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  Future<void> insertCategories() async {
    final dbHelper = await SqliteServiceImp().database;
    final categories = [
      {
        'name': 'Salary',
        'icon': 'briefcase',
        'color': '#2196F3',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Freelance',
        'icon': 'laptop',
        'color': '#FF9800',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Invest Rtns',
        'icon': 'chart-increase',
        'color': '#9C27B0',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Rent Inc',
        'icon': 'house',
        'color': '#795548',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Gift Money',
        'icon': 'gift',
        'color': '#F44336',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Part-time',
        'icon': 'briefcase',
        'color': '#2196F3',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'name': 'Rent',
        'icon': 'home',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Mortg Pay',
        'icon': 'house',
        'color': '#607D8B',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Elec Bill',
        'icon': 'electric-plugs',
        'color': '#FFEB3B',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Water Bill',
        'icon': 'droplet',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Net Subs',
        'icon': 'globe',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Home Ins',
        'icon': 'shield',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Home Repairs',
        'icon': 'tools',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Furniture',
        'icon': 'bed',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Car Loan',
        'icon': 'car',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Fuel & Gas',
        'icon': 'fuel',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Pub Trans',
        'icon': 'bus',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Car Maint',
        'icon': 'wrench',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Car Ins',
        'icon': 'shield',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Taxi/Rides',
        'icon': 'taxi',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Parking',
        'icon': 'parking',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Groceries',
        'icon': 'shopping-bag',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Pers Care',
        'icon': 'brush',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'House Supp',
        'icon': 'shopping-basket',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Pets',
        'icon': 'cat',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Childcare',
        'icon': 'baby',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Doctor',
        'icon': 'stethoscope',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Meds',
        'icon': 'pill',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Health Ins',
        'icon': 'shield',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Dental',
        'icon': 'tooth',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Vision Care',
        'icon': 'eyeglasses',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Dining Out',
        'icon': 'restaurant',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Movies',
        'icon': 'ticket',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Hobbies',
        'icon': 'paint-brush',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Vacation',
        'icon': 'airplane',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Subs (Netflix)',
        'icon': 'credit-card',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Gym',
        'icon': 'dumbbell',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Sports',
        'icon': 'baseball',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Savings',
        'icon': 'piggy-bank',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Stocks',
        'icon': 'chart-increase',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Retirement',
        'icon': 'bank',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Emergency',
        'icon': 'shield',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Edu Saving',
        'icon': 'user-graduate',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Credit Card',
        'icon': 'credit-card',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Student Loan',
        'icon': 'user-graduate',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Personal Loan',
        'icon': 'hands-holding',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Charity',
        'icon': 'heart',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Relig Donate',
        'icon': 'mosque',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Fundraising',
        'icon': 'hand-holding-heart',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Animal Help',
        'icon': 'cat',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'name': 'Enviro Org',
        'icon': 'recycle',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
    ];

    for (var category in categories) {
      await dbHelper.insert('categories', category);
    }
  }

  @override
  void onInit() {
    // insertCategories();
    getCategories();
    super.onInit();
  }
}

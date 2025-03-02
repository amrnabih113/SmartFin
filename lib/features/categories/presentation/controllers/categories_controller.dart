import 'package:get/get.dart';
import 'package:smartFin/core/utils/popups/loaders.dart';
import 'package:smartFin/data/sqflite/sqlite_service_imp.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/entities/category_section_entity.dart';
import 'package:smartFin/features/categories/domain/usecases/add_category_usecase.dart';
import 'package:smartFin/features/categories/domain/usecases/get_all_categories_usecase.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  final GetAllCategoriesUsecase getCategoriesUseCase;
  final AddCategoryUsecase createCategoryUseCase;

  CategoriesController(
    this.getCategoriesUseCase,
    this.createCategoryUseCase,
  );

  @override
  void onInit() async {
    await insertCategories();
    await getCategories();
    super.onInit();
  }

  final RxList<CategoryEntity> _categories = <CategoryEntity>[].obs;
  final RxList<CategoryEntity> incomeCategories = <CategoryEntity>[].obs;
  final RxList<CategoryEntity> expenseCategories = <CategoryEntity>[].obs;

  final RxList<CategorySectionEntity> categorySections =
      <CategorySectionEntity>[].obs;

  Future<void> getCategories() async {
    try {
      final result = await getCategoriesUseCase.execute();
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
        'id': '1',
        'name': 'Salary',
        'icon': 'briefcase',
        'color': '#2196F3',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '2',
        'name': 'Freelance',
        'icon': 'laptop',
        'color': '#FF9800',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '3',
        'name': 'Invest Rtns',
        'icon': 'chart-increase',
        'color': '#9C27B0',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '4',
        'name': 'Rent Inc',
        'icon': 'house',
        'color': '#795548',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '5',
        'name': 'Gift Money',
        'icon': 'gift',
        'color': '#F44336',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '6',
        'name': 'Part-time',
        'icon': 'briefcase',
        'color': '#2196F3',
        'type': 'income',
        'transactions_count': 0
      },
      {
        'id': '7',
        'name': 'Rent',
        'icon': 'home',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '8',
        'name': 'Mortg Pay',
        'icon': 'house',
        'color': '#607D8B',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '9',
        'name': 'Elec Bill',
        'icon': 'electric-plugs',
        'color': '#FFEB3B',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '10',
        'name': 'Water Bill',
        'icon': 'droplet',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '11',
        'name': 'Net Subs',
        'icon': 'globe',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '12',
        'name': 'Home Ins',
        'icon': 'shield',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '13',
        'name': 'Home Repairs',
        'icon': 'tools',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '14',
        'name': 'Furniture',
        'icon': 'bed',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '15',
        'name': 'Car Loan',
        'icon': 'car',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '16',
        'name': 'Fuel & Gas',
        'icon': 'fuel',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '17',
        'name': 'Pub Trans',
        'icon': 'bus',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '18',
        'name': 'Car Maint',
        'icon': 'wrench',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '19',
        'name': 'Car Ins',
        'icon': 'shield',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '20',
        'name': 'Taxi/Rides',
        'icon': 'taxi',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '21',
        'name': 'Parking',
        'icon': 'parking',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '22',
        'name': 'Groceries',
        'icon': 'shopping-bag',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '23',
        'name': 'Pers Care',
        'icon': 'brush',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '24',
        'name': 'House Supp',
        'icon': 'shopping-basket',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '25',
        'name': 'Pets',
        'icon': 'cat',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '26',
        'name': 'Childcare',
        'icon': 'baby',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '27',
        'name': 'Doctor',
        'icon': 'stethoscope',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '28',
        'name': 'Meds',
        'icon': 'pill',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '29',
        'name': 'Health Ins',
        'icon': 'shield',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '30',
        'name': 'Dental',
        'icon': 'tooth',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '31',
        'name': 'Vision Care',
        'icon': 'eyeglasses',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '32',
        'name': 'Dining Out',
        'icon': 'restaurant',
        'color': '#E91E63',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '33',
        'name': 'Movies',
        'icon': 'ticket',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '34',
        'name': 'Hobbies',
        'icon': 'paint-brush',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '35',
        'name': 'Vacation',
        'icon': 'airplane',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '36',
        'name': 'Subs (Netflix)',
        'icon': 'credit-card',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '37',
        'name': 'Gym',
        'icon': 'dumbbell',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '38',
        'name': 'Sports',
        'icon': 'baseball',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '39',
        'name': 'Savings',
        'icon': 'piggy-bank',
        'color': '#4CAF50',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '40',
        'name': 'Stocks',
        'icon': 'chart-increase',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '41',
        'name': 'Retirement',
        'icon': 'bank',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '42',
        'name': 'Emergency',
        'icon': 'shield',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '43',
        'name': 'Edu Saving',
        'icon': 'user-graduate',
        'color': '#009688',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '44',
        'name': 'Credit Card',
        'icon': 'credit-card',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '45',
        'name': 'Student Loan',
        'icon': 'user-graduate',
        'color': '#FF9800',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '46',
        'name': 'Personal Loan',
        'icon': 'hands-holding',
        'color': '#9E9E9E',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '47',
        'name': 'Charity',
        'icon': 'heart',
        'color': '#F44336',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '48',
        'name': 'Relig Donate',
        'icon': 'mosque',
        'color': '#2196F3',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '49',
        'name': 'Fundraising',
        'icon': 'hand-holding-heart',
        'color': '#9C27B0',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '50',
        'name': 'Animal Help',
        'icon': 'cat',
        'color': '#795548',
        'type': 'expense',
        'transactions_count': 0
      },
      {
        'id': '51',
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
}

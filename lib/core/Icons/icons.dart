import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyIcons {
  static IconData getIconData(String iconName) {
    const Map<String, IconData> iconMapping = {
      'briefcase': HugeIcons.strokeRoundedBriefcase01,
      'store': HugeIcons.strokeRoundedStore01,
      'laptop': HugeIcons.strokeRoundedLaptop,
      'chart-increase': HugeIcons.strokeRoundedChartIncrease,
      'house': HugeIcons.strokeRoundedHouse01,
      'coins': HugeIcons.strokeRoundedCoins01,
      'gift': HugeIcons.strokeRoundedGift,
      'bank': HugeIcons.strokeRoundedBank,
      'home': HugeIcons.strokeRoundedHome01,
      'electric-plugs': HugeIcons.strokeRoundedElectricPlugs,
      'droplet': HugeIcons.strokeRoundedDroplet,
      'globe': HugeIcons.strokeRoundedGlobe,
      'shield': HugeIcons.strokeRoundedShield01,
      'tools': HugeIcons.strokeRoundedTools,
      'car': HugeIcons.strokeRoundedCar01,
      'fuel': HugeIcons.strokeRoundedFuel01,
      'bus': HugeIcons.strokeRoundedBus01,
      'wrench': HugeIcons.strokeRoundedWrench01,
      'taxi': HugeIcons.strokeRoundedTaxi,
      'shopping-bag': HugeIcons.strokeRoundedShoppingBag01,
      'brush': HugeIcons.strokeRoundedBrush,
      'shopping-basket': HugeIcons.strokeRoundedShoppingBasket01,
      'cat': FontAwesomeIcons.cat,
      'stethoscope': HugeIcons.strokeRoundedStethoscope,
      'pill': HugeIcons.strokeRoundedGivePill,
      'tooth': HugeIcons.strokeRoundedDentalTooth,
      'restaurant': HugeIcons.strokeRoundedRestaurant01,
      'ticket': HugeIcons.strokeRoundedTicket01,
      'paint-brush': HugeIcons.strokeRoundedIceSkating,
      'airplane': HugeIcons.strokeRoundedDrink,
      'credit-card': HugeIcons.strokeRoundedCreditCard,
      'dumbbell': HugeIcons.strokeRoundedDumbbell01,
      'piggy-bank': HugeIcons.strokeRoundedPiggyBank,
      'user-graduate': FontAwesomeIcons.userGraduate,
      'hands-holding': FontAwesomeIcons.handsHoldingCircle,
      'heart': HugeIcons.strokeRoundedHeartAdd,
      'mosque': HugeIcons.strokeRoundedMosque01,
      'hand-holding-heart': FontAwesomeIcons.handHoldingHeart,
      'baby': HugeIcons.strokeRoundedBaby01,
      'parking': HugeIcons.strokeRoundedCarParking01,
      'baseball': HugeIcons.strokeRoundedBaseball,
      'recycle': HugeIcons.strokeRoundedRecycle01,
      'eyeglasses': HugeIcons.strokeRoundedGlasses,

    };
    return iconMapping[iconName] ?? Icons.help_outline;
  }
  /**INSERT INTO categories (name, icon, color, type, transactions_count) VALUES
    -- Income Categories
    ('Salary', 'briefcase', '#2196F3', 'income', 0),
    ('Business Income', 'store', '#4CAF50', 'income', 0),
    ('Freelancing', 'laptop', '#FF9800', 'income', 0),
    ('Investment Returns', 'chart-increase', '#9C27B0', 'income', 0),
    ('Rental Income', 'house', '#795548', 'income', 0),
    ('Side Hustle', 'coins', '#009688', 'income', 0),
    ('Gift Money', 'gift', '#F44336', 'income', 0),
    ('Government Benefits', 'bank', '#9E9E9E', 'income', 0),
    ('Royalties', 'paint-brush', '#E91E63', 'income', 0),
    ('Part-time Job', 'briefcase', '#2196F3', 'income', 0),

    -- Expense Categories - Housing & Utilities
    ('Rent', 'home', '#FF9800', 'expense', 0),
    ('Mortgage Payment', 'house', '#607D8B', 'expense', 0),
    ('Electricity Bill', 'electric-plugs', '#FFEB3B', 'expense', 0),
    ('Water Bill', 'droplet', '#2196F3', 'expense', 0),
    ('Internet Subscription', 'globe', '#9C27B0', 'expense', 0),
    ('Home Insurance', 'shield', '#F44336', 'expense', 0),
    ('Home Repairs & Maintenance', 'tools', '#795548', 'expense', 0),
    ('Furniture & Appliances', 'bed', '#E91E63', 'expense', 0),

    -- Expense Categories - Transportation
    ('Car Loan Payment', 'car', '#2196F3', 'expense', 0),
    ('Fuel & Gas', 'fuel', '#FF9800', 'expense', 0),
    ('Public Transport', 'bus', '#4CAF50', 'expense', 0),
    ('Vehicle Maintenance', 'wrench', '#F44336', 'expense', 0),
    ('Car Insurance', 'shield', '#9C27B0', 'expense', 0),
    ('Taxi & Ride-Sharing', 'taxi', '#009688', 'expense', 0),
    ('Parking Fees', 'parking', '#795548', 'expense', 0),

    -- Expense Categories - Essentials
    ('Groceries & Food', 'shopping-bag', '#4CAF50', 'expense', 0),
    ('Personal Care & Hygiene', 'brush', '#E91E63', 'expense', 0),
    ('Household Supplies', 'shopping-basket', '#2196F3', 'expense', 0),
    ('Pet Expenses', 'cat', '#795548', 'expense', 0),
    ('Baby & Childcare', 'baby', '#9E9E9E', 'expense', 0),

    -- Expense Categories - Healthcare
    ('Doctor Visits', 'stethoscope', '#2196F3', 'expense', 0),
    ('Medications', 'pill', '#F44336', 'expense', 0),
    ('Health Insurance', 'shield', '#4CAF50', 'expense', 0),
    ('Dental Care', 'tooth', '#9C27B0', 'expense', 0),
    ('Vision Care', 'eyeglasses', '#FF9800', 'expense', 0),

    -- Expense Categories - Entertainment & Leisure
    ('Dining Out', 'restaurant', '#E91E63', 'expense', 0),
    ('Movies & Theatre', 'ticket', '#F44336', 'expense', 0),
    ('Hobbies & Crafts', 'paint-brush', '#009688', 'expense', 0),
    ('Vacation & Travel', 'airplane', '#FF9800', 'expense', 0),
    ('Subscriptions (Netflix, Spotify, etc.)', 'credit-card', '#9C27B0', 'expense', 0),
    ('Gym Membership', 'dumbbell', '#9E9E9E', 'expense', 0),
    ('Sports & Fitness', 'baseball', '#795548', 'expense', 0),

    -- Expense Categories - Savings & Investments
    ('Savings Account', 'piggy-bank', '#4CAF50', 'expense', 0),
    ('Stock Market Investments', 'chart-increase', '#2196F3', 'expense', 0),
    ('Retirement Fund', 'bank', '#795548', 'expense', 0),
    ('Emergency Fund', 'shield', '#F44336', 'expense', 0),
    ('Education Savings', 'user-graduate', '#009688', 'expense', 0),

    -- Expense Categories - Debt & Loans
    ('Credit Card Payments', 'credit-card', '#9C27B0', 'expense', 0),
    ('Student Loans', 'user-graduate', '#FF9800', 'expense', 0),
    ('Car Loan', 'car', '#2196F3', 'expense', 0),
    ('Personal Loan', 'hands-holding', '#9E9E9E', 'expense', 0),
    ('Mortgage', 'house', '#607D8B', 'expense', 0),

    -- Expense Categories - Charity & Giving
    ('Charitable Donations', 'heart', '#F44336', 'expense', 0),
    ('Religious Donations (Zakat, Tithing, etc.)', 'mosque', '#2196F3', 'expense', 0),
    ('Fundraising Contributions', 'hand-holding-heart', '#9C27B0', 'expense', 0),
    ('Animal Welfare', 'cat', '#795548', 'expense', 0),
    ('Environmental Organizations', 'recycle', '#009688', 'expense', 0);

    CategorySectionEntity(
      title: "Income",
      categories: [
        CategoryEntity(
            title: "Salary",
            icon: HugeIcons.strokeRoundedBriefcase01,
            color: Colors.blue),
        CategoryEntity(
            title: "Business",
            icon: HugeIcons.strokeRoundedStore01,
            color: Colors.green),
        CategoryEntity(
            title: "Freelance",
            icon: HugeIcons.strokeRoundedLaptop,
            color: Colors.orange),
        CategoryEntity(
            title: "Investments",
            icon: HugeIcons.strokeRoundedChartIncrease,
            color: Colors.purple),
        CategoryEntity(
            title: "Rental Income",
            icon: HugeIcons.strokeRoundedHouse01,
            color: Colors.brown),
        CategoryEntity(
            title: "Side Hustle",
            icon: HugeIcons.strokeRoundedCoins01,
            color: Colors.teal),
        CategoryEntity(
            title: "Gifts",
            icon: HugeIcons.strokeRoundedGift,
            color: Colors.red),
        CategoryEntity(
            title: "Government Benefits",
            icon: HugeIcons.strokeRoundedBank,
            color: Colors.grey),
      ],
    ),

    // ** EXPENSE CATEGORIES **
    CategorySectionEntity(
      title: "Housing & Utilities",
      categories: [
        CategoryEntity(
            title: "Rent",
            icon: HugeIcons.strokeRoundedHome01,
            color: Colors.orange),
        CategoryEntity(
            title: "Mortgage",
            icon: HugeIcons.strokeRoundedHouse01,
            color: Colors.blueGrey),
        CategoryEntity(
            title: "Electricity",
            icon: HugeIcons.strokeRoundedElectricPlugs,
            color: Colors.yellow),
        CategoryEntity(
            title: "Water Bill",
            icon: HugeIcons.strokeRoundedDroplet,
            color: Colors.blue),
        CategoryEntity(
            title: "Internet",
            icon: HugeIcons.strokeRoundedGlobe,
            color: Colors.purple),
        CategoryEntity(
            title: "Insurance",
            icon: HugeIcons.strokeRoundedShield01,
            color: Colors.red),
        CategoryEntity(
            title: "Home Repairs",
            icon: HugeIcons.strokeRoundedTools,
            color: Colors.brown),
      ],
    ),

    CategorySectionEntity(
      title: "Transportation",
      categories: [
        CategoryEntity(
            title: "Car Payment",
            icon: HugeIcons.strokeRoundedCar01,
            color: Colors.blue),
        CategoryEntity(
            title: "Gas & Fuel",
            icon: HugeIcons.strokeRoundedFuel01,
            color: Colors.orange),
        CategoryEntity(
            title: "Public Transport",
            icon: HugeIcons.strokeRoundedBus01,
            color: Colors.green),
        CategoryEntity(
            title: "Car Maintenance",
            icon: HugeIcons.strokeRoundedWrench01,
            color: Colors.red),
        CategoryEntity(
            title: "Car Insurance",
            icon: HugeIcons.strokeRoundedShield02,
            color: Colors.purple),
        CategoryEntity(
            title: "Taxis & Ride-share",
            icon: HugeIcons.strokeRoundedTaxi,
            color: Colors.teal),
      ],
    ),

    CategorySectionEntity(
      title: "Daily Essentials",
      categories: [
        CategoryEntity(
            title: "Groceries",
            icon: HugeIcons.strokeRoundedShoppingBag01,
            color: Colors.green),
        CategoryEntity(
            title: "Personal Care",
            icon: HugeIcons.strokeRoundedBrush,
            color: Colors.pink),
        CategoryEntity(
            title: "Household Items",
            icon: HugeIcons.strokeRoundedShoppingBasket01,
            color: Colors.blue),
        CategoryEntity(
            title: "Pet Care", icon: FontAwesomeIcons.cat, color: Colors.brown),
      ],
    ),

    CategorySectionEntity(
      title: "Healthcare & Insurance",
      categories: [
        CategoryEntity(
            title: "Doctor Visits",
            icon: HugeIcons.strokeRoundedStethoscope,
            color: Colors.blue),
        CategoryEntity(
            title: "Medication",
            icon: HugeIcons.strokeRoundedGivePill,
            color: Colors.red),
        CategoryEntity(
            title: "Health Insurance",
            icon: HugeIcons.strokeRoundedShield01,
            color: Colors.green),
        CategoryEntity(
            title: "Dental Care",
            icon: HugeIcons.strokeRoundedDentalTooth,
            color: Colors.purple),
      ],
    ),

    CategorySectionEntity(
      title: "Entertainment & Leisure",
      categories: [
        CategoryEntity(
            title: "Restaurants",
            icon: HugeIcons.strokeRoundedRestaurant01,
            color: Colors.pink),
        CategoryEntity(
            title: "Cinema",
            icon: HugeIcons.strokeRoundedTicket01,
            color: Colors.red),
        CategoryEntity(
            title: "Hobbies",
            icon: HugeIcons.strokeRoundedIceSkating,
            color: Colors.teal),
        CategoryEntity(
            title: "Gifts",
            icon: HugeIcons.strokeRoundedGift,
            color: Colors.blue),
        CategoryEntity(
            title: "Vacations",
            icon: HugeIcons.strokeRoundedDrink,
            color: Colors.orange),
        CategoryEntity(
            title: "Subscriptions",
            icon: HugeIcons.strokeRoundedCreditCard,
            color: Colors.purple),
        CategoryEntity(
            title: "Gym",
            icon: HugeIcons.strokeRoundedDumbbell01,
            color: Colors.grey),
      ],
    ),

    CategorySectionEntity(
      title: "Savings & Investments",
      categories: [
        CategoryEntity(
            title: "Savings",
            icon: HugeIcons.strokeRoundedPiggyBank,
            color: Colors.green),
        CategoryEntity(
            title: "Stocks",
            icon: HugeIcons.strokeRoundedChartIncrease,
            color: Colors.blue),
        CategoryEntity(
            title: "Retirement",
            icon: HugeIcons.strokeRoundedBank,
            color: Colors.brown),
        CategoryEntity(
            title: "Emergency Fund",
            icon: HugeIcons.strokeRoundedShield02,
            color: Colors.red),
      ],
    ),

    CategorySectionEntity(
      title: "Debt & Loans",
      categories: [
        CategoryEntity(
            title: "Credit Card",
            icon: HugeIcons.strokeRoundedCreditCard,
            color: Colors.purple),
        CategoryEntity(
            title: "Student Loans",
            icon: FontAwesomeIcons.userGraduate,
            color: Colors.orange),
        CategoryEntity(
            title: "Car Loan",
            icon: HugeIcons.strokeRoundedCar02,
            color: Colors.blue),
        CategoryEntity(
            title: "Personal Loan",
            icon: FontAwesomeIcons.handsHoldingCircle,
            color: Colors.grey),
      ],
    ),

    CategorySectionEntity(
      title: "Charity & Donations",
      categories: [
        CategoryEntity(
            title: "Donations",
            icon: HugeIcons.strokeRoundedHeartAdd,
            color: Colors.red),
        CategoryEntity(
            title: "Religious Giving",
            icon: HugeIcons.strokeRoundedMosque01,
            color: Colors.blue),
        CategoryEntity(
            title: "Fundraising",
            icon: FontAwesomeIcons.handHoldingHeart,
            color: Colors.purple),
      ],
    ),
  ];
}
 */
}

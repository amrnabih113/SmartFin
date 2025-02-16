import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:smartFin/features/categories/domain/entities/category_entity.dart';
import 'package:smartFin/features/categories/domain/entities/category_section_entity.dart';

class CategoryRepository {
  static final List<CategorySectionEntity> sections = [
    // ** INCOME CATEGORIES **
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

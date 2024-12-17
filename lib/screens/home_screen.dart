import 'package:flutter/material.dart';
import 'package:patchtest/widgets/category_widget.dart';
import 'package:patchtest/models/product.dart';
import 'package:patchtest/services/api_service.dart';
import 'package:patchtest/widgets/bottom_nav_bar.dart';
import 'package:patchtest/widgets/custom_app_bar.dart';
import 'package:patchtest/widgets/product_grid.dart';
import 'package:patchtest/widgets/sort_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> allProducts = [];
  List<Product> displayedProducts = [];
  List<String> categories = [];
  String selectedCategory = '';
  String sortOrder = '';
  int currentIndex = 0;

  Map<String, String> categoryImages = {
    'Electronics': 'assets/electronics.jpg',
    'Jewellery': 'assets/jewlry.jpg',
    "Men's Wear": 'assets/mens.jpg',
    "Women's Wear": 'assets/women.jpg',
  };

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    final products = await ApiService().fetchProducts();
    final productCategories = products.map((p) => mapCategory(p.category)).toSet().toList();
    productCategories.sort();

    setState(() {
      allProducts = products;
      displayedProducts = products;
      categories = productCategories;
    });
  }

  String mapCategory(String category) {
    switch (category) {
      case 'electronics':
        return 'Electronics';
      case 'jewelery':
        return 'Jewellery';
      case "men's clothing":
        return "Men's Wear";
      case "women's clothing":
        return "Women's Wear";
      default:
        return category;
    }
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      displayedProducts = category.isEmpty ? allProducts : allProducts.where((p) => mapCategory(p.category) == category).toList();
    });
  }

  void sortByLowestPrice() {
    setState(() {
      sortOrder = 'low';
      displayedProducts.sort((a, b) => a.price.compareTo(b.price));
    });
  }

  void sortByHighestPrice() {
    setState(() {
      sortOrder = 'high';
      displayedProducts.sort((a, b) => b.price.compareTo(a.price));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.grey[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Aligns texts to the left
        children: [
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text("Choose from any category",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          CategoryWidget(
            categories: categories,
            categoryImages: categoryImages,
            selectedCategory: selectedCategory,
            onCategorySelected: filterByCategory,
          ),
          SortButtons(
            sortOrder: sortOrder,
            onSortLow: sortByLowestPrice,
            onSortHigh: sortByHighestPrice,
          ),
          const SizedBox(height: 10), // Adds spacing
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4.0),
            child: Text("${displayedProducts.length} products to choose from",
              style: const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ProductGrid(products: displayedProducts),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final List<String> categories;
  final Map<String, String> categoryImages;
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryWidget({
    super.key,
    required this.categories,
    required this.categoryImages,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? Colors.green : Colors.grey,
                      width: 3,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      categoryImages[category] ?? 'assets/mens.jpg',
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.green : Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

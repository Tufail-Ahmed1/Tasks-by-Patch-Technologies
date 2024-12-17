import 'package:flutter/material.dart';

class SortButtons extends StatelessWidget {
  final String sortOrder;
  final VoidCallback onSortLow;
  final VoidCallback onSortHigh;

  const SortButtons({
    super.key,
    required this.sortOrder,
    required this.onSortLow,
    required this.onSortHigh,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: sortOrder == 'low' ? const Color(0xff7A6EAE) : const Color(0xffCACACA),
            ),
            onPressed: onSortLow,
            child: const Text("Lowest price first", style: TextStyle(color: Colors.black)),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              backgroundColor: sortOrder == 'high' ? const Color(0xff7A6EAE) : const Color(0xffCACACA),
            ),
            onPressed: onSortHigh,
            child: const Text("Highest price first", style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

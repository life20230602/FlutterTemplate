import 'package:flutter/material.dart';

///搜索
class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xFFE4E4E4),
          borderRadius: BorderRadius.circular(12)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_rounded,
            size: 18,
            color: Color(0xFF78787c),
          ),
          Text(
            "搜索",
            style: TextStyle(fontSize: 16, color: Color(0xFF78787c)),
          )
        ],
      ),
    );
  }
}

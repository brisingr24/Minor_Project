import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.index,required this.item,required this.img}) : super(key: key);
  final int index;
  final String item;
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFadeff7),
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Center(
            child: Text(
              item,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(width: 20,),
          Image.asset(img,height: 40,width: 40,)
        ],
      ),
    );
  }
}
import 'package:MCoins/presentation/foundation/platform_scaffold.dart';
import 'package:MCoins/presentation/home/home_category_item.dart';
import 'package:MCoins/presentation/home/models/home_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _categories = [
    HomeCategory("Comida", Colors.red),
    HomeCategory("Entretenimiento", Colors.yellow),
    HomeCategory("Alquiler", Colors.orange),
    HomeCategory("Servicios", Colors.indigo),
    HomeCategory("Otros", Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      title: const Text("MCoins"),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7),
        itemBuilder: (_, int index) {
          return HomeCategoryItem(
              _categories[index].name, _categories[index].color);
        },
        itemCount: _categories.length,
      ),
    );
  }
}

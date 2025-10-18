import 'package:flutter/material.dart';

import '../widgets/categories.dart';
import '../widgets/header_section.dart';
import '../widgets/pet_list_section.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const HeaderSection(),
          const SearchBarWidget(),
          const CategorySection(),
          Expanded(child: PetListSection()),
        ],
      ),
    );
  }
}

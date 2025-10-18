import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../cubit/cat_cubit.dart';
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
          Expanded(
            child: BlocProvider(
              create: (context) => getIt<CatCubit>()..getBreads(),
              child: PetListSection(),
            ),
          ),
        ],
      ),
    );
  }
}

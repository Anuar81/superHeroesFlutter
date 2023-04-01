import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di/custom_providers.dart';
import 'components/item_list/super_hero_list_item.dart';
import 'home_viewmodel.dart';

class HomeScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final superHeroList = ref.watch(superHeroListProvider);
    final viewModel = ref.watch(homeViewModelProvider);
    viewModel.loadSuperHeroes();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ListView.builder(itemCount: superHeroList?.length,
          itemBuilder: (context, index) {
            final superHero = superHeroList![index];
            return SuperHeroListItem(
              thumbnail: superHero.thumbnail?.path ?? '',
              extension: superHero.thumbnail?.extension ?? '',
              name: superHero.name ?? '',
              onTap: () {},
            );
          },)
      ),
    );
  }
}
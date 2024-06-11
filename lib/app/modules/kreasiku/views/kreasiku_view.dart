import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yummy/app/modules/resep/controllers/resep_controller.dart';
import 'package:yummy/app/modules/tips/controllers/tips_controller.dart';
import 'package:yummy/app/modules/tips/views/tips_view.dart';

import '../../resep/views/resep_view.dart';
import '../controllers/kreasiku_controller.dart';

class KreasikuView extends StatefulWidget {
  const KreasikuView({super.key});

  @override
  State<KreasikuView> createState() => _KreasikuViewState();
}

class _KreasikuViewState extends State<KreasikuView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final KreasikuController _activityController = Get.put(KreasikuController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _activityController.changeTabIndex(_tabController.index);
      } else if (_tabController.index != _tabController.previousIndex) {
        _activityController.changeTabIndex(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ResepController());
    Get.put(TipsController());


    return GetBuilder<KreasikuController>(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Kreasiku'),
            centerTitle: true,
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Resep'),
                Tab(text: 'Tips & Trick'),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const [
              ResepView(),
              TipsView(),
            ],
          ),
        );
      }
    );
  }
}

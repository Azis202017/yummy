import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tips_controller.dart';

class TipsView extends GetView<TipsController> {
  const TipsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TipsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TipsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

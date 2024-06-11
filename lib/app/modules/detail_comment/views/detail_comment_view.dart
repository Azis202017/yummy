// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yummy/app/modules/widgets/custom_text_field.dart';

import '../controllers/detail_comment_controller.dart';

class DetailCommentView extends GetView<DetailCommentController> {
  const DetailCommentView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailCommentController>(builder: (context) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: AppBar(
                title: Text(controller.title),
                centerTitle: true,
              ),
              body: ListView.builder(
                itemCount: 0,
                itemBuilder: (_, index) {
                  var data = controller.commentar[index];
                  return const Card(
                    child: Row(
                      children: [
                        // ClipRRect(
                        //   borderRadius: BorderRadius.circular(
                        //     32,
                        //   ),
                        //   child: Image.network(data.user?.fotoUrl ?? "",
                        //       width: 32,
                        //       height: 32, errorBuilder: (_, __, ___) {
                        //     return ClipRRect(
                        //       borderRadius: BorderRadius.circular(
                        //         18,
                        //       ),
                        //       child: Image.asset(
                        //         'assets/images/logo.jpg',
                        //         width: 32,
                        //         height: 32,
                        //       ),
                        //     );
                        //   }),
                        // ),
                      ],
                    ),
                  );
                },
              ),
              floatingActionButton: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: controller.comment,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      hint: "Masukkan komentar mu disini",
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: controller.sendData,
                    child: const Icon(Icons.send),
                  )
                ],
              ),
            );
    });
 
  }
}

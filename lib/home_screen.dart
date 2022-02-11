import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search/controller.dart';

class HomeScreen extends GetView {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade300,
          title: Container(
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: TextField(
              controller: controller.textEditingController,
              focusNode: controller.textFocusNode,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                  contentPadding: EdgeInsets.all(8)),
              onChanged: (value) {
                log(value);
                //setState();
                controller.udateList(value);
              },
            ),
          )),
      body: Obx(
        () => controller.textEditingController!.text.isNotEmpty &&
                controller.foodListSearch!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search_off,
                          size: 160,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'No results found,\nPlease try different keyword',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: controller.textEditingController!.text.isNotEmpty
                    ? controller.foodListSearch!.length
                    : controller.foodList.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.food_bank),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                            //controller.textEditingController!.text.isNotEmpty
                            controller.foodListSearch![index]
                            //: controller.foodList[index]
                            ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}

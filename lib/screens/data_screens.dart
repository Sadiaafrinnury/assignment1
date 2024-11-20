import 'package:assignment1/Controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataScreens extends StatelessWidget {
  final DataController controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data from API"),
        centerTitle: true,
      ),
      body: Obx((){
        if(controller.isLoading.value){
          return const Center(
            child:  CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final item = controller.items[index];
              return Card(
                child: ListTile(
                  title: Text(
                      item.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(item.body),
                ),
              );
            },
        );
      }),
    );
  }
}

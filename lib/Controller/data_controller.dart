import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment1/models/item_model.dart';
import 'package:get/get.dart';
import '../models/item_model.dart';

class DataController extends GetxController{
  var items = <Item>[].obs;
  var isLoading = true.obs;

  @override
  void onInit(){
    fetchItems();
    super.onInit();
  }

  Future<void>fetchItems()async{
    isLoading.value = true;
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    try{
      final response = await http.get(url);
      if(response.statusCode == 200){
        final List<dynamic>data = json.decode(response.body);
        items.value = data.map((json) => Item.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch data');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isLoading.value = false;
    }
  }
}
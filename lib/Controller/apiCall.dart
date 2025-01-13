import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/ProductsModel.dart';

class ApiCall{

  Future<ProductsModel> getProductsApi()async{
  
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return ProductsModel.fromJson(data);
      }else{
        return ProductsModel.fromJson(data);
      }

  }

}
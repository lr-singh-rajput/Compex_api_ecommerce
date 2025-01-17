import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/ProductsModel.dart';

class ApiCall{
  final getUri = 'https://dummyjson.com';
  final baseurlmydummy="http://localhost:3000";

  // all oprations post,update delete


  Future<ProductsModel> getProductsApi()async{
  
      final response = await http.get(Uri.parse('$getUri/products'));
      var data = jsonDecode(response.body.toString());
      if(response.statusCode == 200){
        return ProductsModel.fromJson(data);
      }else{
        return ProductsModel.fromJson(data);
      }

  }


  Future<void> postApi(String title, String content) async {
    // URL for the API
    final url = Uri.parse("http://localhost:3000/posts");

    // Create the data as a Map
    // final Map<String, String> data = {
    //   'title': title,
    //   'content': content,
    // };
    final data = {
      'title': title,
      'content': content,
    };

    // Send the POST request with JSON-encoded body
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',  // Set header to inform server that we're sending JSON
      },
      body: json.encode(data),  // JSON encode the data
    );

    // Check the response
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Post created successfully: ${response.body}');
    } else {
      print('Failed to create post. Status code: ${response.statusCode}');
      print('Response: ${response.body}');
    }
  }


  // update data

  Future<void> updatePost(String id, String title, String content) async {
    // API endpoint URL with specific ID for updating
    final url = Uri.parse("http://localhost:3000/posts/eb78");

    // Create the updated data
    final Map<String, String> updatedData = {
      'title': "upadate data",
      'content': "update description",
    };

    // Send PUT request to update the post
    final response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedData), // JSON-encoded updated data
    );

    if (response.statusCode == 200) {
      // If the server returns a 200 status, the update was successful
      print('Post updated: ${response.body}');
    } else {
      // If the server returns an error
      print('Failed to update post. Status code: ${response.statusCode}');
    }
  }


  Future<void> deletePost(String id) async {
    // API endpoint URL with specific ID for deleting
    final url = Uri.parse("http://localhost:3000/posts/c5e3");

    // Send DELETE request to delete the post
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // If the server returns a 200 status, the delete was successful
      print('Post deleted: ${response.body}');
    } else {
      // If the server returns an error
      print('Failed to delete post. Status code: ${response.statusCode}');
    }
  }


  // Future<void> postApi(String title,String content,)async{
  //   final response = await http.post(
  //       Uri.parse("http://localhost:3000/posts"),
  //       body: {
  //         'title': 'new title',
  //         'content': 'new description'
  //       }
  //   );
  //
  //   if(response.statusCode == 200 || response.statusCode == 201){
  //     var data = jsonEncode(response.body.toString());
  //     // If the server returns a 201 status, the post was successful
  //     print('Post created: ${response.body}');
  //   } else {
  //     // If the server returns an error
  //     print('Failed to create post. Status code: ${response.statusCode}');
  //   }
  // }

}

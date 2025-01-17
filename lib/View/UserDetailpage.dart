import 'package:e_commere_api/Controller/apiCall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiCall apiCall = ApiCall();

    return Scaffold(
      appBar: AppBar(
        title: Text("userDetails"),
        centerTitle: true,
          backgroundColor: Colors.grey,

      ),
      body: Center(
        child: Column(
          children: [
            Icon(Icons.account_circle),
            SizedBox(height: 59,),



           TextButton(onPressed: (){
             apiCall.postApi("new data add", "check new data add");
           }, child: Text('submit'),
           ),
            TextButton(onPressed: (){
             apiCall.updatePost("new data add", "check new data add","12");
           }, child: Text('update'),
           ),
            TextButton(onPressed: (){
             apiCall.deletePost("48d2");
           }, child: Text('delete'),
           ),

          ],
        ),
      ),
    );
  }
}

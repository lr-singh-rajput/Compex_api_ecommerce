import 'package:e_commere_api/Controller/apiCall.dart';
import 'package:e_commere_api/Model/ProductsModel.dart';
import 'package:e_commere_api/View/Detailpage.dart';
import 'package:e_commere_api/View/UserDetailpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ApiCall apiCall = ApiCall();
    return Scaffold(
      appBar: AppBar(title: Text('vary Complex Api,'),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle), // User icon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetailPage(),
              ),
            );

            // Handle user icon press (for example, navigate to profile screen)
            //print("User icon tapped");
          },
        ),
      ],
      backgroundColor: Colors.grey,
      ),

      body: SafeArea(

        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Items1',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 380,
                child: FutureBuilder<ProductsModel>(
                    future:apiCall.getProductsApi() ,
                    builder: (context , snapshot){
                      if (!snapshot.hasData){
                        return Center(

                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }else{
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.products!.length,
                            itemBuilder: (context,index){
                              var datas = snapshot.data!.products![index];

                                return InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>
                                            Detailpage(product: datas)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 170,
                                      color: Colors.grey.shade300,
                                      //height: MediaQuery.of(context).size.height * 0.99,
                                      child: Column(
                                        children: [
                                          Text(index.toString()),
                                          Container(
                                              height: MediaQuery.of(context).size.height * 0.25,
                                             width:  MediaQuery.of(context).size.height * 0.25,
                                              child:    Image.network(snapshot.data!.products![index].images![0].toString(),fit: BoxFit.cover,)

                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            datas.title.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(height: 5,),
                                                  Text('price'),
                                                  Text(datas.price.toString()),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text('rating'),
                                                  Text(datas.rating.toString()),
                                                ],
                                              ),


                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("stock"),
                                              SizedBox(width: 18,),
                                              Text(datas.stock.toString()),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Text("height / width"),
                                              Text(datas.dimensions!.height.toString()+ datas.dimensions!.width.toString())
                                            ],
                                          )


                                        ],
                                      ),
                                    ),
                                  ),
                                );


                            });
                      }

                    }),
              ),
          SizedBox(height: 30,),
              Text(
                'Items2',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 380,
                child: FutureBuilder<ProductsModel>(
                    future:apiCall.getProductsApi() ,
                    builder: (context , snapshot){
                      if (!snapshot.hasData){
                        return Center(

                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }else{
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.products!.length,
                            itemBuilder: (context,index){
                              var datas = snapshot.data!.products![index];

                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          Detailpage(product: datas)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 170,
                                    color: Colors.grey.shade300,
                                    //height: MediaQuery.of(context).size.height * 0.99,
                                    child: Column(
                                      children: [
                                        Text(index.toString()),
                                        Container(
                                            height: MediaQuery.of(context).size.height * 0.25,
                                            width:  MediaQuery.of(context).size.height * 0.25,
                                            child:    Image.network(snapshot.data!.products![index].images![0].toString(),fit: BoxFit.cover,)

                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          datas.title.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(height: 5,),
                                                Text('price'),
                                                Text(datas.price.toString()),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('rating'),
                                                Text(datas.rating.toString()),
                                              ],
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("stock"),
                                            SizedBox(width: 18,),
                                            Text(datas.stock.toString()),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Text("height / width"),
                                            Text(datas.dimensions!.height.toString()+ datas.dimensions!.width.toString())
                                          ],
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              );


                            });
                      }

                    }),
              ),

              SizedBox(height: 30,),
              Text(
                'Items3',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                height: 380,
                child: FutureBuilder<ProductsModel>(
                    future:apiCall.getProductsApi() ,
                    builder: (context , snapshot){
                      if (!snapshot.hasData){
                        return Center(

                          child: CircularProgressIndicator(),
                        );
                      }else if(snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }else{
                        return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.products!.length,
                            itemBuilder: (context,index){
                              var datas = snapshot.data!.products![index];

                              return InkWell(
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          Detailpage(product: datas)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 170,
                                    color: Colors.grey.shade300,
                                    //height: MediaQuery.of(context).size.height * 0.99,
                                    child: Column(
                                      children: [
                                        Text(index.toString()),
                                        Container(
                                            height: MediaQuery.of(context).size.height * 0.25,
                                            width:  MediaQuery.of(context).size.height * 0.25,
                                            child:    Image.network(snapshot.data!.products![index].images![0].toString(),fit: BoxFit.cover,)

                                        ),
                                        SizedBox(height: 5,),
                                        Text(
                                          datas.title.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                SizedBox(height: 5,),
                                                Text('price'),
                                                Text(datas.price.toString()),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text('rating'),
                                                Text(datas.rating.toString()),
                                              ],
                                            ),


                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("stock"),
                                            SizedBox(width: 18,),
                                            Text(datas.stock.toString()),
                                          ],
                                        ),

                                        Row(
                                          children: [
                                            Text("height / width"),
                                            Text(datas.dimensions!.height.toString()+ datas.dimensions!.width.toString())
                                          ],
                                        )


                                      ],
                                    ),
                                  ),
                                ),
                              );


                            });
                      }

                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

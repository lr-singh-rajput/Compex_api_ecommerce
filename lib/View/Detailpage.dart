import 'package:e_commere_api/Model/ProductsModel.dart';
import 'package:e_commere_api/View/Razopay.dart';
import 'package:e_commere_api/View/livelocation.dart';
import 'package:e_commere_api/View/location.dart';
import 'package:flutter/material.dart';

class Detailpage extends StatelessWidget {
  final Products product;

  // Product passed from the previous screen
  const Detailpage({super.key, required this.product,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.width*0.30,
              width: MediaQuery.of(context).size.width*0.33,
              child: Image.network(product.images![0].toString(),fit: BoxFit.cover,),
            ),
            SizedBox(height: 20,),
            columreuse(value: product.title.toString(), name: 'Title'),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                columreuse(value: product.price.toString(), name: 'Price'),
                columreuse(value: product.rating.toString(), name: 'Rating'),
                columreuse(value: product.stock.toString(), name: 'Stock'),
              ],
            ),
            SizedBox(height: 10,),
            //columreuse( value: product.discountPercentage.toString(), name: 'Piscount',),
            SizedBox(height: 10,),
            //columreuse( value: product.description.toString(), name: 'description',),
            SizedBox(height: 10,),

            // Handle null check for dimensions
            if (product.dimensions != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  columreuse(value: product.dimensions!.height.toString(), name: 'Height'),
                  columreuse(value: product.dimensions!.width.toString(), name: 'Width'),
                  columreuse(value: product.dimensions!.depth.toString(), name: 'Depth'),
                ],
              ),
            ],

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //
            //     columreuse( value: product.dimensions!.height.toString(), name: 'height',),
            //     columreuse( value: product.dimensions!.width.toString(), name: 'width',),
            //     columreuse( value: product.dimensions!.depth.toString(), name: 'depth',),
            //   ],
            // ),
              SizedBox(height: 30,),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Passing the amount to RazorpayPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Razopay(amount: product.price!.toDouble()),
                    ),
                  );
                },
                child: Text("Proceed to Payment"),
              ),
            ),   Center(
              child: ElevatedButton(
                onPressed: () {
                  // Passing the amount to RazorpayPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationScreen(),
                    ),
                  );
                },
                child: Text("live location"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Passing the amount to RazorpayPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Location(),
                    ),
                  );
                },
                child: Text("location check"),
              ),
            ),

            SizedBox(height: 30,),

            Text(
              'Reviews',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Container(
               height: 250,
               child:  ListView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   itemCount: product.reviews!.length,
                   itemBuilder: (context,indes){
                     return Padding(
                       padding: const EdgeInsets.all(11.0),
                       child: Card(
                         //   height: MediaQuery.of(context).size.width*.27,
                         // width: MediaQuery.of(context).size.width*0.77,
                         child: Column(


                             children: [
                               SizedBox(height: 10,),
                               Column(

                                 children: [
                                   Rowreuse(name: 'name',value: product.reviews![indes].reviewerName.toString(),),
                                   Rowreuse(name: 'rating',value: product.reviews![indes].rating.toString(),),
                                 ],
                               ),
                               SizedBox(height: 10,),

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Rowreuse(name: 'date',value: product.reviews![indes].date.toString(),),
                                   Rowreuse(name: 'email',value: product.reviews![indes].reviewerEmail.toString(),),
                                 ],
                               ),
                               SizedBox(height: 20,),


                               Rowreuse(name: 'comment',value: product.reviews![indes].comment.toString(),),

                             ]

                         ),
                       ),
                     );
                   }),
             ),
             SizedBox(height: 30,),
            Text(
              'Reviews',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
             Container(
               height: 200,
               child:  ListView.builder(
                   shrinkWrap: true,
                   scrollDirection: Axis.horizontal,
                   itemCount: product.reviews!.length,
                   itemBuilder: (context,indes){
                     return Padding(
                       padding: const EdgeInsets.all(11.0),
                       child: Card(
                         //   height: MediaQuery.of(context).size.width*.27,
                         // width: MediaQuery.of(context).size.width*0.77,
                         child: Column(


                             children: [
                               SizedBox(height: 10,),
                               Column(

                                 children: [
                                   Rowreuse(name: 'name',value: product.reviews![indes].reviewerName.toString(),),
                                   Rowreuse(name: 'rating',value: product.reviews![indes].rating.toString(),),
                                 ],
                               ),
                               SizedBox(height: 10,),

                               Column(
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   Rowreuse(name: 'date',value: product.reviews![indes].date.toString(),),
                                   Rowreuse(name: 'email',value: product.reviews![indes].reviewerEmail.toString(),),
                                 ],
                               ),
                               SizedBox(height: 20,),


                               Rowreuse(name: 'comment',value: product.reviews![indes].comment.toString(),),

                             ]

                         ),
                       ),
                     );
                   }),
             ),
            SizedBox(height: 30,),
            Text(
              'Reviews',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),


            Container(
              height: 300,
              child:  ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: product.reviews!.length,
                  itemBuilder: (context,indes){
                    return Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Card(
                        //   height: MediaQuery.of(context).size.width*.27,
                        // width: MediaQuery.of(context).size.width*0.77,
                        child: Column(


                            children: [
                              SizedBox(height: 10,),
                              Column(

                                children: [
                                  Rowreuse(name: 'name',value: product.reviews![indes].reviewerName.toString(),),
                                  Rowreuse(name: 'rating',value: product.reviews![indes].rating.toString(),),
                                ],
                              ),
                              SizedBox(height: 10,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Rowreuse(name: 'date',value: product.reviews![indes].date.toString(),),
                                  Rowreuse(name: 'email',value: product.reviews![indes].reviewerEmail.toString(),),
                                ],
                              ),
                              SizedBox(height: 20,),


                              Rowreuse(name: 'comment',value: product.reviews![indes].comment.toString(),),

                            ]

                        ),
                      ),
                    );
                  }),
            ),




          ],

        ),
      ),
    );
  }
}

class columreuse extends StatelessWidget {
  String name;
  String value;
   columreuse({super.key,required this.name,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(name),
        SizedBox(height: 5,),
        Wrap(

            children: [ Container(
              width: MediaQuery.of(context).size.width*0.25,
            child: Text(value,textAlign: TextAlign.center,)
        )
    ]
        ),
      ],
    );
  }
}


class Rowreuse extends StatelessWidget {
  String name;
  String value;
  Rowreuse({super.key,required this.name,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name),
        SizedBox(height: 5,),
        Wrap(

            children: [ Container(
              width: MediaQuery.of(context).size.width*0.35,
            child: Text(value,textAlign: TextAlign.center,)
        )
    ]
        ),
      ],
    );
  }
}


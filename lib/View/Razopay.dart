import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Razopay extends StatefulWidget {
  final double amount;  // The amount received from AmountDetail

  Razopay({super.key,required this.amount});

  @override
  State<Razopay> createState() => _RazopayState();
}

class _RazopayState extends State<Razopay> {
 var _razorpay = Razorpay();

 @override
 void initState() {
   super.initState();
   // Set up listeners for events
   _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
   _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
 }

 @override
 void dispose() {
   super.dispose();
   _razorpay.clear();
 }

 void openCheckout() {
   var options = {
     'key': 'rzp_test_GcZZFDPP0jHtC4', // Replace with your Razorpay key
     'amount':(widget.amount * 100).toDouble(), // Convert to the smallest unit, // Amount in smallest unit (e.g., paise, cents)
     'name': 'shoping Payment',
     'description': 'Test Payment Description',

     'prefill': {
       'contact': '1234567890',
       'email': 'test@example.com',
     },
     'external': {
       'wallets': ['paytm', 'phonepe'],
     }
   };
   try {
     _razorpay.open(options);
     print("open razorpay");
   } catch (e) {
     print("Error: $e");
   }
 }
 void _handlePaymentSuccess(PaymentSuccessResponse response) {
   // Handle the successful payment response here
   print("Payment successful: ${response.paymentId}");
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text("Payment Successful")),
   );
 }

 void _handlePaymentError(PaymentFailureResponse response) {
   // Handle payment failure response here
   print('payment');
   print("Payment failed: ${response.message}");
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(content: Text("Payment Failed: ${response.message}")),
   );
 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Razorpay Payment'),
        centerTitle: true,

        backgroundColor: Colors.grey,),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("amount",style: TextStyle(
              fontSize: 21,fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 10,),
            Text(widget.amount.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,fontSize: 19,
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: openCheckout,
              child: Text('Pay Now'),
            ),
          ],
        )
      ),
    );
  }
}

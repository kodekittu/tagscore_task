import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class FailedPage extends StatefulWidget {
  final PaymentFailureResponse response;
  FailedPage({
    @required this.response,
  });

  @override
  _FailedPageState createState() => _FailedPageState();
}

class _FailedPageState extends State<FailedPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Failed"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Your payment is Failed and the response is\n Code: ${widget.response.code}\nMessage: ${widget.response.message}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}

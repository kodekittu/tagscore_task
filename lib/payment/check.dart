import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../validates.dart';
import 'paymentFailed.dart';
import 'paymentSuccess.dart';

class CheckRazor extends StatefulWidget {
  int amount;
  String speciality;
  String email;
  int phnNo;
  CheckRazor({this.amount, this.speciality, this.email, this.phnNo});
  @override
  _CheckRazorState createState() => _CheckRazorState();
}

class _CheckRazorState extends State<CheckRazor> {

  String jwtToken;
  getJwtTokenValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jwtTokenValue = prefs.getString('jwtTokenValue') ?? '' ;
    jwtToken = jwtTokenValue;
    return jwtTokenValue;
  }


  Razorpay _razorpay = Razorpay();
  var options;
  Future payData() async {
    try {
      _razorpay.open(options);
    } catch (e) {
      print("errror occured here is ......................./:$e");
    }

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print("payment has succedded");
     //paymentSucess(response);
     await Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => SuccessPage(response: response,))
      );

    _razorpay.clear();
    // Do something when payment succeeds
  }

  Future<void> _handlePaymentError(PaymentFailureResponse response)  {
    print("payment has error00000000000000000000000000000000000000");
    // Do something when payment fails
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => FailedPage(response: response,),)
    );
  //   paymentFailed(response);
    _razorpay.clear();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("payment has externalWallet33333333333333333333333333");

    _razorpay.clear();
    // Do something when an external wallet is selected
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    options = {
      'key': "rzp_test_JTQszYhQ0RjoLv", // Enter the Key ID generated from the Dashboard

      'amount': (widget.amount)*100, //in the smallest currency sub-unit.
      'name': 'organization',

      'currency': "INR",
      //'theme.color': "#F37254",
      'buttontext': "Pay with Razorpay",
      'description': 'RazorPay example',
      'prefill': {
        'contact': widget.phnNo,
        'email': widget.email,
      },
      "external" : {
        "wallets" : ["paytm"]
      }
    };

    getJwtTokenValue();
  }

  @override
  Widget build(BuildContext context) {
    // print("razor runtime --------: ${_razorpay.runtimeType}");
    return Scaffold(
      body: FutureBuilder(
          future: payData(),
          builder: (context, snapshot) {
            return Container(
              child: Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }),
    );
  }

/*  Future<http.Response> paymentSucess(PaymentSuccessResponse response)
  async {
    const url = '${apiHost}connection/addPaymentSuccess';
    Map data = {
      "amount": widget.amount,
      "paymentId": response.paymentId,
      "orderId": response.orderId,
      "signature": response.signature,
      "specialization": widget.speciality
    };
    print (response.paymentId);
    var Body = json.encode(data);
    print(Body.toString());
    try {
      final response = await http.post(url, body: Body, headers: {"Content-Type": "application/json","authorization": jwtToken});  //
      print("${response.statusCode}");
      print("${response.body}");
print(jwtToken);
      final result = jsonDecode(response.body);
      print(result["code"].toString());

      print("payment sucess");
      final String code= result["code"].toString();
      if(code == 3){
        showToast(result["message"].toString());
      }
    } catch (error) {
      showToast(error.toString());
      print(error);
    }
  }
*/
/*  Future<http.Response> paymentFailed(PaymentFailureResponse response)
  async {
    const url = '${apiHost}connection/addPaymentError';
    Map data = {
      "amount": widget.amount,
      "code":1,
      "message": response.message,
      "specialization": widget.speciality

    };
    var Body = json.encode(data);
    try {
      final response = await http.post(url, body: Body, headers: {"Content-Type": "application/json", "authorization": jwtToken});
      print("${response.statusCode}");
      print("${response.body}");

      final result = jsonDecode(response.body);
      print(result["code"].toString());

      final String code= result["code"].toString();
      if(code == 3){
        showToast(result["message"].toString());
      }
    } catch (error) {
      showToast(error.toString());
      print(error);
    }
  }
  */
}

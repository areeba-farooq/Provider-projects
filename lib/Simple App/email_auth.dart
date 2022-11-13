// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:http/http.dart' as http;
// import 'package:service_app/authentications/otp_code_screen.dart';

// import '../i am_cleaner/Graph_screen.dart';

// TextEditingController emailController = TextEditingController();

// class EmailAuthScreen extends StatefulWidget {
//   const EmailAuthScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<EmailAuthScreen> createState() => _EmailAuthScreenState();
// }

// class _EmailAuthScreenState extends State<EmailAuthScreen> {
//   bool isLoading = false;
//   String email = '';
//   var message;
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//   }

//   emailAuth() async {
//     isLoading = true;
//     setState(() {});
//     var headers = {'Content-Type': 'application/json'};

//     var request = http.Request(
//         'POST', Uri.parse('https://butlerapps.co/api/SendOTP.php'));
//     request.body = json.encode({"email": email, "type": 'email'});
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 201) {
//       print(await response.stream.bytesToString());
//       Fluttertoast.showToast(msg: "OTP sent to your email address.");
//       Get.to(const VerifyEmail());

//       setState(() {
//         isLoading = false;
//       });
//     } else if (response.statusCode == 200) {
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       message = body['message'];
//       print("i am message $message");
//       Fluttertoast.showToast(msg: "$message");
//       print("Wrong credetional");
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       print(response.reasonPhrase);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 13.0, left: 19, right: 19),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: const BackArrowButton(
//                         imgsrc: 'assets/icons/Icon ionic-ios-.svg',
//                         bgColor: Colors.white),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Verify your Email",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: const [
//                   Text(
//                     "Lorem ipsum dolor sit amet,consetetur\nsadipscingelitr,sed diam nonumy",
//                     style: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 15.0,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               SizedBox(
//                   height: 200,
//                   child: Image.asset('images/New message-bro.png')),
//               const SizedBox(
//                 height: 32,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 20.0,
//                   ),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter email address';
//                       } else {
//                         return null;
//                       }
//                     },
//                     controller: emailController,
//                     keyboardType: TextInputType.text,
//                     onSaved: (val) {
//                       email = val!;
//                     },
//                     //controller: phoneController,
//                     decoration: const InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                         borderSide: BorderSide(color: Colors.grey, width: 1),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                         borderSide: BorderSide(color: Colors.grey, width: 1),
//                       ),

//                       hintText: 'info@example.com',
//                       // border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               isLoading
//                   ? const Center(
//                       child: SizedBox(
//                           width: 80,
//                           child: LoadingIndicator(
//                               indicatorType: Indicator.ballBeat,
//                               colors: [
//                                 Colors.green,
//                               ],
//                               strokeWidth: 2,
//                               pathBackgroundColor: Colors.blue)),
//                     )
//                   : Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: MaterialButton(
//                           color: HexColor("#33CE85"),
//                           minWidth: double.infinity,
//                           padding: EdgeInsets.symmetric(vertical: 23.h),
//                           height: 50,
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: HexColor("#33CE85"),
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           onPressed: () {
//                             if (_formKey.currentState!.validate()) {
//                               setState(() {
//                                 email = emailController.text;
//                               });
//                               emailAuth();
//                             }
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 'Send OTP',
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 18),
//                               ),
//                             ],
//                           )),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:service_app/authentications/email_auth.dart';
// import '../i am_cleaner/Bottom_sheets/bottomsheet1.dart';
// import 'package:http/http.dart' as http;

// import '../screens/choose.dart';

// class VerifyEmail extends StatefulWidget {
//   const VerifyEmail({Key? key}) : super(key: key);

//   @override
//   State<VerifyEmail> createState() => _VerifyEmailState();
// }

// class _VerifyEmailState extends State<VerifyEmail> {
//   TextEditingController otpController = TextEditingController();

//   String verificationID = "";

//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   var message;
//   @override
//   void dispose() {
//     super.dispose();
//     otpController.dispose();
//   }

//   verifyOtp() async {
//     isLoading = true;
//     setState(() {});
//     var headers = {'Content-Type': 'application/json'};
//     var request = http.Request(
//         'POST', Uri.parse('https://butlerapps.co/api/VerifyEmail.php'));
//     request.body = json
//         .encode({"email": emailController.text, "otp_code": verificationID});
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 201) {
//       print(await response.stream.bytesToString());
//       Fluttertoast.showToast(msg: "Email Verified!");
//       Get.to(const ChooseWhatDescribeYouBest());
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
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: configSize(context).height * 0.03,
//                   top: configSize(context).width * 0.05,
//                 ),
//                 child: Container(
//                   width: configSize(context).width * 0.1,
//                   height: configSize(context).height * 0.05,
//                   decoration: BoxDecoration(
//                     color: const Color(0xffffffff),
//                     borderRadius: BorderRadius.circular(5.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.shade200,
//                         offset: const Offset(0, 2),
//                         blurRadius: 3.0,
//                       ),
//                     ],
//                   ),
//                   child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.arrow_back_ios_new_outlined),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   top: configSize(context).height * 0.035,
//                   left: configSize(context).height * 0.027,
//                   right: configSize(context).height * 0.027,
//                 ),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Submit the OTP',
//                               style: TextStyle(
//                                   fontSize: configSize(context).height * 0.035,
//                                   color: Colors.black,
//                                   fontFamily: 'SF-Pro-Display',
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: configSize(context).height * 0.007,
//                             ),
//                             Text.rich(
//                               TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'We have just send a OPT to ',
//                                     style: TextStyle(
//                                       fontSize:
//                                           configSize(context).width * 0.038,
//                                       fontFamily: 'SF-Pro-Dis-Regular',
//                                       color: const Color(0xff202020)
//                                           .withOpacity(0.7),
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '333598465654 ',
//                                     style: TextStyle(
//                                       fontSize:
//                                           configSize(context).width * 0.04,
//                                       fontFamily: 'SF-Pro-Display',
//                                       color: const Color(0xff202020)
//                                           .withOpacity(0.8),
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '\nif you have\'t received. ',
//                                     style: TextStyle(
//                                         fontSize:
//                                             configSize(context).width * 0.038,
//                                         fontFamily: 'SF-Pro-Dis-Regular',
//                                         color: const Color(0xff202020)
//                                             .withOpacity(0.7)),
//                                   ),
//                                   TextSpan(
//                                     text: 'Click here',
//                                     style: TextStyle(
//                                       fontSize:
//                                           configSize(context).width * 0.04,
//                                       fontFamily: 'SF-Pro-Display',
//                                       color: const Color(0xff202020)
//                                           .withOpacity(0.8),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: configSize(context).height * 0.05,
//                     ),
//                     Form(
//                       key: _formKey,
//                       child: Center(
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter otp code';
//                             } else {
//                               return null;
//                             }
//                           },
//                           onSaved: (val) {
//                             verificationID = val!;
//                           },
//                           controller: otpController,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12)),
//                               hintText: "Enter Your OTP"),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         if (_formKey.currentState!.validate()) {
//                           setState(() {
//                             verificationID = otpController.text;
//                           });
//                           verifyOtp();
//                         }
//                       },

//                       // () {
//                       //   Get.to(ChooseWhatDescribeYouBest());
//                       // },
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: configSize(context).height * 0.093,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: const Color(0xff33ce85),
//                           borderRadius: BorderRadius.circular(10.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.shade400,
//                               offset: const Offset(0, 2),
//                               blurRadius: 10.0,
//                             ),
//                           ],
//                         ),
//                         child: Text(
//                           'Continue',
//                           style: TextStyle(
//                             fontSize: configSize(context).height * 0.026,
//                             fontFamily: 'SF-Pro-Display',
//                             color: const Color(0xffffffff),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

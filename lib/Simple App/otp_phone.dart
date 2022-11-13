// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:service_app/screens/choose.dart';

// import '../Utilities/utils.dart';
// import '../i am_cleaner/Graph_screen.dart';

// enum LoginScreen { SHOW_MOBILE_ENTER_WIDGET, SHOW_OTP_FORM_WIDGET }

// class Otp extends StatefulWidget {
//   const Otp({Key? key}) : super(key: key);

//   @override
//   _OtpState createState() => _OtpState();
// }

// class _OtpState extends State<Otp> {
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController otpController = TextEditingController();
//   LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String verificationID = "";
//   String email = '';
//   CountryCode countryCode = CountryCode.fromDialCode('+92');
//   bool isLoading = false;
//   var message;

//   void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async {
//     try {
//       final authCred = await _auth.signInWithCredential(phoneAuthCredential);

//       if (authCred.user != null) {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => const ChooseWhatDescribeYouBest()));
//         //ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Login Successfully')));
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Some Error Occured. Try Again Later')));
//     }
//   }

//   void phoneAuthSignUp() async {
//     await _auth.verifyPhoneNumber(
//         phoneNumber: "$countryCode${phoneController.text}",
//         verificationCompleted: (phoneAuthCredential) async {},
//         verificationFailed: (e) {
//           showSnackBar(e.message!, context);
//         },
//         codeSent: (verificationID, resendingToken) async {
//           setState(() {
//             currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
//             this.verificationID = verificationID;
//           });
//         },
//         codeAutoRetrievalTimeout: (verificationID) async {});
//   }

//   void verifyOTP() {
//     AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);
//     signInWithPhoneAuthCred(phoneAuthCredential);
//   }

//   showMobilePhoneWidget(context) {
//     return SafeArea(
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
//               Padding(
//                 padding: const EdgeInsets.only(
//                   top: 20.0,
//                 ),
//                 child: TextFormField(
//                   controller: phoneController,
//                   keyboardType: TextInputType.number,
//                   //controller: phoneController,
//                   decoration: const InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                       borderSide: BorderSide(color: Colors.grey, width: 1),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                       borderSide: BorderSide(color: Colors.grey, width: 1),
//                     ),

//                     hintText: 'info@example.com',
//                     // border: InputBorder.none,
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
//                           onPressed: phoneAuthSignUp,
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
//     );
//   }

//   showOtpFormWidget(context) {
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                 left: configSize(context).height * 0.03,
//                 top: configSize(context).width * 0.05,
//               ),
//               child: Container(
//                 width: configSize(context).width * 0.1,
//                 height: configSize(context).height * 0.05,
//                 decoration: BoxDecoration(
//                   color: const Color(0xffffffff),
//                   borderRadius: BorderRadius.circular(5.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.shade200,
//                       offset: const Offset(0, 2),
//                       blurRadius: 3.0,
//                     ),
//                   ],
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back_ios_new_outlined),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: configSize(context).height * 0.035,
//                 left: configSize(context).height * 0.027,
//                 right: configSize(context).height * 0.027,
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Submit the OTP',
//                             style: TextStyle(
//                                 fontSize: configSize(context).height * 0.035,
//                                 color: Colors.black,
//                                 fontFamily: 'SF-Pro-Display',
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(
//                             height: configSize(context).height * 0.007,
//                           ),
//                           Text.rich(
//                             TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: 'We have just send a OPT to ',
//                                   style: TextStyle(
//                                     fontSize: configSize(context).width * 0.038,
//                                     fontFamily: 'SF-Pro-Dis-Regular',
//                                     color: const Color(0xff202020)
//                                         .withOpacity(0.7),
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '333598465654 ',
//                                   style: TextStyle(
//                                     fontSize: configSize(context).width * 0.04,
//                                     fontFamily: 'SF-Pro-Display',
//                                     color: const Color(0xff202020)
//                                         .withOpacity(0.8),
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: '\nif you have\'t received. ',
//                                   style: TextStyle(
//                                       fontSize:
//                                           configSize(context).width * 0.038,
//                                       fontFamily: 'SF-Pro-Dis-Regular',
//                                       color: const Color(0xff202020)
//                                           .withOpacity(0.7)),
//                                 ),
//                                 TextSpan(
//                                   text: 'Click here',
//                                   style: TextStyle(
//                                     fontSize: configSize(context).width * 0.04,
//                                     fontFamily: 'SF-Pro-Display',
//                                     color: const Color(0xff202020)
//                                         .withOpacity(0.8),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: configSize(context).height * 0.05,
//                   ),
//                   Center(
//                     child: TextField(
//                       controller: otpController,
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12)),
//                           hintText: "Enter Your OTP"),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   GestureDetector(
//                     onTap: verifyOTP,

//                     // () {
//                     //   Get.to(ChooseWhatDescribeYouBest());
//                     // },
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: configSize(context).height * 0.093,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: const Color(0xff33ce85),
//                         borderRadius: BorderRadius.circular(10.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.shade400,
//                             offset: const Offset(0, 2),
//                             blurRadius: 10.0,
//                           ),
//                         ],
//                       ),
//                       child: Text(
//                         'Continue',
//                         style: TextStyle(
//                           fontSize: configSize(context).height * 0.026,
//                           fontFamily: 'SF-Pro-Display',
//                           color: const Color(0xffffffff),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //resizeToAvoidBottomInset: true,
//       body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET
//           ? showMobilePhoneWidget(context)
//           : showOtpFormWidget(context),
//     );
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
// import 'package:get/instance_manager.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:service_app/authentications/create_account_screen.dart';
// import 'package:service_app/authentications/otp_screen.dart';
// import 'package:service_app/i%20am_cleaner/Navigation_bar/Navigation_Bar_screen.dart';
// import 'package:http/http.dart' as http;

// class login_email extends StatefulWidget {
//   const login_email({Key? key}) : super(key: key);

//   @override
//   State<login_email> createState() => _login_emailState();
// }

// class _login_emailState extends State<login_email> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   String email = '';
//   String password = '';
//   bool isLoading = false;
//   final _formKey = GlobalKey<FormState>();

//   final _loginStatus = 0;
//   var message;

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   //VALIDATE USER SESSION
//   // getPref() async {
//   //   SharedPreferences preferences = await SharedPreferences.getInstance();
//   //
//   //   setState(() {
//   //     _loginStatus = preferences.getInt("value")!;
//   //   });
//   // }

//   loginAuth() async {
//     isLoading = true;
//     setState(() {});
//     var headers = {'Content-Type': 'application/json'};
//     var request =
//         http.Request('POST', Uri.parse('https://butlerapps.co/api/Login.php'));
//     request.body = json.encode({
//       "email": email,
//       "password": password,
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 201) {
//       print(await response.stream.bytesToString());
//       Fluttertoast.showToast(msg: "Login successfully");
//       Get.to(const MaterialYou());
//       print("api hit successfully");

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
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0, left: 18),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       width: 140,
//                       child: Image.asset('images/butler.png'),
//                     ),
//                     const SizedBox(
//                       width: 15,
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           "Welcome Back",
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: HexColor("#33CE85"),
//                               fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: const [
//                         Text(
//                           "Login using your Email!",
//                           style: TextStyle(
//                               fontSize: 22,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold),
//                         )
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "Lorem ipsum dolor sit amet, consetetur sadipscing\nelitr, sed diam nonumy",
//                           style: TextStyle(
//                             fontSize: MediaQuery.of(context).size.width * 0.038,
//                             color: Colors.black87,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 18),
//                     child: Column(
//                       children: [
//                         Container(
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter email address';
//                               } else if (!value.contains('@')) {
//                                 return 'Please enter Valid Email Adress';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onSaved: (val) {
//                               email = val!;
//                             },
//                             controller: _emailController,
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: "Email",
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/mail.svg',
//                                   width: 2,
//                                   height: 2,
//                                 ),
//                               ),

//                               hintStyle: const TextStyle(color: Colors.grey),
//                               border: const OutlineInputBorder(),
//                               errorStyle: const TextStyle(
//                                   color: Colors.red, fontSize: 15),
//                               // filled: true,
//                               // fillColor: Colors.white,
//                               enabledBorder: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12.0)),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey, width: 1),
//                               ),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10.0)),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey, width: 1),
//                               ),
//                             ),
//                             // controller: usernamecontroller,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 18,
//                         ),
//                         Container(
//                           child: TextFormField(
//                             controller: _passwordController,
//                             validator: (value) {
//                               if (value!.isEmpty) {
//                                 return 'Please enter password';
//                               } else {
//                                 return null;
//                               }
//                             },
//                             onSaved: (val) {
//                               password = val!;
//                             },
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               hintText: "Password",
//                               prefixIcon: Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: SvgPicture.asset(
//                                   'assets/icons/keysvg.svg',
//                                   width: 2,
//                                   height: 2,
//                                 ),
//                               ),

//                               hintStyle: const TextStyle(color: Colors.grey),
//                               border: const OutlineInputBorder(),
//                               errorStyle: const TextStyle(
//                                   color: Colors.red, fontSize: 15),
//                               // filled: true,
//                               // fillColor: Colors.white,
//                               enabledBorder: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(12.0)),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey, width: 1),
//                               ),
//                               focusedBorder: const OutlineInputBorder(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(10.0)),
//                                 borderSide:
//                                     BorderSide(color: Colors.grey, width: 1),
//                               ),
//                             ),
//                             // controller: usernamecontroller,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(const Otp());
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(18.0),
//                     //change
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         // Text(
//                         //   "forgot password",
//                         //   style: TextStyle(
//                         //       fontSize: 15,
//                         //       decoration: TextDecoration.underline,
//                         //       color: HexColor("#33CE85"),
//                         //       fontWeight: FontWeight.w500),
//                         // ),
//                         Text(
//                           "forgot password?",
//                           style: TextStyle(
//                             shadows: [
//                               Shadow(
//                                   color: HexColor("#33CE85"),
//                                   offset: const Offset(0, -5))
//                             ],
//                             color: Colors.transparent,
//                             decoration: TextDecoration.underline,
//                             decorationColor: HexColor("#33CE85"),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 120,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const Text(
//                       "Dont have an account?",
//                       style: TextStyle(
//                         color: Colors.black54,
//                         fontSize: 15.0,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 5.0,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(const CreateAccountScreen());
//                       },
//                       child: const Text(
//                         "Sign up!",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 15.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 isLoading
//                     ? const Center(
//                         child: SizedBox(
//                             width: 80,
//                             child: LoadingIndicator(
//                                 indicatorType: Indicator.ballBeat,
//                                 colors: [
//                                   Colors.green,
//                                 ],
//                                 strokeWidth: 2,
//                                 pathBackgroundColor: Colors.blue)),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(top: 8.0, right: 18.0),
//                         child: MaterialButton(
//                             padding: const EdgeInsets.symmetric(vertical: 19),
//                             color: HexColor("#33CE85"),
//                             minWidth: double.infinity,
//                             height: 50,
//                             elevation: 1,
//                             shape: RoundedRectangleBorder(
//                               side: BorderSide(
//                                 color: HexColor("#33CE85"),
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 setState(() {
//                                   email = _emailController.text;
//                                   password = _passwordController.text;
//                                 });
//                                 loginAuth();
//                               }
//                             },

//                             // () async {
//                             //   Get.to(const MainBottomClass());
//                             // },
//                             child: const Text(
//                               'Login',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                       ),
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }

// extension TextStyleX on TextStyle {
//   /// A method to underline a text with a customizable [distance] between the text
//   /// and underline. The [color], [thickness] and [style] can be set
//   /// as the decorations of a [TextStyle].
//   TextStyle underlined({
//     Color? color,
//     double distance = 1,
//     double thickness = 1,
//     TextDecorationStyle style = TextDecorationStyle.solid,
//   }) {
//     return copyWith(
//       shadows: [
//         Shadow(
//           color: this.color ?? Colors.black,
//           offset: Offset(0, -distance),
//         )
//       ],
//       color: Colors.transparent,
//       decoration: TextDecoration.underline,
//       decorationThickness: thickness,
//       decorationColor: color ?? this.color,
//       decorationStyle: style,
//     );
//   }
// }

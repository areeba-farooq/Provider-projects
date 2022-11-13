// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:loading_indicator/loading_indicator.dart';
// import 'package:service_app/Utilities/utils.dart';
// import 'package:service_app/authentications/otp_screen.dart';
// import 'package:service_app/widgets/colors.dart';
// import 'package:service_app/widgets/constant.dart';
// import 'package:http/http.dart' as http;

// class CreateAccountScreen extends StatefulWidget {
//   const CreateAccountScreen({Key? key}) : super(key: key);

//   @override
//   State<CreateAccountScreen> createState() => _CreateAccountScreenState();
// }

// class _CreateAccountScreenState extends State<CreateAccountScreen> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   Uint8List? _image;
//   final bool _isLoading = false;
//   String email = '';
//   String password = '';
//   String confirmPassword = '';
//   String fullName = '';
//   final _formKey = GlobalKey<FormState>();
//   var message;
//   bool isLoading = false;
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _fullNameController.dispose();
//     _confirmPasswordController.dispose();
//   }

//   void selectImage() async {
//     Uint8List img = await pickImg(ImageSource.gallery, context);
//     setState(() {
//       _image = img;
//     });
//   }

//   register() async {
//     isLoading = true;
//     setState(() {});
//     var request = http.MultipartRequest(
//         'POST', Uri.parse("https://butlerapps.co/api/Signup.php"));
//     request.fields.addAll({
//       'full_name': fullName,
//       'email': email,
//       'password': password,
//     });
//     // request.files.add(await http.MultipartFile.fromPath('profile_image', '/C:/Users/IT Vision/Downloads/50_CleanupSong.png'));
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       // print(await response.stream.bytesToString());
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       message = body['message'];
//       print("i am message $message");
//       Fluttertoast.showToast(msg: "$message");
//       print("already exist");
//       setState(() {
//         isLoading = false;
//       });
//     } else if (response.statusCode == 201) {
//       var res = await response.stream.bytesToString();
//       var body = jsonDecode(res);
//       message = body['message'];
//       print("i am message $message");
//       Fluttertoast.showToast(msg: "$message");
//       print("account created successfully");
//       Get.to(const Otp());
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       print("nahi m nhi chal rhi");
//       print(response.reasonPhrase);
//       Fluttertoast.showToast(msg: "something went wrong please try again");
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           shrinkWrap: true,
//           children: [
//             Column(
//               children: [
//                 Stack(
//                   children: [
//                     ClipRRect(
//                       child: Container(
//                         width: double.infinity,
//                         // height: sizeConfiq(context).height ,
//                         color: calenderColor,
//                         child: Column(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(
//                                   left: sizeConfiq(context).width * 0.06,
//                                   top: sizeConfiq(context).height * 0.04),
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             Get.back();
//                                           },
//                                           //button/////////
//                                           child: const BackArrowButton(
//                                               imgsrc:
//                                                   'assets/icons/Icon ionic-ios-white.svg',
//                                               bgColor: Color(0xFF3d3d3d)),
//                                         ),
//                                         SizedBox(
//                                           width:
//                                               sizeConfiq(context).width * 0.2,
//                                           height:
//                                               sizeConfiq(context).height * 0.1,
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               SizedBox(
//                                                 height:
//                                                     sizeConfiq(context).height *
//                                                         0.01,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Transform.translate(
//                                           offset: const Offset(100, -170),
//                                           child: Image.asset(
//                                             'assets/images/Ellipse 1600.png',
//                                             width:
//                                                 sizeConfiq(context).width * 0.6,
//                                             height: sizeConfiq(context).height *
//                                                 0.5,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Transform.translate(
//                                     offset: Offset(
//                                         -sizeConfiq(context).width * 0.062,
//                                         -sizeConfiq(context).height * 0.42),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Create An Account',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: white,
//                                               fontSize:
//                                                   sizeConfiq(context).width *
//                                                       0.055),
//                                         ),
//                                         const SizedBox(
//                                           height: 8,
//                                         ),
//                                         Text(
//                                           'Lorem ipsum dolor sit amet, consetetur sadipscing\nelitr, sed diam nonumy',
//                                           style: TextStyle(
//                                               fontSize:
//                                                   sizeConfiq(context).width *
//                                                       0.032,
//                                               color: const Color(0xFFffffff)
//                                                   .withOpacity(0.4)),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Transform.translate(
//                                       offset: Offset(
//                                           -sizeConfiq(context).width * 0.45,
//                                           -sizeConfiq(context).height * 0.42),
//                                       child: Transform.rotate(
//                                         angle: -330,
//                                         child: Image.asset(
//                                           'assets/images/Ellipse 1600.png',
//                                           width:
//                                               sizeConfiq(context).width * 0.34,
//                                           height:
//                                               sizeConfiq(context).height * 0.24,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(
//                           top: sizeConfiq(context).height * 0.3),
//                       child: Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                             color: white,
//                             borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(
//                                     sizeConfiq(context).width * 0.1),
//                                 topRight: Radius.circular(
//                                     sizeConfiq(context).width * 0.1))),
//                         child: Padding(
//                           padding: EdgeInsets.only(
//                               top: sizeConfiq(context).height * 0.17,
//                               left: sizeConfiq(context).width * 0.06,
//                               right: sizeConfiq(context).width * 0.06),
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               children: [
//                                 CustomFormField(
//                                   hinttxt: 'Full name',
//                                   controller: _fullNameController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please enter your Full Name';
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 CustomFormField(
//                                   hinttxt: 'Email',
//                                   controller: _emailController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please enter email address';
//                                     } else if (!value.contains('@')) {
//                                       return 'Please enter Valid Email Adress';
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 CustomFormField(
//                                   hinttxt: 'Password',
//                                   controller: _passwordController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please enter password';
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 CustomFormField(
//                                   hinttxt: 'Confirm Password',
//                                   controller: _confirmPasswordController,
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'Please re-enter your password';
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 isLoading
//                                     ? const Center(
//                                         child: SizedBox(
//                                             width: 80,
//                                             child: LoadingIndicator(
//                                                 indicatorType:
//                                                     Indicator.ballBeat,
//                                                 colors: [
//                                                   Colors.green,
//                                                 ],
//                                                 strokeWidth: 2,
//                                                 pathBackgroundColor:
//                                                     Colors.blue)),
//                                       )
//                                     : GestureDetector(
//                                         onTap: () {
//                                           if (_formKey.currentState!
//                                               .validate()) {
//                                             setState(() {
//                                               email = _emailController.text;
//                                               fullName =
//                                                   _fullNameController.text;
//                                               password =
//                                                   _passwordController.text;
//                                               confirmPassword =
//                                                   _confirmPasswordController
//                                                       .text;
//                                             });
//                                             register();
//                                           }
//                                         },
//                                         // () {

//                                         //   Get.to(const Phone_number());
//                                         // },
//                                         child: Container(
//                                           alignment: Alignment.center,
//                                           width: double.infinity,
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal:
//                                                   sizeConfiq(context).width *
//                                                       0.03,
//                                               vertical:
//                                                   sizeConfiq(context).height *
//                                                       0.03),
//                                           decoration: BoxDecoration(
//                                               color: lightgreen,
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       sizeConfiq(context)
//                                                               .width *
//                                                           0.03)),
//                                           child: _isLoading
//                                               ? const Center(
//                                                   child:
//                                                       CircularProgressIndicator(
//                                                     color: Colors.white,
//                                                   ),
//                                                 )
//                                               : Text(
//                                                   'Sign up with email',
//                                                   style: TextStyle(
//                                                       fontSize:
//                                                           sizeConfiq(context)
//                                                                   .width *
//                                                               0.045,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: white),
//                                                 ),
//                                         ),
//                                       ),
//                                 SizedBox(
//                                   height: sizeConfiq(context).height * 0.02,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     IconWidget(
//                                         imgsrc: 'assets/icons/google.png',
//                                         colr: Colors.red,
//                                         onTap: () {}),
//                                     SizedBox(
//                                         width:
//                                             sizeConfiq(context).width * 0.03),
//                                     IconWidget(
//                                       imgsrc: 'assets/icons/facebook.png',
//                                       colr: Colors.blue,
//                                       onTap: () {},
//                                     ),
//                                     SizedBox(
//                                         width:
//                                             sizeConfiq(context).width * 0.03),
//                                     IconWidget(
//                                       imgsrc: 'assets/icons/apple.png',
//                                       colr: calenderColor,
//                                       onTap: () {},
//                                     ),
//                                     SizedBox(
//                                         width:
//                                             sizeConfiq(context).width * 0.03),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: sizeConfiq(context).height * 0.03,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: sizeConfiq(context).height * 0.22,
//                       left: sizeConfiq(context).width * 0.349,
//                       child: Stack(
//                         children: [
//                           // Container(
//                           //     color: Colors.yellow,
//                           //     width: sizeConfiq(context).width * 2),
//                           _image != null
//                               ? Container(
//                                   width: sizeConfiq(context).width * 0.3,
//                                   height: sizeConfiq(context).height * 0.2,
//                                   decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                           image: MemoryImage(_image!)),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           color: lightgreen, width: 3)),
//                                 )
//                               : Container(
//                                   width: sizeConfiq(context).width * 0.3,
//                                   height: sizeConfiq(context).height * 0.2,
//                                   decoration: BoxDecoration(
//                                       image: const DecorationImage(
//                                           image: AssetImage(
//                                               'assets/images/default.png'),
//                                           fit: BoxFit.cover),
//                                       shape: BoxShape.circle,
//                                       border: Border.all(
//                                           color: lightgreen, width: 3)),
//                                 ),
//                           Positioned(
//                             left: sizeConfiq(context).width * 0.222,
//                             top: sizeConfiq(context).height * 0.019,
//                             child: Container(
//                               width: sizeConfiq(context).width * 0.075,
//                               height: sizeConfiq(context).height * 0.055,
//                               decoration: BoxDecoration(
//                                   color: calenderColor,
//                                   shape: BoxShape.circle,
//                                   border:
//                                       Border.all(color: lightgreen, width: 3)),
//                               child: IconButton(
//                                 onPressed: selectImage,
//                                 icon: Icon(Icons.edit,
//                                     color: white,
//                                     size: sizeConfiq(context).width * 0.03),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class IconWidget extends StatelessWidget {
//   final String imgsrc;
//   final Color colr;
//   final void Function() onTap;

//   const IconWidget(
//       {required this.imgsrc, required this.colr, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: sizeConfiq(context).width * 0.1,
//         height: sizeConfiq(context).height * 0.1,
//         decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage(imgsrc)),
//           color: colr,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

// class CustomFormField extends StatelessWidget {
//   final String hinttxt;
//   final controller;
//   final validator;
//   final onsav;

//   const CustomFormField(
//       {required this.hinttxt,
//       required this.controller,
//       this.validator,
//       this.onsav});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(bottom: sizeConfiq(context).height * 0.03),
//       child: TextFormField(
//         onSaved: onsav,
//         validator: validator,
//         controller: controller,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: sizeConfiq(context).width * 0.05,
//               vertical: sizeConfiq(context).height * 0.028),
//           hintText: hinttxt,
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Color(0xFFe2e2e2),
//             ),
//           ),
//           focusedBorder: const OutlineInputBorder(
//             borderSide: BorderSide(
//               color: Color(0xFFe2e2e2),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // DetailContainer

// class DetailContainer extends StatelessWidget {
//   final String title;

//   const DetailContainer({
//     requiredkey,
//     required this.title,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(
//         left: sizeConfiq(context).width * 0.05,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: TextStyle(fontSize: sizeConfiq(context).width * 0.045),
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Text(
//               'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, \nsed diam nonumy eirmod tempor invidunt ut labore et\ndolore magna aliquyam erat, sed dia',
//               style: TextStyle(fontSize: sizeConfiq(context).width * 0.04)),
//         ],
//       ),
//     );
//   }
// }

// //resuabele Container
// class InfoContainer extends StatelessWidget {
//   final String title, subtitle;

//   const InfoContainer({
//     requiredkey,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (subtitle.contains('Rating'))
//                 const Icon(
//                   Icons.star,
//                   color: lightgreen,
//                 ),
//               Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: sizeConfiq(context).width * 0.065,
//                     color: calenderColor),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: sizeConfiq(context).height * 0.001,
//           ),
//           Text(
//             subtitle,
//             style: TextStyle(
//                 fontSize: sizeConfiq(context).width * 0.04,
//                 color: const Color(0xFF666666)),
//           )
//         ],
//       ),
//     );
//   }
// }

// //Back Arrow Widget
// class BackArrowButton extends StatelessWidget {
//   final String imgsrc;
//   final Color bgColor;

//   const BackArrowButton({required this.imgsrc, required this.bgColor});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       child: Container(
//         width: sizeConfiq(context).width * 0.12,
//         height: sizeConfiq(context).height * 0.055,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 offset: const Offset(2, 2),
//                 spreadRadius: 5,
//                 blurRadius: 7)
//           ],
//           color: bgColor,
//           borderRadius: BorderRadius.circular(6),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: SvgPicture.asset(
//             imgsrc,
//           ),
//         ),
//       ),
//     );
//   }
// }

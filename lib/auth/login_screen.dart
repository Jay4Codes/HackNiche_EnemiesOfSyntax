import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/auth/auth_controller.dart';
import 'package:hack_niche/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  final formKey = GlobalKey<FormState>();
  AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(color: Colors.black),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/illustrations/logo.png",
                    height: 200,
                  ),
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Get',
                        style: GoogleFonts.ptSans(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1))),
                    TextSpan(
                        text: ' Started',
                        style: GoogleFonts.ptSans(
                            textStyle: const TextStyle(
                                color: Color(0xFFFF3232), fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 1)))
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset('assets/illustrations/login.png'),
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is Required';
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, top: 28),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        // color: formKey.currentState!.validate()
                        //     ? R.colors.blue
                        //     : R.colors.red),
                        color: Colors.red,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Color(0xFFC4C4C4),
                        )),
                    isDense: true,
                    hintText: 'john@example.com',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1)),
                  ),
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(

                          // color: formKey.currentState!.validate()
                          //     ? R.colors.blue
                          //     : R.colors.red),
                          color: Colors.red),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                        icon: Icon(obscure ? Icons.visibility : Icons.visibility_off, color: Colors.grey)),
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 10),
                    border: InputBorder.none,
                    hintText: 'min. 8 characters',
                    hintStyle: GoogleFonts.ptSans(
                        textStyle: const TextStyle(
                            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1)),
                  ),
                  style: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        minimumSize: Size(400, 45),
                        backgroundColor: Color(0xFFFF3232)),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.nunito(
                          textStyle: const TextStyle(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
                    ),
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;

                      formKey.currentState!.save();

                      print('Button pressed ...');

                      Loader.show(context, progressIndicator: CircularProgressIndicator(color: Colors.blue));

                      String status = '';

                      try {
                        status = await controller.login(emailController.text, passwordController.text);
                      } on Exception catch (e) {
                        Loader.hide();
                      }
                      bool storedFcm = true;

                      // ChatStore.ChatStore chatStore =
                      //     Modular.get<ChatStore.ChatStore>();

                      // chatStore.init(GetStorage().read('token'));

                      // Future.delayed(Duration.zero, () async {
                      //   storedFcm = await controller.storeFcm();
                      //   print(storedFcm);
                      //   print('in delay');
                      // });

                      Loader.hide();

                      if (status == "Success" && storedFcm) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
                      }

                      // if (status == "user_disable") {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //       content: Text("Need to enable account"),
                      //     ),
                      //   );
                      //   // final enableStatus =
                      //   //     await controller.enableAccount(
                      //   //         emailController.text,
                      //   //         passwordController.text);
                      // }

                      // ScaffoldMessenger.of(context).showSnackBar(
                      // SnackBar(
                      //   content: Text("There seems to be some issue"),
                      // ),
                      // );
                      if (status == "incorrect_user_details") {
                        setState(() {});
                      }

                      if (status == "other_issue") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("There seems to be some issue"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

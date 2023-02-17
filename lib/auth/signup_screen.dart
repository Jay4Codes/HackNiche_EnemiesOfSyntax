import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hack_niche/auth/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  final formKey = GlobalKey<FormState>();
  AuthController controller = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Login',
                      style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                              color: Colors.blue,
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1))),
                  TextSpan(
                      text: ' in',
                      style: GoogleFonts.ptSans(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1)))
                ]),
              ),
              Image.asset(
                  'assets/illustrations/Hand holding smartphones with online newspaper, newsletter-min.jpg'),
              TextFormField(
                cursorColor: Colors.blue,
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
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ),
                style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                cursorColor: Colors.blue,
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
                      icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey)),
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hintText: 'min. 8 characters',
                  hintStyle: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ),
                style: GoogleFonts.ptSans(
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: TextButton(
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: Size(355, 45),
                      backgroundColor: Colors.blue),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.nunito(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1)),
                  ),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;

                    formKey.currentState!.save();

                    print('Button pressed ...');

                    Loader.show(context,
                        progressIndicator:
                            CircularProgressIndicator(color: Colors.blue));

                    String status = '';

                    try {
                      status = await controller.login(
                          emailController.text, passwordController.text);
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

                    if (status ==
                        "Employer account cannot be logged in through app") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(status),
                        ),
                      );
                      return;
                    }

                    if (status == "success" && storedFcm) {
                      return;
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
    );
  
  }
}
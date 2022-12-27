import 'package:flutter/material.dart';
import 'package:mobile_task/utils/text_field_box.dart';
import '../provider/auth_proivder.dart';
import '../utils/config.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scafoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final RoundedLoadingButtonController googleControlle =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(Config.app_icon),
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Welcome ...",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 50),
                  TextBox(controller: nameController, hintText: 'Name'),
                  const SizedBox(height: 20),
                  TextBox(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  TextBox(
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: MaterialButton(
                      height: 50,
                      elevation: 10,
                      minWidth: MediaQuery.of(context).size.width - 50,
                      color: Colors.grey.shade800,
                      onPressed: () {
                        authProvider.emailPasswordAuth(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            context: context);
                      },
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.person,
                            size: 20,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedLoadingButton(
                        controller: googleControlle,
                        onPressed: () {
                          authProvider.googleSignIn(context);
                        },
                        successColor: Colors.red,
                        width: MediaQuery.of(context).size.width + 0 * 80,
                        child: Wrap(
                          children: const [
                            Icon(
                              FontAwesomeIcons.google,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Sign in with Google",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      RoundedLoadingButton(
                        controller: googleControlle,
                        onPressed: () {
                          authProvider.facebookSignIn(context);
                        },
                        successColor: Colors.red,
                        width: MediaQuery.of(context).size.width + 0 * 80,
                        child: Wrap(
                          children: const [
                            Icon(
                              FontAwesomeIcons.facebook,
                              size: 20,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("Sign in with Facebook",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      )),
    );
  }
}

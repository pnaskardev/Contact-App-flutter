import 'package:flutter/material.dart';
import 'package:ivykids_assignment/features/auth/screens/signin_screen.dart';
import 'package:ivykids_assignment/features/auth/services/auth_service.dart';
import 'package:ivykids_assignment/utils/string_validator.dart';

class AutheScreen extends StatefulWidget {
  const AutheScreen({super.key});
  static const String routeName = '/sign-up';
  @override
  State<AutheScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AutheScreen> {
  @override
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  final AuthService authService = AuthService();
  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
  }

  Future<void> signUpuser()async {
    await authService.signUpUser(
        context: context,
        name: _usernameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: Colors.grey[300],
          body: Center(
            child: Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image.asset
                    // (
                    //   'assets/Images/img1.png',
                    //   height: deviceSize.height*0.4,
                    //   width: deviceSize.width*0.4,
                    // ),

                    // WELCOME BACK YOU HAVE BEEN MISSED
                    Text(
                      'We need to register your contact before getting started',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // Phone number textField
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: _usernameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            label: const Text('Username'),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: _phoneController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            label: const Text('PhoneNumber'),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true),
                        validator: (value) {
                          if (!StringValidator.validatePhone(value!)) {
                            return 'Invalid Phone Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            label: const Text('Email'),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true),
                        validator: (value) {
                          if (!StringValidator.validateEmail(value!)) {
                            return 'Invalid email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: _passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            label: const Text('Password'),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true),
                        // validator: (value)
                        // {
                        //   if (!StringValidator.validatePhone(value!))
                        //   {
                        //     return 'Invalid Phone Number';
                        //   }
                        //   return null;
                        // },
                        keyboardType: TextInputType.name,
                      ),
                    ),

                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: _confirmPassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            label: const Text('Confirm Password'),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade400)),
                            errorBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                )),
                            focusedErrorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            fillColor: Colors.grey.shade200,
                            filled: true),
                        keyboardType: TextInputType.name,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // SUBMIT BUTTON
                    SizedBox(
                      height: deviceSize.height * 0.08,
                      width: deviceSize.width * 0.65,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              await signUpuser();
                              setState(() {
                                _isLoading = false;
                              });
                              // await Provider.of<AuthService>(context, listen: false)
                              //   .submitPhoneNumber(
                              //   _usernameController.text.toString(), context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 8.0),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'SignUp',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      child: const Text('SignIn'),
                      onPressed: () 
                      {
                        Navigator.of(context).pushNamed(SignInScreen.routeName);
                      },
                    ),
                    // Padding
                    // (
                    //   padding: const EdgeInsets.symmetric(horizontal: 25),
                    //   child: Row
                    //   (
                    //     children:
                    //     [
                    //       Expanded
                    //       (
                    //         child:  Divider
                    //         (
                    //           thickness: 0.5,
                    //           color: Colors.grey[400],
                    //         ),
                    //       ),
                    //       Padding
                    //       (
                    //         padding:  const EdgeInsets.symmetric(horizontal: 10),
                    //         child:  Text
                    //         (
                    //           'Or continue with',
                    //           style: TextStyle
                    //           (
                    //             color: Colors.grey[700]
                    //           ),
                    //         ),
                    //       ),

                    //       Expanded
                    //       (
                    //         child:  Divider
                    //         (
                    //           thickness: 0.5,
                    //           color: Colors.grey[400],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //  GoogleSignInButton(),
                        // SizedBox(width: 10,),
                        // SquareTile(imagePath: 'assets/Images/apple.png'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

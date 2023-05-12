import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/bloc/auth_bloc.dart';
import 'package:hotel_booking/features/landing/view/screens/landing_screen.dart';
import 'package:hotel_booking/presentation/dashboard/dashboard.dart';
import 'package:hotel_booking/presentation/signUp/sign_up.dart';

import '../../styles/font_styles.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LandingScreen()));
          }
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              // Showing the sign in form if the user is not authenticated
              return SafeArea(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/login.png'),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter your email",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.white, width:30),
                                    ),
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null &&
                                        !EmailValidator.validate(value)
                                        ? 'Enter a valid email'
                                        : null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white, width: 0),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    return value != null && value.length < 6
                                        ? "Enter min. 6 characters"
                                        : null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _authenticateWithEmailAndPassword(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF91DABB),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32.0),
                                      ),
                                    ),
                                    child: const Text("Login", style: kFont26Get),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 500,
                            alignment: Alignment.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()),
                                );
                              },
                              child:  RichText(
                                text: const TextSpan(
                                  text: "Don't have an account?",
                                  style: kFont16,
                                  children: <TextSpan>[
                                    TextSpan(text: ' Sign Up', style: kFont16SigIn,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          TextButton.icon(     // <-- TextButton
                            onPressed: () {
                              _authenticateWithGoogle(context);
                            },
                            icon: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                              height: 30,
                              width: 30,
                            ),
                            label:  Text('Continue with Google', style: kFont16,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );

            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
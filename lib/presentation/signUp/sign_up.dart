import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/bloc/auth_bloc.dart';
import 'package:hotel_booking/features/landing/view/screens/landing_screen.dart';
import 'package:hotel_booking/presentation/dashboard/dashboard.dart';
import 'package:hotel_booking/presentation/signIn/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../styles/font_styles.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            // Navigating to the dashboard screen if the user is authenticated
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LandingScreen(),
              ),
            );
          }
          if (state is AuthError) {
            // Displaying the error message if the user is not authenticated
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is Loading) {
            // Displaying the loading indicator while the user is signing up
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UnAuthenticated) {
            // Displaying the sign up form if the user is not authenticated
            return SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/signup.png'),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [

                              //firstname TextFormField
                              TextFormField(
                                controller: _firstNameController,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter your first name",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.white, width:30),
                                  ),
                                ),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,

                              ),
                              SizedBox(height: 10,),

                              //lastname TextFormField
                              TextFormField(
                                controller: _lastNameController,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter your last name",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(color: Colors.white, width:30),
                                  ),
                                ),
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                              ),
                              SizedBox(
                                height: 10,
                              ),

                              // email TextFormField
                              TextFormField(
                                controller: _emailController,
                                enableSuggestions: false,
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
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
                              SizedBox(height: 10,),

                              //password TextFormField
                              TextFormField(
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
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _createAccountWithEmailAndPassword(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF91DABB),
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32.0),
                                    ),
                                  ),
                                  child: const Text("Sign Up", style: kFont26Get),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          width: 500,
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()),
                              );
                            },
                            child: RichText(
                              text: const TextSpan(
                                text: "Already have an account?",
                                style: kFont16,
                                children: <TextSpan>[
                                  TextSpan(text: ' Login', style: kFont16SigIn,
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
                          label: const Text('Continue with Google', style: kFont16,),
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
    );
  }

  void _createAccountWithEmailAndPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(
          _emailController.text,
          _passwordController.text,
        ),
      );
    }
  }
  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
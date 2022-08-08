import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/Colors.dart';
import 'package:hexcolor/hexcolor.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() {
    // TODO: implement createState
    return _Login();
  }
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Connexion"),
          automaticallyImplyLeading: false,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: PRIMARY_COLOR,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/login.png"),
                          fit: BoxFit.cover)),
                  height: MediaQuery.of(context).size.height * .25,
                  width: MediaQuery.of(context).size.height * .3,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, -5),
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 15)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: const Center(
                          child: Text(
                            "Salut a vous, Connectez-vous et profitez de la meilleure experience avec Gest",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: "Enter your Email",
                                  labelText: "Your Email",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "please enter a email";
                                  return null;
                                },
                              ),
                              margin: EdgeInsets.only(top: 10, bottom: 5),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, bottom: 15),
                              child: TextFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.password_outlined),
                                  suffixIcon:
                                      Icon(Icons.visibility_off_outlined),
                                  hintText: "Enter your password",
                                  labelText: "Your Password",
                                ),
                                validator: (value) {
                                  if (value!.isEmpty)
                                    return "please enter a email";
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    Size(size.width, 55),
                                  ),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.pushNamed(context, '/dashboard');
                                    print(emailController.text +
                                        passwordController.text);
                                  }
                                },
                                child: Text(
                                  "Se connecter",
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(30),
                                padding: EdgeInsets.only(
                                    left: size.width * .2,
                                    right: size.width * .2),
                                alignment: AlignmentDirectional.center,
                                child: Divider(
                                  color: Colors.black.withOpacity(.1),
                                  thickness: 1.5,
                                )),
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              alignment: AlignmentDirectional.center,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  textStyle: MaterialStateProperty.all(
                                    TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    Size(size.width, 55),
                                  ),
                                ),
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                          width: 20,
                                          height: 20,
                                          image: AssetImage(
                                              'assets/images/google.png')),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Continuez avec Google",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              alignment: AlignmentDirectional.center,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                label: Text(
                                  "Continuez avec Facebook",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                icon: Icon(
                                  Icons.facebook_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      HexColor("#3B5998")),
                                  textStyle: MaterialStateProperty.all(
                                    TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  minimumSize: MaterialStateProperty.all(
                                    Size(size.width, 55),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: Text("Vous n'avez pas de compte"),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Creer un compte",
                                  style: TextStyle(
                                      color: ACCENT_COLOR, fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

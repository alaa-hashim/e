import 'package:ecommerce_app/core/class/handlindatview.dart';
import 'package:ecommerce_app/core/constant/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/Login_controrller.dart';
import '../../../core/functions/appexit.dart';
import '../../../core/functions/validater.dart';
import '../../widget/auth/signup&login.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerimp());
    return WillPopScope(
      onWillPop: appExit,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppColor.bg,
        body: GetBuilder<LoginControllerimp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequst,
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Login your Account",
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            return inputvalidater(val!, 1, 30, "");
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter Email Address'),
                          controller: controller.email,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return inputvalidater(val!, 1, 30, "");
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Your Password'),
                          controller: controller.password,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            controller.goTofrogetpassword();
                          },
                          child: Text(
                            "Froget password",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          width: 230,
                          height: 55,
                          child: MaterialButton(
                            onPressed: () {
                              Future.delayed(Duration.zero, () {
                                controller.login();
                              });
                            },
                            textColor: AppColor.white,
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SignupButton(
                          onTap: () {
                            controller.goToSignUp();
                          },
                          textone: "Dont have an account ?    ",
                          texttwo: 'Signup',
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: AppColor.lightgray,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Coutnue with Accounts ",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColor.lightred,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 140,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {},
                                textColor: AppColor.red,
                                child: const Text("GOOGLE"),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColor.lightblue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: 150,
                              height: 55,
                              child: MaterialButton(
                                onPressed: () {},
                                textColor: AppColor.blue,
                                child: const Text("FACEBOOK"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}

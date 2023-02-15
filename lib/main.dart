import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyStepperApp(),
      },
    ),
  );
}

class MyStepperApp extends StatefulWidget {
  const MyStepperApp({Key? key}) : super(key: key);

  @override
  State<MyStepperApp> createState() => _MyStepperAppState();
}

class _MyStepperAppState extends State<MyStepperApp> {
  List<GlobalKey<FormState>> formkey =
      List.generate(3, (index) => GlobalKey<FormState>());

  int stepIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Stepper App",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Stepper(
            currentStep: stepIndex,
            controlsBuilder: (context, details) {
              return Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 100,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        (stepIndex < 2)
                            ? (formkey[stepIndex].currentState!.validate())
                                ? setState(() => stepIndex++)
                                : null
                            : null;
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 100,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          (stepIndex > 0) ? setState(() => stepIndex--) : null;
                        });
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              );
            },
            steps: [
              Step(
                title: const Text("Sign Up"),
                isActive: stepIndex >= 0,
                state: stepIndex <= 0 ? StepState.editing : StepState.complete,
                content: Form(
                  key: formkey[0],
                  child: Column(
                    children: [
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter User Name";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "User Name",
                            labelStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Email Id";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email-Id",
                            labelStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Password",
                            labelStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Confirm Password";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Confirm Password",
                            labelStyle:
                                TextStyle(fontSize: 14, color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                  title: const Text("Login"),
                  isActive: stepIndex >= 1,
                  state:
                      stepIndex <= 1 ? StepState.editing : StepState.complete,
                  content: Form(
                    key: formkey[1],
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter User Name";
                            } else {
                              null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "User Name",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Password";
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                        ),
                      ],
                    ),
                  )),
              Step(
                title: const Text("Home"),
                isActive: stepIndex >= 2,
                state: stepIndex <= 2 ? StepState.complete : StepState.complete,
                content: Form(
                  key: formkey[2],
                  child: const Text(
                    "Welcome to Stepper World.",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

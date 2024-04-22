import 'dart:ui';

import 'package:flutter/material.dart';

class SwichAcount extends StatelessWidget {
  const SwichAcount({super.key});

  @override
  Widget build(BuildContext context) {
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    );
    return Scaffold(
        backgroundColor: Color(0xff1c1f2e),
        body: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'images/switch_account_background.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3.10, sigmaY: 3.10),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromRGBO(194, 3, 3, 0.486),
                                  Color.fromRGBO(209, 8, 158, 0.631),
                                ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 28,
                              ),
                              Image(image: AssetImage('images/prf.png')),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'patric',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 227, 222, 222)),
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              ElevatedButton(
                                  style: Theme.of(context)
                                      .elevatedButtonTheme
                                      .style,
                                  onPressed: () {},
                                  child: Text('confirm')),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                'Switch Acount',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[300]),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an acount?',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                  ),
                  Text(
                    'sign up',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

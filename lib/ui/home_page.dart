import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:texs_app/api/api_service.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService get service => GetIt.I<ApiService>();

  Future<String> result(int sendCode) async {
    return await service.sendBoolean(sendCode);
  }

  String disableBtnText = 'Disable Database';
  String enableBtnText = 'Enable Database';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: _checkInternetConnection(),
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .3,
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      // 0
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              disableBtnText = 'Sending...';
                            });
                            result(0).then((value) => setState((){disableBtnText = 'response: $value';}));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(180)
                            ),
                            child: Center(
                              child: Text(
                                disableBtnText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // 1
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              enableBtnText = 'Sending...';
                            });
                            result(1).then((value) => setState((){enableBtnText = 'response: $value';}));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(180)
                            ),
                            child: Center(
                              child: Text(
                                enableBtnText,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.white, fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Text(snapshot.connectionState.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }

  Future<bool> _checkInternetConnection() async {
    var response = await InternetAddress.lookup('www.google.com');

    return response.isNotEmpty;
  }
}

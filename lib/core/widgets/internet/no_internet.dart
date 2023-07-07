import 'package:flutter/material.dart';
import 'package:seyamy/core/utils/helper.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_wifi_off,
              size: 120,
              color: Colors.grey[400],
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                'sorry..no_internet_connection',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                'check_your_router',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                'reconnect_to_network',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(
                  horizontal: context.width * 0.25, vertical: 20),
              child: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Theme.of(context).primaryColor,
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: 25.circular),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'refresh_screen',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

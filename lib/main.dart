import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UrlLauncherPackage(),
    );
  }
}

class UrlLauncherPackage extends StatefulWidget {
  const UrlLauncherPackage({Key? key}) : super(key: key);

  @override
  _UrlLauncherPackageState createState() => _UrlLauncherPackageState();
}

class _UrlLauncherPackageState extends State<UrlLauncherPackage> {
  final String lat = "31.46604554302377";
  final String lng = "74.25599821810253";
// Start Make Phone Call
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }
// Start Open Web URL
  _openWebURL() async {
    const url = 'https://ioitechnologies.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }
// Start Open Map
  _openMap() async {
    final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
    final String myOfficeLocationUrl =
        "https://g.page/ioiTechnologies?share=$lat,$lng";
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    }
    if (await canLaunch(myOfficeLocationUrl)) {
      await launch(myOfficeLocationUrl);
    } else {
      throw "Could Not Launch URL";
    }
  }
// Start Email
  _openEmail() async {
    launch(
        "mailto:naumansamtia3@gmail.com?subject=TestingEmail&Body= I Am Mailing for Test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Testing"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 10.0),
                  child: Text(
                    "Make Phone Call",
                    style: TextStyle(color: Colors.green, fontSize: 18),
                  ),
                ),
                onPressed: () => setState(() {
                  _makePhoneCall('tel:+923461681066');
                }),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _openWebURL();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 10.0),
                  child: Text(
                    "Open Web URL",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  _openEmail();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 10.0),
                  child: Text(
                    "Open Email",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  _openMap();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 45.0, vertical: 10.0),
                  child: Text(
                    "Open Map",
                    style: TextStyle(color: Colors.red[300], fontSize: 18),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

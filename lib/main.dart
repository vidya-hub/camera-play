import 'package:camera/camera.dart';
import 'package:camtest/campage.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var cameras = await availableCameras();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(
      cameras: cameras,
    ),
  ));
}

class HomePage extends StatelessWidget {
  List<CameraDescription> cameras;
  HomePage({this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CamPAge(
                              cameras: cameras,
                            )));
              },
              child: Text("CAMERA"),
            ),
          ),
        ),
      ),
    );
  }
}

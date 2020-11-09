import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class CamPAge extends StatefulWidget {
  List<CameraDescription> cameras;
  CamPAge({this.cameras});

  @override
  _CamPAgeState createState() => _CamPAgeState();
}

class _CamPAgeState extends State<CamPAge> {
  CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = new CameraController(widget.cameras[cam], ResolutionPreset.high);
    controller.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  int cam = 0;
  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Scaffold(body: Container());
    } else {
      return Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.8,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(
                  () {
                    if (cam == 0) {
                      setState(() {
                        cam = 1;
                      });
                    } else {
                      setState(() {
                        cam = 0;
                      });
                    }
                  },
                );
              },
              child: Text("Switch"),
            )
          ],
        ),
      );
    }
  }
}

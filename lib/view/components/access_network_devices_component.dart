import 'package:easacc_task/core/services/alerts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_blue/flutter_blue.dart';

import '../../core/values_manager.dart';

class AccessNetworkDevicesComponent extends StatefulWidget {
  const AccessNetworkDevicesComponent({Key? key}) : super(key: key);

  @override
  State<AccessNetworkDevicesComponent> createState() =>
      _AccessNetworkDevicesComponentState();
}

class _AccessNetworkDevicesComponentState
    extends State<AccessNetworkDevicesComponent> {
  final FlutterBlue instance = FlutterBlue.instance;
  List<ScanResult> devices = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            "Scan for Network devices and access them in the drop down menu",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: deviceHeight * 0.02),
        MaterialButton(
          elevation: 0.0,
          child: const Text("Scan", style: TextStyle(color: Colors.white)),
          color: Colors.blueAccent,
          onPressed: () {
            instance.startScan(
              timeout: const Duration(seconds: 10),
            );
          },
        ),
        SizedBox(height: deviceHeight * 0.02),
        StreamBuilder<List<ScanResult>>(
          stream: instance.scanResults,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              devices = snapshot.data!;
            }
            return DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<int>(
                  items: snapshot.data == null
                      ? []
                      : List.generate(
                          devices.length,
                          (index) => DropdownMenuItem(
                            value: index,
                            child: Text(snapshot.data![index].device.id.id),
                          ),
                        ),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(8.0),
                  onChanged: (index) async {
                    Alerts.showToast("Should connect to the device on tap");
                    await devices[index!].device.connect();
                  },
                  elevation: 0,
                  underline: Container(),
                  style: const TextStyle(color: Colors.black),
                  dropdownColor: Colors.grey.shade200,
                  hint: const Text(
                    "Connected devices",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          },
        ),
        SizedBox(height: deviceHeight * 0.02),
        StreamBuilder<bool>(
          stream: instance.isScanning,
          builder: (context, snapshot) => snapshot.data != null
              ? snapshot.data!
                  ? const Text("Scanning...")
                  : Container()
              : Container(),
        ),
      ],
    );
  }
}

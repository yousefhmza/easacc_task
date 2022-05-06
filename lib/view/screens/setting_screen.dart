import 'package:easacc_task/core/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/login_view_model/login_view_model.dart';
import '../components/access_network_devices_component.dart';
import '../components/input_url_component.dart';
import '../widgets/primary_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppbar(
        title: "Settings Page",
        actions: [
          IconButton(
            onPressed: () =>
                BlocProvider.of<LoginViewModel>(context).logout(context),
            color: Colors.white,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputUrlComponent(),
            SizedBox(height: deviceHeight * 0.2),
            AccessNetworkDevicesComponent(),
          ],
        ),
      ),
    );
  }
}

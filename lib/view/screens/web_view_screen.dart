import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../view_model/settings_view_model/settings_states.dart';
import '../../view_model/settings_view_model/settings_view_model.dart';
import '../widgets/primary_appbar.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({required this.url, Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    BlocProvider.of<SettingsViewModel>(context).setLoadingState(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(title: "Web View Page"),
      body: Stack(
        children: [
          WebView(
            onPageFinished: (_) {
              BlocProvider.of<SettingsViewModel>(context)
                  .setLoadingState(false);
            },
            javascriptMode: JavascriptMode.unrestricted,
            backgroundColor: Colors.white,
            initialUrl: widget.url,
          ),
          BlocBuilder<SettingsViewModel, SettingsStates>(
            builder: (context, state) =>
                state is SettingsLoadingState && state.isLoading
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : Container(),
          )
        ],
      ),
    );
  }
}

abstract class SettingsStates {}

class SettingsInitialState extends SettingsStates {}

class SettingsLoadingState extends SettingsInitialState {
  final bool isLoading;

  SettingsLoadingState(this.isLoading);
}

class ScanningState extends SettingsStates {}

class StoppedScanningState extends SettingsStates {}

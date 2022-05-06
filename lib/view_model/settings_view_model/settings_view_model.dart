import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_states.dart';

class SettingsViewModel extends Cubit<SettingsStates> {
  SettingsViewModel() : super(SettingsInitialState());

  void setLoadingState(bool loadingState) {
    emit(SettingsLoadingState(loadingState));
  }
}

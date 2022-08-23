import 'package:bloc/bloc.dart';

part 'panel_state.dart';

class PanelCubit extends Cubit<PanelState> {
  PanelCubit() : super(const PanelState(isPanelOpened: false));

  void openPanel() {
    return emit(PanelState(isPanelOpened: !state.isPanelOpened));
  }

  void closePanel() {
    return emit(PanelState(isPanelOpened: !state.isPanelOpened));
  }
}
//   PanelCubit(super.initialState);
// }

// class PanelCubit extends Cubit<PanelState> {
//   // final PanelService panelService;
//   PanelCubit() : super(const PanelClosedState(isPanelOpened: false));

//   void onPanelOpened() {
//     emit(PanelOpenedState(isPanelOpened: !state.isPanelOpened));
//   }

//   void onPanelClosed() {
//     emit(PanelClosedState(isPanelOpened: !state.isPanelOpened));
//   }
// }

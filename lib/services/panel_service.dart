class PanelService {
  static final PanelService _instance = PanelService._internal();

  // passes the instantiation to the _instance object
  factory PanelService() => _instance;

  //initialize variables in here
  PanelService._internal() {
    _isPanelOpened = false;
  }

  late bool _isPanelOpened;

  bool get isPanelOpened => _isPanelOpened;

  void reverse() => !_isPanelOpened;
}

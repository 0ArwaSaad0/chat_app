import 'package:chat/shared/component/alert_dialog.dart';
import 'package:flutter/widgets.dart';

abstract class BaseNavigator {
  void showLoading();
  void showMessage(String message, [String ptn]);
  void hideLoading();
}

class BaseViewModel<NAV extends BaseNavigator>extends ChangeNotifier {
NAV? navigator=null;
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;
  VM initViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = initViewModel();
  }
  @override
  void hideLoading() {
    HideLoading(context);

  }

  @override
  void showLoading() {
    ShowLoading(context, 'Loading.............');
  }

  @override
  void showMessage(String message,[String ptn=""]) {
    ShowMessage(context, message, ptn, () {
      Navigator.pop(context);
    });
  }
}

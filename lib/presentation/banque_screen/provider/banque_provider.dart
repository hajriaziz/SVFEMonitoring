import 'package:flutter/material.dart';
import '../models/banque_model.dart';

/// A provider class for the BanqueScreen.
///
/// This provider manages the state of the BanqueScreen, including the
/// current banqueModelobj

// ignore_for_file: must_be_immutable
class BanqueProvider extends ChangeNotifier {
  BanqueModel banqueModelObj = BanqueModel();
  @override
  void dispose() {
    super.dispose();
  }
}

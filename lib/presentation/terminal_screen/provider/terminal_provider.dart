import 'package:flutter/material.dart';
import '../models/terminal_model.dart';

/// A provider class for the TerminalScreen.
///
/// This provider manages the state of the TerminalScreen, including the
/// current terminalModelobj

// ignore_for_file: must_be_immutable
class TerminalProvider extends ChangeNotifier {
  TerminalModel terminalModelObj = TerminalModel();
  @override
  void dispose() {
    super.dispose();
  }
}

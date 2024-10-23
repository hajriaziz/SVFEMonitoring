import 'package:flutter/material.dart';

import '../models/transaction_model.dart';

/// A provider class for the TransactionScreen.
///
/// This provider manages the state of the TransactionScreen, including the
/// current transactionModelObj

// ignore_for_file: must_be_immutable
class TransactionProvider extends ChangeNotifier {
  TransactionModel transactiosiodelObj = TransactionModel();
  @override
  void dispose() {
    super.dispose();
  }
}

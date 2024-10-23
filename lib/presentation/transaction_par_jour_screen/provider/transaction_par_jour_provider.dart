import 'package:flutter/material.dart';
import '../models/transaction_par_jour_model.dart';

/// A provider class for the TransactionPar JourScreen.
///
/// This provider manages the state of the TransactionParJourScreen, including the
/// current transactionPar JourModelobj

// ignore_for_file: must_be_immutable
class TransactionParJourProvider extends ChangeNotifier {
  TransactionParJourModel transactionParJourModelObj =
      TransactionParJourModel();

  @override
  void dispose() {
    super.dispose();
  }
}

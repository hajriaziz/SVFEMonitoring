import 'listtitle_item_model.dart';

// ignore_for_file: must_be_immutable
class TransactionModel {
  List<ListtitleItemModel> listtitleItemList = [
    ListtitleItemModel(
        title: "Transactions", additionalText: "Autorisées", percentage: "78%"),
    ListtitleItemModel(
        title: "Transactions",
        additionalText: "Non autorisées",
        percentage: "22%")
  ];
}

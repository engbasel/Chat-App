import '../Constans.dart';

class MassageModel {
  final String MassageText;
  String id;
  MassageModel(this.MassageText, this.id);
  factory MassageModel.fromJson(jsonData) {
    return MassageModel(
      jsonData[KMassageSendTo_db],
      jsonData[Kid],
    );
  }
}

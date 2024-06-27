import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Copuon {
  Copuon({required this.description, required this.points_required})
      : id = uuid.v4();
  final String id;
  final String description;
  final int points_required;

  factory Copuon.fromJson(Map<String, dynamic> json) {
    return Copuon(
        description: json['name'], points_required: json['points_required']);
  }
}

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Donor {
  Donor(
      {required this.name,
      required this.location,
      required this.image,
      required this.bloodType})
      : id = uuid.v4();
  final String id;
  final String name;
  final String location;
  final String image;
  final String bloodType;
}

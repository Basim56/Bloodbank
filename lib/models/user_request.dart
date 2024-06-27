class UserRequest {
  final String city;
  final String hospital;
  final String bloodType;
  final String mobileNo;

  UserRequest({
    required this.city,
    required this.hospital,
    required this.bloodType,
    required this.mobileNo,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      city: json['city'],
      hospital: json['hospital'],
      bloodType: json['blood_type'],
      mobileNo: json['mobile_no'],
    );
  }
}

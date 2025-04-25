class PatientEntitiy {

  final String name;

  final String phone;
  final String address;
  final String job;
  final String age;
  final String gender;

  PatientEntitiy({

    required this.name,
    required this.phone,
    required this.address,
    required this.job,
    required this.age,
    required this.gender,

  });

  Map<String, dynamic> Tomap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'job': job,
      'age': age,
      'gender': gender,
    };
  }

  factory PatientEntitiy.fromJson(Map<String, dynamic> json) {
    return PatientEntitiy(

      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      job: json['job'] as String,
      age: json['age'] as String,
      gender: json['gender'] as String,

    );
  }
}

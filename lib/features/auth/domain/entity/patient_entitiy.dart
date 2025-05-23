class PatientEntitiy {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String job;
  final int age;
  final String gender;

  PatientEntitiy( {
required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.job,
    required this.age,
    required this.gender,

  });

  Map<String, dynamic> Tomap() {
    return {
      "id": id,
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
      age: json['age'] as int,
      gender: json['gender'] as String,
       id:  json['id']as String,

    );
  }
}

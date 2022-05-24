class Lecturer {
  final String name, secondName, thirdName, email;

//<editor-fold desc="Data Methods">

  const Lecturer({
    required this.name,
    required this.secondName,
    required this.thirdName,
    required this.email,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lecturer &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          secondName == other.secondName &&
          thirdName == other.thirdName &&
          email == other.email);

  @override
  int get hashCode =>
      name.hashCode ^ secondName.hashCode ^ thirdName.hashCode ^ email.hashCode;

  @override
  String toString() {
    return '$secondName ${name[0]}. ${thirdName[0]}';
  }

  String shortName() {
    return '$secondName ${name[0]}. ${thirdName[0]}';
  }

  String fullName() {
    return '$secondName $name $thirdName';
  }

  Lecturer copyWith({
    String? name,
    String? secondName,
    String? thirdName,
    String? email,
  }) {
    return Lecturer(
      name: name ?? this.name,
      secondName: secondName ?? this.secondName,
      thirdName: thirdName ?? this.thirdName,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'secondName': this.secondName,
      'thirdName': this.thirdName,
      'email': this.email,
    };
  }

  factory Lecturer.fromMap(Map<String, dynamic> map) {
    return Lecturer(
      name: map['name'] as String,
      secondName: map['secondName'] as String,
      thirdName: map['thirdName'] as String,
      email: map['email'] as String,
    );
  }

//</editor-fold>
}
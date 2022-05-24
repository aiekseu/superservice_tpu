class SubjectAttestation {
  final String id;
  final String name;

//<editor-fold desc="Data Methods">

  const SubjectAttestation({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectAttestation &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return name;
  }

  SubjectAttestation copyWith({
    String? id,
    String? name,
  }) {
    return SubjectAttestation(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory SubjectAttestation.fromMap(Map<String, dynamic> map) {
    return SubjectAttestation(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}
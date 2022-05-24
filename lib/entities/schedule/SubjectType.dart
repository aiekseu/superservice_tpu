class SubjectType {
  final String id;
  final String type;

//<editor-fold desc="Data Methods">

  const SubjectType({
    required this.id,
    required this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubjectType &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type);

  @override
  int get hashCode => id.hashCode ^ type.hashCode;

  @override
  String toString() {
    return type;
  }

  SubjectType copyWith({
    String? id,
    String? type,
  }) {
    return SubjectType(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'type': this.type,
    };
  }

  factory SubjectType.fromMap(Map<String, dynamic> map) {
    return SubjectType(
      id: map['id'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}
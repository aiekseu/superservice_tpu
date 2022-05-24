import 'package:superservice_tpu/entities/schedule/SubjectAttestation.dart';
import 'package:superservice_tpu/entities/schedule/SubjectType.dart';

class Subject {
  final String id, name, shortName;
  final SubjectType type;
  final SubjectAttestation attestation;

//<editor-fold desc="Data Methods">

  const Subject({
    required this.id,
    required this.name,
    required this.shortName,
    required this.type,
    required this.attestation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          shortName == other.shortName &&
          type == other.type &&
          attestation == other.attestation);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      shortName.hashCode ^
      type.hashCode ^
      attestation.hashCode;

  @override
  String toString() {
    return shortName;
  }

  Subject copyWith({
    String? id,
    String? name,
    String? shortName,
    SubjectType? type,
    SubjectAttestation? attestation,
  }) {
    return Subject(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      type: type ?? this.type,
      attestation: attestation ?? this.attestation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'shortName': this.shortName,
      'type': this.type,
      'attestation': this.attestation,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id'] as String,
      name: map['name'] as String,
      shortName: map['shortName'] as String,
      type: map['type'] as SubjectType,
      attestation: map['attestation'] as SubjectAttestation,
    );
  }

//</editor-fold>
}
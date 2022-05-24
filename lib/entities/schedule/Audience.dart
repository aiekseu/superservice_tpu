class Audience {

  final String building;
  final String audience;

//<editor-fold desc="Data Methods">

  const Audience({
    required this.building,
    required this.audience,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Audience &&
          runtimeType == other.runtimeType &&
          building == other.building &&
          audience == other.audience);

  @override
  int get hashCode => building.hashCode ^ audience.hashCode;

  @override
  String toString() {
    return 'к. $building, ауд. $audience';
  }

  Audience copyWith({
    String? building,
    String? audience,
  }) {
    return Audience(
      building: building ?? this.building,
      audience: audience ?? this.audience,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'building': this.building,
      'audience': this.audience,
    };
  }

  factory Audience.fromMap(Map<String, dynamic> map) {
    return Audience(
      building: map['building'] as String,
      audience: map['audience'] as String,
    );
  }

//</editor-fold>
}
class SchedulePosition {
  final int position;

//<editor-fold desc="Data Methods">

  const SchedulePosition({
    required this.position,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SchedulePosition &&
          runtimeType == other.runtimeType &&
          position == other.position);

  @override
  int get hashCode => position.hashCode;

  String timeStart() {
    switch (position) {
      case 1: return '8:30';
      case 2: return '10:25';
      case 3: return '12:40';
      case 4: return '14:35';
      case 5: return '16:30';
      case 6: return '18:25';
      case 7: return '20:20';
      case 8: return '22:15';
      default: return '-';
    }
  }

  String timeEnd() {
    switch (position) {
      case 1: return '10:05';
      case 2: return '12:00';
      case 3: return '14:15';
      case 4: return '16:10';
      case 5: return '18:05';
      case 6: return '20:00';
      case 7: return '21:55';
      case 8: return '23:50';
      default: return '-';
    }
  }

  SchedulePosition copyWith({
    int? position,
  }) {
    return SchedulePosition(
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'position': this.position,
    };
  }

  factory SchedulePosition.fromMap(Map<String, dynamic> map) {
    return SchedulePosition(
      position: map['position'] as int,
    );
  }

//</editor-fold>
}
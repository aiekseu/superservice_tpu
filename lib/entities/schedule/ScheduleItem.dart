import 'package:superservice_tpu/entities/schedule/Audience.dart';
import 'package:superservice_tpu/entities/schedule/Lecturer.dart';
import 'package:superservice_tpu/entities/schedule/SchedulePosition.dart';
import 'package:superservice_tpu/entities/schedule/Subject.dart';
import 'package:xid/xid.dart';

class ScheduleItem {

  final String id;
  bool isHidden = false;
  final Subject subject;
  final Audience location;
  final Lecturer lecturer;
  final SchedulePosition position;
  final String type;
  final DateTime date;

//<editor-fold desc="Data Methods">

  ScheduleItem({
    required this.id,
    required this.subject,
    required this.location,
    required this.lecturer,
    required this.position,
    required this.type,
    required this.date,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScheduleItem &&
          runtimeType == other.runtimeType &&
          subject == other.subject &&
          location == other.location &&
          lecturer == other.lecturer &&
          position == other.position &&
          isHidden == other.isHidden &&
          type == other.type &&
          date == other.date);

  @override
  int get hashCode =>
      subject.hashCode ^
      location.hashCode ^
      lecturer.hashCode ^
      position.hashCode ^
      isHidden.hashCode ^
      type.hashCode ^
      date.hashCode;

  @override
  String toString() {
    return 'ScheduleItem{' +
        ' subject: $subject,' +
        ' id: $id,' +
        ' location: $location,' +
        ' lecturer: $lecturer,' +
        ' position: $position,' +
        ' isHidden: $isHidden,' +
        ' type: $type,' +
        ' date: $date,' +
        '}';
  }

  ScheduleItem copyWith({
    String? id,
    Subject? subject,
    Audience? location,
    Lecturer? lecturer,
    SchedulePosition? position,
    bool? isHidden,
    String? type,
    DateTime? date,
  }) {
    return ScheduleItem(
      id: id ?? this.id,
      subject: subject ?? this.subject,
      location: location ?? this.location,
      lecturer: lecturer ?? this.lecturer,
      position: position ?? this.position,
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'subject': this.subject,
      'location': this.location,
      'lecturer': this.lecturer,
      'position': this.position,
      'type': this.type,
      'date': this.date,
    };
  }

  factory ScheduleItem.fromMap(Map<String, dynamic> map) {
    return ScheduleItem(
      id: map['id'] as String,
      subject: map['subject'] as Subject,
      location: map['location'] as Audience,
      lecturer: map['lecturer'] as Lecturer,
      position: map['position'] as SchedulePosition,
      type: map['type'] as String,
      date: map['date'] as DateTime,
    );
  }

//</editor-fold>
}
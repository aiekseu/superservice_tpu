import 'package:superservice_tpu/entities/schedule/Audience.dart';
import 'package:superservice_tpu/entities/schedule/Lecturer.dart';
import 'package:superservice_tpu/entities/schedule/ScheduleItem.dart';
import 'package:superservice_tpu/entities/schedule/SchedulePosition.dart';
import 'package:superservice_tpu/entities/schedule/Subject.dart';
import 'package:superservice_tpu/entities/schedule/SubjectAttestation.dart';
import 'package:superservice_tpu/entities/schedule/SubjectType.dart';
import 'package:xid/xid.dart';

final List<Lecturer> mockLecturers = [
  new Lecturer(name: 'Вероника', secondName: 'Соколова', thirdName: 'Валерьевна', email: 'vvs@tpu.ru'),
  new Lecturer(name: 'Анастасия', secondName: 'Кайда', thirdName: 'Юрьевна', email: 'ayk13@tpu.ru'),
  new Lecturer(name: 'Александр', secondName: 'Поляков', thirdName: 'Николаевич', email: 'anp@tpu.ru'),
];


final List<SubjectType> mockSubjectTypes = [
  new SubjectType(id: Xid().toString(), type: 'Основная дисциплина'),
   new SubjectType(id: Xid().toString(), type: 'Элективная дисциплина'),
   new SubjectType(id: Xid().toString(), type: 'Модуль доп. специализации'),
];

final List<SubjectAttestation> mockAttestations = [
  new SubjectAttestation(id: Xid().toString(), name: 'Экзамен'),
  new SubjectAttestation(id: Xid().toString(), name: 'Зачет'),
  new SubjectAttestation(id: Xid().toString(), name: 'Диф. зачет'),
  new SubjectAttestation(id: Xid().toString(), name: 'Курсовой проект'),
];

final List<SchedulePosition> mockSchedulePositions = [
  new SchedulePosition(position: 1),
  new SchedulePosition(position: 2),
  new SchedulePosition(position: 3),
  new SchedulePosition(position: 4),
  new SchedulePosition(position: 5),
  new SchedulePosition(position: 6),
  new SchedulePosition(position: 7),
  new SchedulePosition(position: 8),
];

final List<Audience> mockAudiences = [
  new Audience(building: '10', audience: '103'),
  new Audience(building: '10', audience: '110'),
  new Audience(building: '10', audience: '201'),
  new Audience(building: '10', audience: '205'),
  new Audience(building: '10', audience: '111'),
  new Audience(building: '10', audience: '219'),
];

final List<Subject> mockSubjects = [
  new Subject(id: '1', name: 'Профессиональная подготовка на английском языке', shortName: 'Проф. подг. на АЯ', type: mockSubjectTypes[0], attestation: mockAttestations[0]),
  new Subject(id: '2', name: 'Управление программными проктами', shortName: 'Упр. прогр. проек.', type: mockSubjectTypes[1], attestation: mockAttestations[1]),
  new Subject(id: '3', name: 'Междисциплинарный проект', shortName: 'Междисц. проект ', type: mockSubjectTypes[0], attestation: mockAttestations[3]),
  new Subject(id: '4', name: 'Проектирование информационных систем', shortName: 'Проектирован. ИС ', type: mockSubjectTypes[0], attestation: mockAttestations[0]),
  new Subject(id: '5', name: 'Технологии облачных вычислений в бизнесе', shortName: 'Тхи облачн.выч.бизн.', type: mockSubjectTypes[0], attestation: mockAttestations[1]),
];

DateTime now = new DateTime.now();
DateTime date = new DateTime(now.year, now.month, now.day);

final List<ScheduleItem> mockSchedule = [
  new ScheduleItem(id: '1', subject: mockSubjects[0], location: mockAudiences[0], lecturer: mockLecturers[0], position: mockSchedulePositions[0], type: 'Лекция', date: date),
  new ScheduleItem(id: '2', subject: mockSubjects[2], location: mockAudiences[2], lecturer: mockLecturers[0], position: mockSchedulePositions[2], type: 'Практика', date: date),
  new ScheduleItem(id: '3', subject: mockSubjects[3], location: mockAudiences[3], lecturer: mockLecturers[0], position: mockSchedulePositions[3], type: 'Практика', date: date),
  new ScheduleItem(id: '4', subject: mockSubjects[1], location: mockAudiences[1], lecturer: mockLecturers[0], position: mockSchedulePositions[1], type: 'Лабораторная', date: date),
  new ScheduleItem(id: '5', subject: mockSubjects[4], location: mockAudiences[4], lecturer: mockLecturers[0], position: mockSchedulePositions[2], type: 'Лабораторная', date: date.add(Duration(days: 1))),
  new ScheduleItem(id: '6', subject: mockSubjects[0], location: mockAudiences[5], lecturer: mockLecturers[0], position: mockSchedulePositions[3], type: 'Лабораторная', date: date.add(Duration(days: 1))),
  new ScheduleItem(id: '66', subject: mockSubjects[0], location: mockAudiences[5], lecturer: mockLecturers[0], position: mockSchedulePositions[4], type: 'Лабораторная', date: date.add(Duration(days: 1))),
  new ScheduleItem(id: '7', subject: mockSubjects[0], location: mockAudiences[0], lecturer: mockLecturers[1], position: mockSchedulePositions[2], type: 'Практика', date: date.add(Duration(days: 6))),
  new ScheduleItem(id: '8', subject: mockSubjects[2], location: mockAudiences[1], lecturer: mockLecturers[1], position: mockSchedulePositions[5], type: 'Лекция', date: date.add(Duration(days: 6))),
  new ScheduleItem(id: '9', subject: mockSubjects[4], location: mockAudiences[2], lecturer: mockLecturers[1], position: mockSchedulePositions[5], type: 'Практика', date: date.add(Duration(days: 2))),
  new ScheduleItem(id: '10', subject: mockSubjects[3], location: mockAudiences[3], lecturer: mockLecturers[1], position: mockSchedulePositions[0], type: 'Лабораторная', date: date.add(Duration(days: 5))),
  new ScheduleItem(id: '11', subject: mockSubjects[1], location: mockAudiences[4], lecturer: mockLecturers[1], position: mockSchedulePositions[1], type: 'Лекция', date: date.add(Duration(days: 2))),
  new ScheduleItem(id: '12', subject: mockSubjects[1], location: mockAudiences[5], lecturer: mockLecturers[2], position: mockSchedulePositions[2], type: 'Практика', date: date.add(Duration(days: 3))),
  new ScheduleItem(id: '13', subject: mockSubjects[3], location: mockAudiences[0], lecturer: mockLecturers[2], position: mockSchedulePositions[3], type: 'Лабораторная', date: date.add(Duration(days: 7))),
  new ScheduleItem(id: '14', subject: mockSubjects[2], location: mockAudiences[1], lecturer: mockLecturers[2], position: mockSchedulePositions[2], type: 'Лабораторная', date: date.add(Duration(days: 3))),
  new ScheduleItem(id: '15', subject: mockSubjects[0], location: mockAudiences[2], lecturer: mockLecturers[1], position: mockSchedulePositions[6], type: 'Практика', date: date.add(Duration(days: 5))),
  new ScheduleItem(id: '16', subject: mockSubjects[0], location: mockAudiences[3], lecturer: mockLecturers[1], position: mockSchedulePositions[4], type: 'Практика', date: date.add(Duration(days: 7))),
  new ScheduleItem(id: '17', subject: mockSubjects[1], location: mockAudiences[4], lecturer: mockLecturers[1], position: mockSchedulePositions[2], type: 'Лабораторная', date: date.add(Duration(days: 6))),
  new ScheduleItem(id: '18', subject: mockSubjects[2], location: mockAudiences[5], lecturer: mockLecturers[0], position: mockSchedulePositions[3], type: 'Лекция', date: date.add(Duration(days: 4))),
  new ScheduleItem(id: '19', subject: mockSubjects[4], location: mockAudiences[0], lecturer: mockLecturers[0], position: mockSchedulePositions[0], type: 'Лекция', date: date.add(Duration(days: 4))),
  new ScheduleItem(id: '20', subject: mockSubjects[3], location: mockAudiences[1], lecturer: mockLecturers[0], position: mockSchedulePositions[1], type: 'Лабораторная', date: date.add(Duration(days: 5))),
];
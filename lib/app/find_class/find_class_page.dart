import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:superservice_tpu/services/floorplans.dart';

class FindClassPage extends StatefulWidget {
  const FindClassPage({Key? key}) : super(key: key);

  @override
  State<FindClassPage> createState() => _FindClassPageState();
}

class _FindClassPageState extends State<FindClassPage> {
  TextEditingController classNumController = new TextEditingController();
  String _currentClass = '';
  List<String> _options = [
    'к. 10, ауд. 103',
    'к. 10, ауд. 203',
    'к. 10, ауд. 208',
    'к. 10, ауд. 104',
    'к. 10, ауд. 111',
    'к. 10, ауд. 213',
    'к. 10, ауд. 222',
    'к. 10, ауд. 122',
    'к. 10, ауд. 123',
  ];

  final _floorPlans = new FloorPlans();

  String _getSvg() {
    if (_currentClass == '') return '';
    return _floorPlans.getClassLocationSvg(_currentClass);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Найти аудиторию'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.0),
              Text(
                'Выберите аудиторию для поиска',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              Autocomplete(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _options.where((String option) {
                    return option
                        .toString()
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  setState(() {
                    _currentClass = selection;
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  Chip(label: Text('корпус 10')),
                  Chip(label: Text('аудитория 104')),
                ],
              ),
              Container(
                  child: SvgPicture.string(_getSvg()),
                  height: MediaQuery.of(context).size.height / 4),
            ],
          ),
        ),
      ),
    );
  }
}

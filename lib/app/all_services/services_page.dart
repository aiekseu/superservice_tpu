import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/all_services/widgets/service_card.dart';
import 'package:superservice_tpu/app/auth/auth_page.dart';
import 'package:superservice_tpu/app/find_class/find_class_page.dart';
import 'package:superservice_tpu/services/enums.dart';

import '../top_level_providers.dart';

class ServicesPage extends ConsumerWidget {
  const ServicesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _currentPage = ref.watch(activePage.state);

    return SafeArea(
      child: ListView(
        children: [
          SizedBox(height: 24),
          Center(
            child: Text(
              'Сервисы',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            child: TextField(
              keyboardType: TextInputType.text,
              maxLines: 1,
              minLines: 1,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Поиск',
                labelStyle: const TextStyle(color: Colors.grey),
                floatingLabelStyle: const TextStyle(color: Colors.grey),
                contentPadding: EdgeInsets.only(top: 4.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
              ),
            ),
          ),

          /// Главные сервисы
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                /// Расписание
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Расписание',
                    imagePath: 'assets/services/schedule.png',
                    onClick: () {
                      _currentPage.state = Pages.schedule;
                    },
                  ),
                ),

                /// Найти аудиторию
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Найти аудиторию',
                    imagePath: 'assets/services/findClass.png',
                    onClick: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => FindClassPage()));
                    },
                  ),
                ),

                /// Мероприятия
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Мероприятия',
                    imagePath: 'assets/services/activities.png',
                    onClick: () {
                      /// если не авторизован
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => AuthPage()));
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                /// Успеваемость
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Успеваемость',
                    imagePath: 'assets/services/academicPerformance.png',
                    small: true,
                    onClick: () {},
                  ),
                ),

                /// Тестирования
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Тестирования',
                    imagePath: 'assets/services/tests.png',
                    small: true,
                    disabled: true,
                    onClick: () {},
                  ),
                ),

                /// Учебный план
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Учебный план',
                    imagePath: 'assets/services/curriculum.png',
                    small: true,
                    onClick: () {},
                  ),
                ),

                /// Стипендия
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Стипендия',
                    imagePath: 'assets/services/scholarship.png',
                    small: true,
                    onClick: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Row(
              children: [
                /// Деканат
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Деканат',
                    imagePath: 'assets/services/decanat.png',
                    small: true,
                    disabled: true,
                    onClick: () {},
                  ),
                ),

                /// FAQ
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'FAQ',
                    imagePath: 'assets/services/faq.png',
                    small: true,
                    disabled: true,
                    onClick: () {},
                  ),
                ),

                /// Flamingo
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Flamingo',
                    imagePath: 'assets/services/flamingo.png',
                    small: true,
                    disabled: true,
                    onClick: () {},
                  ),
                ),

                /// Библиотека
                Expanded(
                  flex: 1,
                  child: ServiceCard(
                    name: 'Библиотека',
                    imagePath: 'assets/services/library.png',
                    small: true,
                    disabled: true,
                    onClick: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              'Сегодня будет 3 пары, четная неделя',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

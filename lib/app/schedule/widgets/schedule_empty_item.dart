import 'package:flutter/material.dart';
import 'package:superservice_tpu/entities/schedule/SchedulePosition.dart';

class ScheduleEmptyItem extends StatelessWidget {
  const ScheduleEmptyItem({Key? key, required this.position}) : super(key: key);

  final SchedulePosition position;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            /// Время
            Container(
              /// Полоска справа
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.green, width: 2.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      position.timeStart(),
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      position.timeEnd(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 230, 230, 230),
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 0.5,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                    child: Text(position.position.toString() + '. Окно'),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

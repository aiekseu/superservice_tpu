import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ndialog/ndialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superservice_tpu/entities/schedule/ScheduleItem.dart';
import 'package:superservice_tpu/services/floorplans.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleItemCard extends ConsumerStatefulWidget {
  const ScheduleItemCard({Key? key, required this.scheduleItem})
      : super(key: key);

  final ScheduleItem scheduleItem;

  @override
  ScheduleItemCardState createState() => ScheduleItemCardState();
}

class ScheduleItemCardState extends ConsumerState<ScheduleItemCard> {
  @override
  void initState() {
    super.initState();
    // this.svg = '';
    this.svg = new FloorPlans()
        .getClassLocationSvgBy2Params(widget.scheduleItem.location.building, widget.scheduleItem.location.audience);
  }

  String svg = '';
  bool _expanded = false;

  void _showMore() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  _handleLongPress() async {
    var result = await NAlertDialog(
      dialogStyle: DialogStyle(
        titleDivider: true,
        borderRadius: BorderRadius.circular(6.0),
      ),
      content: _dialogContent(),
      blur: 1.5,
    ).show(
      context,
      transitionType: DialogTransitionType.Shrink,
      transitionDuration: Duration(milliseconds: 150),
    );
    print(result);
  }

  /// Диалог при долгом клике
  Widget _dialogContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            'Вы собираетесь скрыть',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        Divider(),

        /// Информация о паре, которую скрывают
        IntrinsicHeight(
          child: Row(
            children: [
              Container(
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
                        widget.scheduleItem.position.timeStart(),
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        widget.scheduleItem.position.timeEnd(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 2.0),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${widget.scheduleItem.position.position}.'),
                            SizedBox(width: 8.0),
                            Text(widget.scheduleItem.type),
                          ],
                        ),
                        Text(
                          widget.scheduleItem.subject.shortName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          widget.scheduleItem.lecturer.shortName(),
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(widget.scheduleItem.location.toString()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),

        /// Опции
        ListButton(
          text: 'Только эту пару',
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();

            var hashes = prefs.getStringList('bannedHashes') ?? <String>[''];
            hashes.add(widget.scheduleItem.hashCode.toString());
            await prefs.setStringList('bannedHashes', hashes);

            Navigator.pop(context, 0);
          },
        ),
        Divider(height: 1),
        ListButton(
          text: 'Эту пару на каждой неделе',
          onTap: () {
            Navigator.pop(context, 1);
          },
        ),
        Divider(height: 1),
        ListButton(
          text: 'Только лекции',
          onTap: () {
            Navigator.pop(context, 2);
          },
        ),
        Divider(height: 1),
        ListButton(
          text: 'Всю дисциплину',
          onTap: () {
            Navigator.pop(context, 3);
          },
        ),
        Divider(height: 1),
      ],
    );
  }

  /// Доп. инфармация при разворачивании карточки пары
  Widget _additionalInfo() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Тип дисциплины (основвная, электив)
              Text(widget.scheduleItem.subject.type.type),
              /// Почта лектора
              Text(widget.scheduleItem.lecturer.email),
            ],
          ),
          SizedBox(height: 4.0),
          /// Тип аттестации на дисциплине
          Text(widget.scheduleItem.subject.attestation.name),
          SizedBox(height: 8.0),
          Container(
            child: SvgPicture.string(svg),
            height: MediaQuery.of(context).size.height / 4.5,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: const Size.fromHeight(36),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.note_add_outlined),
                SizedBox(width: 8.0),
                Text('Добаить заметку'),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// Карточка пары
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
                      widget.scheduleItem.position.timeStart(),
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      widget.scheduleItem.position.timeEnd(),
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 6),

            /// Инфа о паре
            Expanded(
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: _showMore,
                  onLongPress: _handleLongPress,
                  splashColor: Colors.green.withAlpha(30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -12,
                          right: -8,
                          child: IconButton(
                            icon: Icon(Icons.more_horiz),
                            splashColor: Colors.green.withAlpha(30),
                            splashRadius: 20.0,
                            onPressed: _handleLongPress,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Номер пары и тип
                            Text(widget.scheduleItem.position.position.toString() +
                                '.  ' +
                                widget.scheduleItem.type),

                            /// Название пары
                            Text(
                              widget.scheduleItem.subject.shortName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                decoration: widget.scheduleItem.isHidden ? TextDecoration.lineThrough : TextDecoration.none,
                              ),
                            ),

                            /// Лектор
                            Text(
                              _expanded
                                  ? widget.scheduleItem.lecturer.fullName()
                                  : widget.scheduleItem.lecturer.shortName(),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 8.0),

                            /// Местоположение пары
                            Text(widget.scheduleItem.location.toString()),

                            /// Дополнительная инф. при раскрытии
                            if (_expanded) _additionalInfo(),
                            Container(
                              width: double.infinity,
                              child: Center(
                                child: Icon(
                                  _expanded
                                      ? Icons.expand_less
                                      : Icons.expand_more,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Виджет для опций меню
class ListButton extends StatefulWidget {
  final Function onTap;
  final String text;

  const ListButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: (_) {
        setState(() {
          _hover = true;
        });
      },
      onTapCancel: () {
        setState(() {
          _hover = false;
        });
      },
      child: Container(
        width: double.infinity,
        color: _hover ? Colors.green.withAlpha(20) : Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}

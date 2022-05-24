import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final Function onClick;
  final bool small;
  final bool disabled;

  const ServiceCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.onClick,
    this.small = false,
    this.disabled = false,
  }) : super(key: key);

  static const ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0.2126, 0.7152, 0.0722, 0, 0,
    0,      0,      0,      1, 0,
  ]);

  static const ColorFilter normal = ColorFilter.mode(Colors.transparent, BlendMode.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: GestureDetector(
            onTap: () => onClick(),
            child: ColorFiltered(
              colorFilter: disabled ? greyscale : normal,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 6.0),
        Text(
          name,
          maxLines: 1,
          style: TextStyle(fontSize: small ? 12 : 14),
        ),
      ],
    );
  }
}

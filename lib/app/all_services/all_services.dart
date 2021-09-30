import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superservice_tpu/app/top_level_providers.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Consumer(
            builder: (context, watch, child) {
              final state = watch(userGroupProvider);
              return Text(state);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:greg_van_berkel/constants/routes.dart';

import 'home_logic.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final logic = watch(homeScreenProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.lightGreen[200],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text('Please request a specific version of this document.'),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        'Alternatively you can visit the most recent generic version '),
                    TextButton(
                      onPressed: () => logic.navigate(Routes.g21),
                      child: Text('here.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

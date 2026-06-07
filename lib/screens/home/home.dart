import 'package:flutter/material.dart';
import 'package:flutter_slick/navigation/view_model_widget.dart';
import 'package:greg_van_berkel/constants/routes.dart';

import 'home_logic.dart';

class HomeScreen extends ViewModelWidget<HomeScreenLogic> {
  HomeScreen({super.key});

  @override
  HomeScreenLogic createViewModel() => HomeScreenLogic();

  @override
  Widget buildView(BuildContext context) {
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
                Wrap(
                  children: [
                    Text('Please request a specific version of this document.'),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'Alternatively you can view a generic version:',
                    ),
                    TextButton(
                      onPressed: () => vm.navigation.goTo(const G26Route()),
                      child: Text('2026'),
                    ),
                    Text('or'),
                    TextButton(
                      onPressed: () => vm.navigation.goTo(const G21Route()),
                      child: Text('2021.'),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_screen_view_model.dart';
          
class HomeScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      builder: (BuildContext context, HomeScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('HomeScreen View'),
          ),
        );
      },
      viewModelBuilder: () => HomeScreenViewModel(),
    );
  }
}

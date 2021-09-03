import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'credit_card_screen_view_model.dart';
          
class CreditCardScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreditCardScreenViewModel>.reactive(
      builder: (BuildContext context, CreditCardScreenViewModel viewModel, Widget _) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('CreditCardScreen View'),
          ),
        );
      },
      viewModelBuilder: () => CreditCardScreenViewModel(),
    );
  }
}

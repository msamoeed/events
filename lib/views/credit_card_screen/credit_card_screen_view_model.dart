import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/core/locator.dart';
import 'package:events/services/firebase_auth.dart';
import 'package:events/services/stripe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:events/core/logger.dart';
import 'package:stacked_services/stacked_services.dart';

const _GetCards = 'GetCards';

class CreditCardScreenViewModel extends MultipleStreamViewModel {
  Logger log;

  final _auth = FirebaseAuth.instance;
  final dialogService = locator<DialogService>();
  final snackService = locator<SnackbarService>();
  final navService = locator<NavigationService>();

  CreditCardScreenViewModel() {
    log = getLogger(this.runtimeType.toString());
  }

  Map get fetchedCards {
    DocumentSnapshot ds = dataMap[_GetCards];
    return ds == null ? {} : ds.data();
  }

  bool get fetchingCards => busy(_GetCards);
  bool get errorFetchingCards => hasErrorForKey(_GetCards);

  Map<String, StreamData> get streamsMap => {
        _GetCards: StreamData<DocumentSnapshot>(getCardFromFirebase()),
      };

  Future saveCardToFirebase(holder, number, cvv, expiry) async {
    var thisCard = {
      'holder_name': holder,
      'card_number': number,
      'cvv': cvv,
      'expiry': expiry
    };
    /* var currUser = await AuthService.currUID;
    var currUID = currUser.uid;
    */
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .update({
      'cards': FieldValue.arrayUnion([thisCard])
    });
  }

  Stream<DocumentSnapshot> getCardFromFirebase() {
    //  var currUser = await AuthService.currUID;
    // var currUID = currUser.uid;

    return FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser.uid)
        .snapshots();
    /*
    List cards = userDoc.data()['cards'];
    print("${cards.length} cards found");
    print("Is busy :$fetchingCards");
    return cards;
    */
  }

  deleteCardFromFirebase(card) {}
  addTransactionHistory(cardNumber, reason, amount) async {
    await FirebaseFirestore.instance.collection('transactions').add({
      'card_number': cardNumber,
      'reason': reason,
      'amount': amount,
      'date': DateTime.now(),
      'uid': _auth.currentUser.uid,
    });
  }

  confirmPayment(card, {paymentDetails}) async {
    var amountInDollars = double.parse(paymentDetails['fee']).toInt();
    var amountInCents = amountInDollars * 100;
    print("Fee : ${amountInCents}");

    DialogResponse response = await dialogService.showDialog(
        title: 'Confirm Payment?',
        description:
            "\$$amountInDollars will be charged on this card.\n${card.number}\n${card.name}",
        buttonTitle: "OK",
        cancelTitle: 'Cancel');
    if (response.confirmed)
      StripeService.payViaExistingCard(
              amount: '$amountInCents', currency: 'USD', card: card)
          .then((value) {
        navService.back(result: value.success);

        snackService.showSnackbar(message: value.message);
        addTransactionHistory(
            card.number, paymentDetails['reason'], "\$$amountInDollars");
      });
  }
}

// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_stripe/flutter_stripe.dart';

Future<void> stripe(
  BuildContext context,
  String clientSecret,
) async {
  print('stripe function called with clientSecret: $clientSecret');
  Stripe.publishableKey = '${FFAppConstants.Stripe}';
  print('Publishable key set: ${Stripe.publishableKey}');

  try {
    print('Initializing payment sheet');
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        style: ThemeMode.dark,
        merchantDisplayName: 'Your Merchant Name',
      ),
    );
    print('Payment sheet initialized');

    print('Presenting payment sheet');
    await Stripe.instance.presentPaymentSheet();
    print('Payment sheet presented');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successful!')),
    );
    print('Payment successful snackbar shown');
  } on StripeException catch (stripeError) {
    print('Stripe exception occurred: ${stripeError.error.localizedMessage}');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Stripe error: ${stripeError.error.localizedMessage}')),
    );
  } catch (e) {
    print('General error occurred: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: $e')),
    );
  }
}

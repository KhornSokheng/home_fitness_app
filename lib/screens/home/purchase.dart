import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_fitness/models/user.dart';
import 'package:home_fitness/providers/user_provider.dart';
import 'package:home_fitness/screens/menu/launcher.dart';

import 'package:in_app_purchases_paywall_ui/in_app_purchases_paywall_ui.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:in_app_purchases_intl/in_app_purchases_intl.dart';
import 'package:provider/provider.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  PurchaseHandler purchaseHandler = PurchaseHandler();

  @override
  Widget build(BuildContext context) {
    final translations = PaywallL10NHelper.of(context);

    User user = Provider.of<UserProvider>(context).user;

    return Center(
      child: PaywallScaffold(
        // set a theme
        theme: Theme.of(context),
        // appBarTitle for scaffold
        appBarTitle: "Home Fitness Premium",
        child: MoritzPaywall(
            // set a theme
            // theme: Theme.of(context),
            // set a custom header
            /*headerContainer: Container(
                margin: EdgeInsets.all(16),
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: FractionalOffset.center,
                        image: AssetImage('assets/images/premium_bg.png'))),
                child: Container()),*/
            // Title Bar
            //title: "Go Premium",
            // SubTitle
            subTitle:
                "Enjoy all the advantages of YourApp with the Premium subscription.",
            continueText: "Continue",
            // Add as many bullet points as you like
            bulletPoints: [
              IconAndText(Icons.stop_screen_share_outlined, "No Ads"),
              IconAndText(Icons.hd, "Premium HD"),
              IconAndText(Icons.sort, "Access to All Premium Workouts")
            ],
            // Your subscriptions that you want to offer to the user
            subscriptionListData: [
              SubscriptionData(
                  durationTitle: translations.yearly.toTitleCase(),
                  durationShort: translations.nmonth(12),
                  price: "\$14,99",
                  highlightText: "Most popular",
                  dealPercentage: 59,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "\$",
                  rawPrice: 14.99,
                  monthText: translations.month,
                  duration: "P1Y",
                  index: 3),
              SubscriptionData(
                  durationTitle: translations.quarterly.toTitleCase(),
                  durationShort: translations.nmonth(3),
                  price: "\$8,99",
                  dealPercentage: 42,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "\$",
                  rawPrice: 8.99,
                  monthText: translations.month,
                  duration: "P3M",
                  index: 2),
              SubscriptionData(
                  durationTitle: translations.monthly.toTitleCase(),
                  durationShort: translations.nmonth(1),
                  price: "\$2,99",
                  dealPercentage: 0,
                  productDetails: "Dynamic purchase data",
                  currencySymbol: "\$",
                  rawPrice: 2.99,
                  monthText: translations.month,
                  duration: "P1M",
                  index: 1)
            ],
            // Shown if isPurchaseSuccess == true
            successTitle: "Success!!",
            // Shown if isPurchaseSuccess == true
            successSubTitle: "Thanks for choosing Premium!",
            // Widget can be anything. Shown if isPurchaseSuccess == true
            successWidget: Container(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    child: Text("Confirm Payment"),
                    onPressed: () {
                      print("let‘s go to the home widget again");

                      //update watch_history
                      final docUser = FirebaseFirestore.instance.collection('users').doc(user.id);
                      docUser.update({
                        'user_type': 'pro',

                      });

                      //update watch_history
                      final docPayment = FirebaseFirestore.instance.collection('payments').doc(user.id);
                      docPayment.set({
                        'id': docPayment.id,
                        'user_id': user.id,
                        'date': DateTime.now()

                      });

                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Launcher(docId: user.email);
                      }));

                    },
                  )
                ])),
            // set true if subscriptions are loading
            isSubscriptionLoading: false,
            // if purchase is in progress, set to true. this will show a fullscreen progress indicator
            isPurchaseInProgress: false,
            // to show the success widget
            purchaseState: PurchaseState.NOT_PURCHASED,
            // callback Interface for restore and purchase tap events. Extend DefaultPurchaseHandler
            callbackInterface: purchaseHandler,
            purchaseStateStreamInterface: purchaseHandler,
            // provide your TOS
            tosData:
                TextAndUrl("Terms of Service", "https://www.linkfive.io/tos"),
            // provide your PP
            ppData:
                TextAndUrl("Privacy Policy", "https://www.linkfive.io/privacy"),
            // add a custom campaign widget
            campaignWidget: CampaignBanner(
              theme: Theme.of(context),
              headline: "🥳 Summer Special Sale",
              subContent: Container(
                  padding: EdgeInsets.all(8),
                  child: CountdownTimer(
                    endTime: DateTime.now()
                        .add(Duration(days: 2, hours: 7))
                        .millisecondsSinceEpoch,
                  )),
            )),
      ),
    );
  }
}

class PurchaseHandler extends DefaultPurchaseHandler {
  @override
  Future<bool> purchase(SubscriptionData productDetails) async {
    print("purchase start");
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    print("purchase done");
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }

  @override
  Future<bool> restore() async {
    isPendingPurchase = true;
    await Future.delayed(Duration(seconds: 1));
    purchaseState = PurchaseState.PURCHASED;
    isPendingPurchase = false;
    return true;
  }
}

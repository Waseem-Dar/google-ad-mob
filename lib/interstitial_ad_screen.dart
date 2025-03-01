import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdScreen extends StatefulWidget {
  const InterstitialAdScreen({super.key});

  @override
  State<InterstitialAdScreen> createState() => _InterstitialAdScreenState();
}

class _InterstitialAdScreenState extends State<InterstitialAdScreen> {

  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              setState(() {
              _interstitialAd = ad;
              _interstitialAd!.show();
              });
            },
            onAdFailedToLoad: (error) {
              log("error to load Ad=======${error.message}");
              _interstitialAd!.dispose();
            },
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interstitial Ad"),
      ),
      body: Stack(
        children: [
          // if(_interstitialAd != null)
          // Align(
          //   alignment: Alignment.center,
          //   child:Container(
          //     child:  _interstitialAd.show(),
          //   ),
          // )
        ],
      ),
    );
  }
}

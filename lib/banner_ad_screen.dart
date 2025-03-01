import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdScreen extends StatefulWidget {
  const BannerAdScreen({super.key});

  @override
  State<BannerAdScreen> createState() => _BannerAdScreenState();
}

class _BannerAdScreenState extends State<BannerAdScreen> {
  BannerAd? _bannerAd;
  
  

  @override
  void initState() {
   super.initState();
    BannerAd(size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/9214589741",
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
            _bannerAd = ad as BannerAd;

            });
          },
          onAdFailedToLoad: (ad, error) {
            print("error to load add ${error.message}");
            ad.dispose();
          },
        ),
        request: AdRequest()).load();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Banner Ad"),
      ),
      body: Stack(
        children: [
          if(_bannerAd != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height:_bannerAd!.size.height.toDouble() ,
              width:_bannerAd!.size.width.toDouble() ,
              child:AdWidget(ad: _bannerAd!) ,
            ),
          )
        ],
      ),
    );
  }
}



// ca-app-pub-5508473640756327/6510252819

// ca-app-pub-5508473640756327/6428423969
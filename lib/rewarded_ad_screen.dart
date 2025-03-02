import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class RewardedAdScreen extends StatefulWidget {
  const RewardedAdScreen({super.key});

  @override
  State<RewardedAdScreen> createState() => _RewardedAdScreenState();
}

class _RewardedAdScreenState extends State<RewardedAdScreen> {
  RewardedAd? _rewardedAd;


  @override
  void initState() {
    super.initState();
    loadRewardedAd();

  }

  int score = 0;

  void loadRewardedAd(){
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) {
              setState(() {
                _rewardedAd = ad;
              });
            },
            onAdFailedToLoad: (error) {
              print("Error load to Ad ======= ${error.message}");
              _rewardedAd!.dispose();
            },
        )
    );
  }


  void showRewardedAd(){
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        print("Ad dismissed ====== ");
        _rewardedAd!.dispose();
        loadRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print("Failed to Ad show =========${error.message}");
        _rewardedAd!.dispose();
        loadRewardedAd();
      },
    );

    _rewardedAd!.show(onUserEarnedReward: (ad, reward) {
      setState(() {
        score++;
      });
    },);



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("$score"),
            ElevatedButton(onPressed: (){
              showRewardedAd();
            }, child: Text("Reward"))
          ],
        ),
      ),
    );
  }
}

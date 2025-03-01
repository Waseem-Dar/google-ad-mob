import 'package:flutter/material.dart';
import 'package:google_ad_mob/banner_ad_screen.dart';
import 'package:google_ad_mob/rewarded_ad_screen.dart';

import 'interstitial_ad_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Google Ad Mob",style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BannerAdScreen(),));
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(150, 50)
                ),
                child: Text("Banner",style: TextStyle(color: Colors.white),)),
             ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => InterstitialAdScreen(),));
             },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(150, 50)
                ),
                child: Text("Interstitial",style: TextStyle(color: Colors.white),)),
             ElevatedButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => RewardedAdScreen(),));
             },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  fixedSize: Size(150, 50)
                ),
                child: Text("Rewarded",style: TextStyle(color: Colors.white),)),

          ],
        ),
      ),
    );
  }
}

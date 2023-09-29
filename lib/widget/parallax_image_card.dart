import 'package:ayana_test/models/card_info_model.dart';
import 'package:ayana_test/parallax_flow_delegate.dart';
import 'package:flutter/material.dart';

class ParallaxImageCard extends StatelessWidget {
  ParallaxImageCard({super.key, required this.info});

  final GlobalKey _imageKey = GlobalKey();
  final CardInfoModel info;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 6),
              blurRadius: 8)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Flow(
              delegate: ParallaxFlowDelegate(
                scrollable: Scrollable.of(context),
                listItemContext: context,
                backgroundImageKey: _imageKey,
              ),
              children: [
                Image(
                  image: AssetImage(
                    info.imageAsset,
                  ), 
                  key: _imageKey,
                  height: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                // Image.asset(
                //   info.imageAsset, 
                //   key: _imageKey,
                //   height: double.infinity,
                //   fit: BoxFit.fitHeight,
                // ),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.title,
                    // "Healing Meditation",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    info.description,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/icons/right_arrow.png',
                    width: 30,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

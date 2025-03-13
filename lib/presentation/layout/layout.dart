import 'dart:ui';

import 'package:ape_nft/common_libs.dart';

class SitePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  SitePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: kDarkColor,
      key: scaffoldKey,
      appBar: context.appBar(),
      body: Stack(
        children: [
          const _SitePageBackground(),
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  const _LayoutChild1(),
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  const _LayoutChild2(),
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  const _LayoutChild3(),
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  const _LayoutChild4(),
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LayoutChild4 extends StatefulWidget {
  const _LayoutChild4({
    Key? key,
  }) : super(key: key);

  @override
  State<_LayoutChild4> createState() => _LayoutChild4State();
}

class _LayoutChild4State extends State<_LayoutChild4> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraint) {
      double maxWidth = constraint.maxWidth - 30;
      const itemCount = 3;
      const totalSpacer = 10 * 2;
      const totalWidth = (300 * itemCount) + totalSpacer;

      final double itemWidth = (maxWidth > totalWidth)
          ? 300
          : ((maxWidth - totalSpacer) / itemCount);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardWidget(
            apeNft6,
            false,
            itemWidth,
          ),
          horizontalSpaceMedium,
          cardWidget(apeNft2, true, itemWidth),
          horizontalSpaceMedium,
          cardWidget(apeNft2, false, itemWidth),
        ],
      );
    });
  }

  Widget cardWidget(
    String image,
    bool isCenter, [
    double width = 300,
  ]) {
    double percentage = width / 300;
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornersMedium),
      ),
      child: SizedBox(
        height: (isCenter ? 500 : 450) * percentage,
        width: width,
        child: Stack(
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      kDarkColor.withOpacity(.6),
                      kDarkColor.withOpacity(.8),
                      kDarkColor.withOpacity(.9),
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    verticalSpaceLarge,
                    Text(
                      'Street Punk',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: context.bodyLarge(),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Lorem Ispidium Sit Dolor Amor. Connection asdipinginunit.',
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: context.bodyMedium(color: kLightColor),
                    ),
                    verticalSpaceLarge,
                    const ApeButtom(text: 'Live'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LayoutChild3 extends StatelessWidget {
  const _LayoutChild3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: nftPlatforms
          .map(
            (image) => Padding(
              padding: const EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding / 2),
              child: Image.asset(
                image,
                color: kLightColorBold,
                width: 100,
                height: 40,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _LayoutChild1 extends StatelessWidget {
  const _LayoutChild1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'The NFT marketplace with everything for everyone',
          style: context.bodyMedium(),
        ),
        verticalSpaceLarge,
        verticalSpaceLarge,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Discover',
              style: context.bodyLarge(fontSize: 50),
            ),
            horizontalSpaceLarge,
            Container(
              width: 150,
              height: 35,
              decoration: BoxDecoration(
                color: kLightColorBold,
                borderRadius: BorderRadius.circular(cornersLarge),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                libertyStatue,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            horizontalSpaceLarge,
            Text(
              'Collect',
              style: context.bodyLarge(fontSize: 50),
            ),
          ],
        ),
        verticalSpaceMedium,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'and Sell',
              style: context.bodyLarge(fontSize: 50),
            ),
            horizontalSpaceLarge,
            Container(
              width: 200,
              height: 35,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: kLightColorBold,
                borderRadius: BorderRadius.circular(cornersLarge),
              ),
              child: Image.asset(
                background3,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        verticalSpaceMedium,
        Text(
          'Remarkable NFTs.',
          style: context.bodyLarge(fontSize: 50),
        ),
      ],
    );
  }
}

class _LayoutChild2 extends StatelessWidget {
  const _LayoutChild2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 400,
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 100,
                      child: Text(
                        'Find digital artworks by professionals and discover the true meaning of the artwork',
                        style: context.bodyMedium(),
                        textAlign: TextAlign.end,
                      )),
                  verticalSpaceLarge,
                  Container(
                    width: 200,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 200,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kLightColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(cornersLarge),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kLightColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(cornersLarge),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        horizontalSpaceLarge,
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              alignment: Alignment.centerRight,
              width: 320,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                width: 220,
                height: 300,
                decoration: BoxDecoration(
                  color: kLightColorBold,
                  borderRadius: BorderRadius.circular(cornersLarge * 4),
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      apeNft8,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 2,
              margin: const EdgeInsets.all(0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornersLarge * 4),
              ),
              child: Image.asset(
                apeNft8,
                width: 230,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        horizontalSpaceLarge,
        Expanded(
            child: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 400,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kLightColor,
                          width: 1,
                        )),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      loremIspidiumLong,
                      style: context.bodyMedium(),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kLightColor,
                        width: 1,
                      )),
                ),
              ],
            ),
          ),
        )),
      ],
    );
  }
}

class _SitePageBackground extends StatefulWidget {
  const _SitePageBackground({Key? key}) : super(key: key);

  @override
  State<_SitePageBackground> createState() => _SitePageBackgroundState();
}

class _SitePageBackgroundState extends State<_SitePageBackground> {
/*   double currentIndex = 0;
  final timeDuration = 0.08;
  bool isReverse = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        animateTurns();
      });
    });
  }

  @override
  dispose() {
    _timer?.cancel();
    super.dispose();
  }

  animateTurns() {
    if (currentIndex == 10) {
      isReverse = true;
    } else if (currentIndex == 0) {
      isReverse = false;
    }

    if (isReverse) {
      currentIndex -= 0.1;
    } else {
      currentIndex += 0.1;
    }
    setState(() {});
  } */

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Stack(
          children: [
            Image.asset(
              background2,
              fit: BoxFit.cover,
              width: context.screenWidth,
              height: context.screenHeight,
            ),
            Container(
              color: kDarkColor.withOpacity(.6),
            ),
          ],
        ));
  }

/*   Widget buildBackgroundImage() {
    final xOffset = context.screenWidth * (currentIndex / 10);
    return Transform.translate(
      offset: Offset(-10, 0),
      child: Container(
        width: context.screenWidth * 2,
        height: context.screenHeight,
        color: Colors.green,
        child: Image.asset(
          apeNft1,
          fit: BoxFit.cover,
          width: context.screenWidth * 2,
          height: context.screenHeight,
        ),
      ),
    );
  } */
}

class ApeButtom extends StatelessWidget {
  final String text;
  final IconData? icon;
  const ApeButtom({super.key, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cornersLarge),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 4,
          horizontal: kDefaultPadding,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(background4),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            text,
            style: context.bodyMedium(
              color: kLightColorBold,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (icon != null) horizontalSpaceSmall,
          if (icon != null)
            Icon(
              icon,
              color: kLightColorBold,
            ),
        ]),
      ),
    );
  }
}

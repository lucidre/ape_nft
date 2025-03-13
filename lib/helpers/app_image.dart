import 'package:ape_nft/common_libs.dart';

class AppImage extends StatelessWidget {
  final String? image;
  final double? height;
  final bool isLoadingProgressBar;
  final double? width;
  final BoxFit? fit;
  final String? heroTag;
  const AppImage({
    Key? key,
    this.image,
    this.height,
    this.width,
    this.isLoadingProgressBar = false,
    this.fit,
    this.heroTag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return heroTag != null
        ? AppHero(
            tag: heroTag!,
            child: buildBody(),
          )
        : buildBody();
  }

  Widget buildBody() {
    return Image.asset(
      image ?? '',
      fit: fit ?? BoxFit.cover,
      width: height ?? double.infinity,
      height: width ?? double.infinity,
    );
  }
}

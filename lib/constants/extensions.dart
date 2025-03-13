import 'package:ape_nft/common_libs.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

extension DeviceStyles on BuildContext {
  TextStyle? bodyLarge({
    final FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
    String? fontFamily,
  }) {
    final style = Theme.of(this).textTheme.bodyLarge;
    return style?.copyWith(
      fontWeight: fontWeight ?? style.fontWeight,
      fontSize: fontSize ?? style.fontSize,
      color: color ?? kLightColorBold,
      height: height ?? style.height,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  TextStyle? bodyMedium({
    final FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    String? fontFamily,
    double? height,
    FontStyle? fontStyle,
  }) {
    final style = Theme.of(this).textTheme.bodyMedium;
    return style?.copyWith(
      // height: height ?? style.height,
      height: 1.5,
      fontStyle: fontStyle ?? style.fontStyle,
      fontWeight: fontWeight ?? style.fontWeight,
      fontSize: fontSize ?? style.fontSize,
      color: color ?? kLightColor,
      fontFamily: fontFamily ?? style.fontFamily,
    );
  }

  InputDecoration inputDecoration(
      {Widget? prefixIcon,
      Widget? suffixIcon,
      Widget? icon,
      String? labelText,
      String? hintText,
      String? errorText,
      String? helperText,
      String? prefixText,
      String? suffixText,
      String? counterText,
      String? semanticCounterText,
      InputBorder? border,
      InputBorder? focusedBorder,
      InputBorder? enabledBorder,
      InputBorder? errorBorder,
      TextStyle? hintStyle,
      TextStyle? labelStyle,
      TextStyle? errorStyle,
      TextStyle? helperStyle,
      TextStyle? prefixStyle,
      TextStyle? suffixStyle,
      TextStyle? counterStyle,
      TextStyle? floatingLabelStyle,
      EdgeInsets? padding}) {
    final borderRadius = BorderRadius.circular(cornersSmall);
    final borderSide = BorderSide(
      width: .8,
      color: textColor,
    );
    return InputDecoration(
      hintStyle: hintStyle ?? bodyMedium(),
      labelStyle: labelStyle ?? bodyMedium(),
      errorStyle: errorStyle ?? bodyMedium(color: Colors.red),
      helperStyle: helperStyle ?? bodyMedium(),
      prefixStyle: prefixStyle ?? bodyMedium(),
      suffixStyle: suffixStyle ?? bodyMedium(),
      counterStyle: counterStyle ?? bodyMedium(),
      floatingLabelStyle: floatingLabelStyle ?? bodyMedium(),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      icon: icon,
      contentPadding: padding ??
          const EdgeInsets.only(
              left: kDefaultPadding / 2, right: kDefaultPadding / 2),
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixText: prefixText,
      suffixText: suffixText,
      counterText: counterText,
      semanticCounterText: semanticCounterText,
      border: border ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      focusedBorder: focusedBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      enabledBorder: enabledBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: borderSide,
          ),
      errorBorder: errorBorder ??
          OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: const BorderSide(
              width: .8,
              color: Colors.red,
            ),
          ),
    );
  }
}

extension DeviceTheme on BuildContext {
  Brightness get _platformBrightness => MediaQuery.of(this).platformBrightness;
  bool get $isLightMode => _platformBrightness == Brightness.light;
  bool get $isDarkMode => _platformBrightness == Brightness.dark;

  Color get textColor => $isLightMode ? kDarkColor : kLightColor;
  Color get backgroundColor => $isLightMode ? kLightColor : kDarkColor;

  Divider get divider => Divider(
        color: textColor.withOpacity($isLightMode ? .3 : .8),
      );

  ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: kDarkColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: kPrimaryColor),
        canvasColor: kDarkColor,
        dialogBackgroundColor: kDarkColor,
        floatingActionButtonTheme: ThemeData.dark()
            .floatingActionButtonTheme
            .copyWith(backgroundColor: kLightColor),
        cardColor: kDarkColor,
        iconTheme:
            ThemeData.light().iconTheme.copyWith(color: kLightColor, size: 18),
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(this).textTheme.copyWith(
                bodyLarge: TextStyle(
                  fontSize: 12,
                  color: kLightColorBold,
                  fontWeight: FontWeight.w600,
                ),
                bodyMedium: TextStyle(
                  fontSize: 10,
                  color: kLightColor,
                ),
              ),
        ).apply(
          bodyColor: kLightColorBold,
        ),
      );
}

extension DeviceSize on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);
  Size get _size => _mediaQuery.size;

  double get topPadding => _mediaQuery.padding.top;
  double get screenHeight => _size.height;
  double get screenWidth => _size.width;
}

extension DeviceAppBar on BuildContext {
  PreferredSizeWidget appBar() {
    final topPadding = MediaQuery.of(this).padding.top;
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: kDarkColor,
        ),
        padding: EdgeInsets.only(
            top: topPadding + kDefaultPadding / 2,
            left: kDefaultPadding,
            right: kDefaultPadding),
        margin: const EdgeInsets.only(bottom: kDefaultMargin / 2),
        child: Row(
          children: [
            Text(
              'Searcher',
              style: bodyLarge(),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 7,
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: kDefaultPadding / 4,
                      horizontal: kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kLightColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(cornersLarge),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Search',
                        style: bodyMedium(
                          color: kLightColor,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.search_rounded,
                        color: kLightColor,
                      ),
                    ],
                  )),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              'Explore',
              style: bodyMedium(fontWeight: FontWeight.bold),
            ),
            horizontalSpaceMedium,
            Text(
              'Stats',
              style: bodyMedium(
                color: kLightColor,
              ),
            ),
            horizontalSpaceMedium,
            Text(
              'Resources',
              style: bodyMedium(
                color: kLightColor,
              ),
            ),
            horizontalSpaceMedium,
            Text(
              'Create',
              style: bodyMedium(
                color: kLightColor,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_outline_rounded,
                color: kLightColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                color: kLightColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension DeviceBottomBar on BuildContext {
  Future<T?> showBottomBar<T>({required Widget child, double? height}) {
    final defaultHeight = screenHeight - (topPadding + kToolbarHeight * 2);

    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(cornersMedium),
      topRight: Radius.circular(cornersMedium),
    );
    final result = showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Material(
        color: Colors.transparent,
        child: Container(
          height: height ?? defaultHeight,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: borderRadius,
          ),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
    );
    return result;
  }

  Future<T?> showAlertDialog<T>(
      {required String title,
      String? desctiption,
      List<Widget> actions = const []}) {
    return showDialog<T>(
        context: this,
        builder: (ctx) {
          return AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(cornersMedium),
                ),
              ),
              title: Text(
                title,
                style: bodyLarge(),
              ).fadeIn(),
              titlePadding: const EdgeInsets.only(
                  top: kDefaultPadding / 2,
                  left: kDefaultPadding / 2,
                  right: kDefaultPadding / 2),
              contentPadding: const EdgeInsets.all(kDefaultPadding / 2),
              content: Text(
                desctiption ?? '',
                style: bodyMedium(),
              ).fadeIn(),
              actions: actions,
              actionsPadding: const EdgeInsets.only(
                  bottom: kDefaultPadding / 2,
                  right: kDefaultPadding / 2,
                  left: kDefaultPadding / 2));
        });
  }

  Future<T?> showInformationDialog<T>(String desciption) {
    return showAlertDialog<T>(
        title: "Information",
        desctiption: desciption,
        actions: [
          AppBtn.basic(
            onPressed: () => router.pop(),
            isSecondary: $isDarkMode,
            child: Text(
              'Close',
              style: bodyMedium(fontWeight: FontWeight.bold),
            ),
          ).fadeIn(),
        ]);
  }

  Future<T?> $showGeneralDialog<T>({
    required Widget child,
    required String barrierLabel,
    bool dismissible = true,
  }) {
    return showGeneralDialog<T>(
      context: this,
      barrierDismissible: dismissible,
      barrierLabel: barrierLabel,
      barrierColor: kDarkColor.withOpacity(0.5),
      transitionDuration: fastDuration,
      pageBuilder: (_, __, ___) => Dialog(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(cornersMedium),
          ),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding / 2),
          child: child.fadeInAndMoveFromBottom(),
        ),
      ),
      transitionBuilder: (_, anim, __, child) => FadeTransition(
        opacity: Tween(begin: 0.0, end: 1.0).animate(anim),
        child: child,
      ),
    );
  }
}

extension AppIterableExtensions<T> on Iterable<T> {
  Iterable<T> merge(Iterable<T> other) sync* {
    Iterator<T> iter1 = iterator;
    Iterator<T> iter2 = other.iterator;

    bool has1 = iter1.moveNext();
    bool has2 = iter2.moveNext();
    while (has1 && has2) {
      yield iter1.current;
      yield iter2.current;
      has1 = iter1.moveNext();
      has2 = iter2.moveNext();
    }
    while (has1) {
      yield iter1.current;
      has1 = iter1.moveNext();
    }
    while (has2) {
      yield iter2.current;
      has2 = iter2.moveNext();
    }
  }
}

extension WidgetAnimation on Widget {
  fadeInAndMoveFromTop({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, -10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeInAndMoveFromBottom({
    Duration? delay,
    Duration? animationDuration,
    Offset? offset,
  }) =>
      animate(delay: delay ?? fastDuration)
          .move(
              duration: animationDuration ?? fastDuration,
              begin: offset ?? const Offset(0, 10))
          .fade(duration: animationDuration ?? fastDuration);

  fadeIn({
    Duration? delay,
    Duration? animationDuration,
    Curve? curve,
  }) =>
      animate(delay: delay ?? fastDuration).fade(
          duration: animationDuration ?? fastDuration,
          curve: curve ?? Curves.decelerate);
}

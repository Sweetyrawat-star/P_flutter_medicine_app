import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'ColorUtils.dart';
import 'Constant.dart';
import 'NavigatorUtils.dart';
import 'ToastUtils.dart';

class CustomWidget {
  /* static Widget buildContentVerticleUITemp(BuildContext context, int index, {bool isFullWidth = false}) {
    return GestureDetector(
      onTap: () {
        ToastUtils.show("You Clicked card on Index: $index");
      },
      child: Container(
        width: isFullWidth ? MediaQuery.of(context).size.width : Constant.contentCardDefaultWidth,
        height: Constant.contentCardDefaultHeight + Constant.appDefaultSpacing,
        child: Wrap(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(Constant.cardRadius),
              child: Container(
                height: Constant.contentCardDefaultHeight -
                    Constant.appDefaultSpacing,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                      ""
                      //ListUtils.getVideo(index),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            getSubText(context, "Title $index" ?? ""),
          ],
        ),
      ),
    );
  }*/

  static Widget getCenterTextDummyScreen(BuildContext context, String text) {
    return Center(
      child: Container(
        child: CustomWidget.getHeading(context, text),
      ),
    );
  }
/*
static Widget buildContentVerticleUIOriginal(
      BuildContext context, CommonContentObject _commonContentObject) {
    return buildContentCardGestureDetector(context, _commonContentObject,
        Constant.contentCardDefaultWidth, Constant.contentCardDefaultHeight);
  }
*/

  /* static Widget buildContentVerticleUISeeMore(
      BuildContext context, int categoryId, String title) {
    return buildContentCardSeeMore(context, categoryId, title,
        Constant.contentCardDefaultWidth, Constant.contentCardDefaultHeight);
  }
*/
/*
static Widget buildContentWidthLongUIOriginal(
      BuildContext context, CommonContentObject _commonContentObject) {
    return buildContentCardGestureDetector(
        context,
        _commonContentObject,
        Constant.contentCardWidthLongWidth,
        Constant.contentCardWidthLongHeight);
  }
*/

  /* static Widget buildContentCardGestureDetector(
      BuildContext context,
      CommonContentObject _commonContentObject,
      double cardWidth,
      double cardHeight) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: cardWidth,
        child: Wrap(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                height: cardHeight - 20,
                child: CachedNetworkImage(
                  imageUrl: _commonContentObject?.imageUrl ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => getContentPlaceholderBorder(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            getSubText(context, _commonContentObject?.contentTitle ?? ""),
          ],
        ),
      ),
    );
  }*/

/*
  static Widget buildContentCardSeeMore(BuildContext context, int categoryId, String title,
      double cardWidth, double cardHeight) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        width: cardWidth,
        child: Wrap(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Container(
                height: cardHeight - 20,
                child: Stack(
                  children: <Widget>[
                    //buildShadedHeaderImage(assetImage: "assets/see_more_content.png"),
                    buildShadedHeaderImage(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: Constant.appDefaultSpacingHalf, bottom: Constant.appDefaultSpacingHalf, left: 0.0, right: 0.0),
                        color: ColorUtils.greyColor.withOpacity(0.2),
                        child: Center(
                          child: CustomWidget.getSubText(
                              context, "See More"),
                        ),
                      ),
                    ),
                  ],
                ),
 child: CachedNetworkImage(
                  imageUrl: _commonContentObject?.imageUrl ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.red, BlendMode.colorBurn)),
                    ),
                  ),
                  placeholder: (context, url) => getContentPlaceholderBorder(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
*/

  static Widget getContentPlaceholderBorder() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Constant.cardRadius),
      child: Center(
          child: Container(
        decoration: BoxDecoration(
          color: ColorUtils.blackColor.withOpacity(0.5),
          //border: Border.all(color: ColorUtils.darkGreyIconColor)
        ),
      )),
    );
  }

  static Widget buildShadedHeaderImage({String assetImage}) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(
              assetImage == null ? "lib/assets/birdboxBanner.png" : assetImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
  /*static Widget buildShadedHeaderImageFromURL(String imageUrl) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: CachedNetworkImage(
        imageUrl: imageUrl ?? "",
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.red, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => getContentPlaceholderBorder(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }*/

  static Widget customBackButton(BuildContext context,
      {Function functionToExecute, bool isNeedToFinish = true}) {
    return Container(
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: ColorUtils.whiteColor,
          onPressed: () {
            if (functionToExecute != null) {
              functionToExecute();
            }

            if (isNeedToFinish) {
              Navigator.pop(context);
            }
          }),
    );
  }

  static Widget customShare(BuildContext context,
      {Function functionToExecute}) {
    return Container(
      child: IconButton(
          icon: Icon(Icons.share),
          color: ColorUtils.whiteColor,
          onPressed: () {
            if (functionToExecute != null) {
              functionToExecute();
            }
          }),
    );
  }

  static Widget customPlayButton(
      BuildContext context, Function functionToExecute) {
    return Container(
      child: IconButton(
          icon: Icon(Icons.play_circle_outline),
          iconSize: 48.0,
          color: ColorUtils.primaryColor,
          onPressed: () {
            if (functionToExecute != null) {
              functionToExecute();
            }
          }),
    );
  }

  static Widget getHeading(BuildContext context, String text) {
    return Text(text,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.headline);
  }

  static Widget getHeadingGrey(BuildContext context, String text) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ));
  }

  static Widget getHeadingFrontSize(BuildContext context, String text) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ));
  }

  static Widget getHeadingGreyNotBold(BuildContext context, String text,
      {double fontSize = 18.0}) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: ColorUtils.subtitleTextColor,
          fontSize: fontSize,
          fontFamily: 'SuperMolotRegular',
        ));
  }

  static Widget getSubtextPrimaryColor(BuildContext context, String text,
      {double fontSize = 12.0}) {
    return Text(text,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: ColorUtils.primaryColor,
            fontSize: fontSize,
            fontWeight: FontWeight.normal));
  }

  static Widget getSubText(BuildContext context, String text,
      {int maxLine, TextStyle textStyle}) {
    return Text(text,
        textAlign: TextAlign.start,
        maxLines: maxLine != null ? maxLine : 1,
        overflow: TextOverflow.ellipsis,
        style: textStyle ?? Theme.of(context).textTheme.subtitle);
  }

  static Widget getDivider({Color dividerColor = Colors.black}) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: Constant.appDefaultSpacingHalf,
        ),
        Divider(
          height: 5.0,
          color: dividerColor,
        ),
        SizedBox(
          height: Constant.appDefaultSpacingHalf,
        ),
      ],
    );
  }

  static Widget getRaisedBtn(BuildContext context, String text,
      {onPressed,
      Color textColor = Colors.white,
      double contentPadding = 12.0,
      Color disableColor,
      Color disableTextColor}) {
    return new RaisedButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      disabledColor: disableColor,
      disabledTextColor: disableTextColor,
      elevation: Constant.cardRadius,
      splashColor: ColorUtils.primaryColor,
      child: new Text(
        text,
        style: new TextStyle(fontSize: 16.0),
      ),
      padding: EdgeInsets.all(contentPadding),
      onPressed: onPressed,
    );
  }

  static Widget getRoundedRaisedButton(BuildContext context, String text,
      {onPressed,
      Color textColor = Colors.white,
      FontWeight fontWeight = FontWeight.normal}) {
    return RaisedButton(
      onPressed: onPressed,
      child: CustomWidget.getText(text,
          textColor: textColor, fontSize: 16.0, fontWeight: fontWeight),
      color: ColorUtils.whiteColor,
      elevation: 10.0,
      highlightColor: Colors.green,
      padding: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          side: BorderSide(color: Color(0xFFFEEBF1))),
    );
  }

  static Widget getFlatBtn(BuildContext context, String text,
      {TextStyle style, onPressed, Color textColor}) {
    return new FlatButton(
        textColor: textColor,
        onPressed: onPressed,
        padding: EdgeInsets.all(0.0),
        child: new Text(text, style: style));
  }

  static Widget getTextField(BuildContext context,
      TextEditingController controller, String label, String hintText,
      {String prefixText, bool isPass = false, onChange}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: ColorUtils.iconGreyColor,
            indicatorColor: ColorUtils.iconGreyColor,
            hintColor: ColorUtils.iconGreyColor),
        child: new TextField(
          style: TextStyle(fontSize: 18.0),
          controller: controller,
          obscureText: isPass,
          decoration: new InputDecoration(
              contentPadding: EdgeInsets.only(top: 8.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffB8B8B8)),
              ),
              prefix: Padding(padding: EdgeInsets.only(left: 16.0)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffB8B8B8)),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.title.copyWith(
                    color: ColorUtils.hintTextColor,
                  )),
          onChanged: (value) {
            onChange(value);
          },
        ),
      ),
    );
  }

  static Widget getTextFormField(
    BuildContext context, {
    TextEditingController controller,
    String labelText,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    bool isPass = false,
    TextInputType keyboardType: TextInputType.text,
  }) {
    return Column(
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.black,
            //cursorColor:Colors.white,
            hintColor: Colors.grey[400],
            //accentColor: Colors.white,
          ),
          child: TextFormField(
            controller: controller,
            onSaved: onSaved,
            obscureText: isPass,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              labelText: labelText,
              labelStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: new EdgeInsets.all(10.0),
            ),
          ),
        ),
        // CustomWidget.dividerWhite,
      ],
    );
  }

  static Widget getText(String text,
      {TextStyle style,
      FontWeight fontWeight = FontWeight.normal,
      Color textColor = const Color(0xFF3A3A3A),
      double fontSize = 16.0,
      TextAlign textAlign = TextAlign.start,
      TextOverflow overflow}) {
    return new Text(
      text != null ? text : "",
      overflow: overflow,
      style: style,
      textAlign: textAlign,
    );
  }

  static Widget getText1(String text,
      {TextStyle style,
      FontWeight fontWeight = FontWeight.normal,
      Color textColor = const Color(0xFF3A3A3A),
      double fontSize = 16.0,
      TextAlign textAlign = TextAlign.start,
      TextOverflow overflow,
      IntrinsicHeight height}) {
    return new Text(
      text != null ? text : "",
      overflow: overflow,
      style: style,
      textAlign: textAlign,
    );
  }

  static Widget getTextTemp(String text, {TextStyle style}) {
    return new Text(
      text != null ? text : "",
      style: style,
    );
  }

  static Widget getDrawerItemText(String text,
      {FontWeight fontWeight = FontWeight.normal,
      Color textColor = Colors.white,
      double fontSize = 16.0,
      TextAlign textAlign = TextAlign.start,
      onTap}) {
    return GestureDetector(
      child: new Text(
        text,
        style: new TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
        ),
        textAlign: textAlign,
      ),
      onTap: onTap,
    );
  }

  static Widget commonUi(String title, String value, {onTap}) =>
      GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomWidget.getText(title),
            CustomWidget.getText(value,
                textColor: ColorUtils.greyColor, fontSize: 14.0),
          ],
        ),
        onTap: onTap,
      );

  static Widget commonReminderUi(String value, {onTap}) => GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomWidget.getText(value),
            SizedBox(
              width: 4.0,
            ),
            Icon(
              Icons.arrow_drop_down,
              color: ColorUtils.greyColor,
            ),
          ],
        ),
        onTap: onTap,
      );

  static void moveToLogin(BuildContext context) {
    NavigatorUtils.moveToLoginScreen(context);
  }

  static Widget getBottomNavigationBar(String text, {onTap}) {
    return GestureDetector(
      child: BottomAppBar(
        color: Color(0xfFFEA3C78),
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: 42.0,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          )),
        ),
      ),
      onTap: onTap,
    );
  }

  static Widget createTextFieldWithBorder(BuildContext context,
      {TextEditingController textEditingController,
      String labelText,
      double contentPaddingValue = 4.0,
      IconData icon,
      Icon suffixIcon}) {
    return Container(
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(contentPaddingValue),
            labelText: labelText,
            prefixIcon: Icon(
              icon,
              size: 18.0,
            ),
            suffixIcon: suffixIcon,
            labelStyle:
                TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffB8B8B8)),
                gapPadding: 6.0)),
      ),
    );
  }
}

import 'package:flutter/widgets.dart';

final String CAMERA_SCREEN="/CAMERA_SCREEN";

class Constant {

  static double contentCardDefaultHeight = 0.0;
  static double contentCardDefaultWidth = 0.0;

  static double contentCardWidthLongHeight = 0.0;
  static double contentCardWidthLongWidth = 0.0;

  static const double appDefaultSpacing = 16.0;
  static const double appDefaultSpacingHalf = 8.0;

  static const double cardRadius = 4.0;

  static void initialize(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    contentCardDefaultWidth = width / 3;
    contentCardDefaultHeight = contentCardDefaultWidth + 50;

    contentCardWidthLongWidth = width / 2;
    contentCardWidthLongHeight = contentCardWidthLongWidth / 1.35;

    //AppUtils.refreshCurrentState(context);
  }

  static const int DEFAULT_MAX_IMAGE_MEDIA_SELECTION_ALLOWED = 30;
  static const int DEFAULT_MAX_VIDEO_MEDIA_SELECTION_ALLOWED = 10;

  static const int maxMb = 100;
  static const int kiloBytes = 1024;
  static const int bytes = 1024;
  static const int maxFileSize = maxMb * kiloBytes * bytes;

  static const explore = "Explore";
  static const notification = "Notification";

  static const KEY_CONTENT_TYPE_LIKE = "like";
  static const KEY_CONTENT_TYPE_UPLOAD = "upload";
  static const KEY_CONTENT_TYPE_FAVORITE = "favorite";
  static const KEY_CONTENT_TYPE_COMMENT = "comment";
  static const KEY_CONTENT_TYPE_DOWNLOAD = "download";

  static const KEY_VIOLENT = "VIOLENT";
  static const KEY_HATEFUL = "HATEFUL";
  static const KEY_SEXUAL_CONTENT = "SEXUAL_CONTENT";
  static const KEY_HARMFUL = "HARMFUL";
  static const KEY_MISLEADING = "MISLEADING";
  static const KEY_INTELLECTUAL_PROPERTY_RIGHTS = "INTELLECTUAL_PROPERTY_RIGHTS";



  static const VALUE_VIOLENT = "Violent";
  static const VALUE_HATEFUL = "Hateful";
  static const VALUE_SEXUAL_CONTENT = "Sexual Content";
  static const VALUE_HARMFUL = "Harmful";
  static const VALUE_MISLEADING = "Misleading";
  static const VALUE_INTELLECTUAL_PROPERTY_RIGHTS = "Related to intellectual\nproperty rights";



  // Permission
static const KEY_PERMISSION=" PERMISSION";
//setting

  static const KEY_360P = "360P";
  static const KEY_480P = "480P";
  static const KEY_720P  = "720P ";
  static const KEY_1080P = "1080P";
  static const KEY_ORIGINAL = "ORIGINAL";


  static const VALUE_360P = "360p";
  static const VALUE_480P = "480p";
  static const VALUE_720P = "720p";
  static const VALUE_1080P = "1080p";
  static const VALUE_ORIGINAL = "Original";

  static const CARD_SCROLL_AFTER_CONTENT_CONSUMPTION_TIME = 5;
  static const CARD_SCROLL_BEFORE_CONTENT_CONSUMPTION_TIME = 7;
  static const DEFAULT_DETAIL_CARD_SCROLL_TIME = CARD_SCROLL_BEFORE_CONTENT_CONSUMPTION_TIME + CARD_SCROLL_AFTER_CONTENT_CONSUMPTION_TIME;
}
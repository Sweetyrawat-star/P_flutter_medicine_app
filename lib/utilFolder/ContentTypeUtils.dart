enum TYPE_CategoryCardsUI { CAROUSAL, CARD_WIDTH_LONG, CARD_DEFAULT, DEFAULT }

class ContentTypeUtils {
  static const String APP_CATEGORY_TYPE_CAROUSAL = "ct_ui_carousel";
  static const String APP_CATEGORY_TYPE_CARD_WIDTH_LONG =
      "ct_ui_home_width_long";
  static const String APP_CATEGORY_TYPE_CARD_DEFAULT = "ct_ui_home_default";

  static TYPE_CategoryCardsUI getCategoryUIType(String contentType) {
    TYPE_CategoryCardsUI type_categoryCardsUI;

    if (contentType == null) {
      type_categoryCardsUI = TYPE_CategoryCardsUI.DEFAULT;
      return type_categoryCardsUI;
    }

    contentType = contentType.trim().toLowerCase();

    if (contentType == APP_CATEGORY_TYPE_CARD_DEFAULT) {
      type_categoryCardsUI = TYPE_CategoryCardsUI.CARD_DEFAULT;
    } else if (contentType == APP_CATEGORY_TYPE_CAROUSAL) {
      type_categoryCardsUI = TYPE_CategoryCardsUI.CAROUSAL;
    } else if (contentType == APP_CATEGORY_TYPE_CARD_WIDTH_LONG) {
      type_categoryCardsUI = TYPE_CategoryCardsUI.CARD_WIDTH_LONG;
    } else {
      type_categoryCardsUI = TYPE_CategoryCardsUI.DEFAULT;
    }

    return type_categoryCardsUI;
  }
}

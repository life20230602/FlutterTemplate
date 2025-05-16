class StringUtils {
  static String toMaxLength(String text, int maxLength,
      {bool ellipsis = false}) {
    if (text.length > maxLength) {
      var substring = text.substring(0, maxLength);
      if (ellipsis) {
        substring = "$substring...";
      }
      return substring;
    }
    return text;
  }
}

extension StringExt on String {
  String toMaxLength(int maxLength, {bool ellipsis = false}) {
    return StringUtils.toMaxLength(this, maxLength, ellipsis: ellipsis);
  }
}

extension FakeImageUrl on String {
  /// 生成fakeimg.pl图片URL
  ///
  /// @param width 图片宽度
  /// @param height 图片高度
  /// @param bgColor 背景色，格式为RRGGBB（如：ff0000）
  /// @param textColor 文字颜色，格式为RRGGBB（如：000000）
  String fakeImg({
    int width = 300,
    int? height,
    String bgColor = '8321FF',
    String textColor = 'fff',
  }) {
    height ??= width;
    return 'https://fakeimg.pl/${width}x$height/$bgColor/$textColor/?text=${Uri.encodeComponent(this)}';
  }
}

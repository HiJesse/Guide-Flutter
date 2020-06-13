import 'package:flutter/material.dart';

/// 自定义text
///
/// 复合了container和GestureDetector.
/// 为了避免绘制多余的组件, 需要判断container和GestureDetector的参数.
class TextView extends StatelessWidget {
  // text相关
  final String content;
  final TextStyle textStyle;
  final StrutStyle strutStyle;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int maxLines;

  // container相关
  final double width;
  final double height;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Decoration decoration;
  final Decoration foregroundDecoration;
  final EdgeInsetsGeometry margin;

  // GestureDetector相关
  final GestureTapCallback onTap;
  final GestureTapDownCallback onTapDown;
  final GestureTapUpCallback onTapUp;
  final GestureTapCallback onDoubleTap;
  final GestureLongPressCallback onLongPress;

  TextView(this.content,
      {this.textStyle,
      this.strutStyle,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.width,
      this.height,
      this.alignment,
      this.padding,
      this.backgroundColor,
      this.decoration,
      this.foregroundDecoration,
      this.margin,
      this.onTap,
      this.onTapDown,
      this.onTapUp,
      this.onDoubleTap,
      this.onLongPress});

  @override
  Widget build(BuildContext context) {
    if (_isContainerValid() && _isGestureValid()) {
      return _buildContainerGestureText(context);
    } else if (_isContainerValid()) {
      return _buildContainerText(context);
    } else if (_isGestureValid()) {
      return _buildGestureText(context);
    } else {
      return _buildText(context);
    }
  }

  /// 只构建text
  Widget _buildText(BuildContext context) {
    return Text(
      content,
      style: textStyle,
    );
  }

  /// 构建GestureDetector和text
  Widget _buildGestureText(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _buildText(context),
    );
  }

  /// 构建container和text
  Widget _buildContainerText(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      color: backgroundColor,
      width: width,
      height: height,
      child: _buildText(context),
    );
  }

  /// 构建container, GestureDetector和text
  Widget _buildContainerGestureText(BuildContext context) {
    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      color: backgroundColor,
      width: width,
      height: height,
      child: _buildGestureText(context),
    );
  }

  /// container的参数是否有效
  bool _isContainerValid() {
    return width != null ||
        height != null ||
        margin != null ||
        padding != null ||
        alignment != null ||
        backgroundColor != null ||
        decoration != null ||
        foregroundDecoration != null;
  }

  /// gesture的参数是否有效
  bool _isGestureValid() {
    return onTap != null ||
        onTapDown != null ||
        onTapUp != null ||
        onDoubleTap != null ||
        onLongPress != null;
  }
}

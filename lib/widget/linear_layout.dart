import 'package:flutter/material.dart';

/// 自定义线性布局, 支持水平和垂直布局 (默认水平)和事件响应
///
/// 复合了container, GestureDetector 和 Row | Column.
class LinearLayout extends StatelessWidget {
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

  // row colum 相关
  final Axis direction;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline textBaseline;

  LinearLayout(
      {this.width,
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
      this.onLongPress,
      this.direction = Axis.horizontal,
      this.children,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.max,
      this.textDirection,
      this.verticalDirection = VerticalDirection.down,
      this.textBaseline});

  @override
  Widget build(BuildContext context) {
    if (_isGestureValid()) {
      return Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        color: backgroundColor,
        width: width,
        height: height,
        child: _buildGestureDirection(context),
      );
    }

    return Container(
      alignment: alignment,
      margin: margin,
      padding: padding,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      color: backgroundColor,
      width: width,
      height: height,
      child: _buildDirection(context),
    );
  }

  /// 根据方向参数构建Row 或 Column
  Widget _buildDirection(BuildContext context) {
    if (direction == Axis.horizontal) {
      return Row(
        children: children,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
      );
    }
    return Column(
      children: children,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
    );
  }

  /// 构建GestureDetector和text
  Widget _buildGestureDirection(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _buildDirection(context),
    );
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

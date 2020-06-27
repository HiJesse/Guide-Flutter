import 'dart:async';

import 'package:flutter/services.dart';

// 回调性能信息
typedef void OnEvent(Object event);
// 回调错误信息
typedef void OnError(Object error);

/// 性能监控event
class EventPerformanceChannel {
  static const String EVENT_PERFORMANCE = 'event_performance';

  List<PerformanceListener> _performanceListener;
  EventChannel _eventChannel;
  StreamSubscription _streamSubscription;

  static EventPerformanceChannel _instance;
  factory EventPerformanceChannel() => _getInstance();
  static EventPerformanceChannel get instance => _getInstance();

  static EventPerformanceChannel _getInstance() {
    if (_instance == null) {
      _instance = new EventPerformanceChannel._internal();
    }
    return _instance;
  }

  EventPerformanceChannel._internal() {
    _eventChannel = const EventChannel(EVENT_PERFORMANCE);
    _performanceListener = [];
  }

  // 开启性能监控
  void start() {
    _streamSubscription = _eventChannel
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  // 关闭性能监控
  void stop() {
    if (_streamSubscription == null) {
      return;
    }

    _streamSubscription.cancel();
  }

  /// 添加监听到监听列表里
  void addListener(PerformanceListener listener) {
    if (listener == null || _performanceListener.contains(listener)) {
      return;
    }

    _performanceListener.add(listener);
  }

  void _onEvent(Object event) {
    for (PerformanceListener listener in _performanceListener) {
      listener.onEvent(event);
    }
  }

  void _onError(Object error) {
    for (PerformanceListener listener in _performanceListener) {
      listener.onError(error);
    }
  }
}

/// 性能监听回调
class PerformanceListener {
  OnEvent onEvent;
  OnError onError;

  PerformanceListener({this.onEvent, this.onError});
}

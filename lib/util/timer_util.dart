import 'dart:async';

/// 计时tick回调
/// 总时间, 当前剩余时间
typedef void OnTimerTick(int counterDuration, int currentTick);

/// 计时工具
class TimerUtil {
  Timer _timer;
  bool _isRunning = false;
  // 计时间隔
  int interval;
  // 总时长
  int counterDuration;
  // tick回调
  OnTimerTick _onTimerTick;

  TimerUtil(this.counterDuration,
      {this.interval = Duration.millisecondsPerSecond});

  /// 设置tick回调
  void setTickListener(OnTimerTick onTimerTick) {
    _onTimerTick = onTimerTick;
  }

  /// 开始倒计时
  void startCountDown() {
    if (_isRunning || counterDuration <= 0 || interval <= 0) {
      return;
    }

    _isRunning = true;
    Duration durationConfig = Duration(milliseconds: interval);
    _timer = Timer.periodic(durationConfig, (timer) {
      int time = counterDuration - interval;
      counterDuration = time;
      if (time >= interval) {
        _tickCallback(time);
        return;
      } else if (time == 0) {
        _tickCallback(0);
        stop();
        return;
      }

      // 小于interval的计时
      timer.cancel();
      Future.delayed(Duration(milliseconds: time), () {
        counterDuration = 0;
        _tickCallback(0);
        stop();
      });
    });
  }

  /// 关闭计时器
  void stop() {
    _isRunning = false;
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }

  /// 是否正在运行
  bool isTimerRunning() {
    return _isRunning;
  }

  /// 回调
  void _tickCallback(int currentTick) {
    if (_onTimerTick == null) {
      return;
    }

    _onTimerTick(counterDuration, currentTick);
  }
}

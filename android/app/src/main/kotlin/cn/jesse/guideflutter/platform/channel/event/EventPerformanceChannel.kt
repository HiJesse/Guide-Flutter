package cn.jesse.guideflutter.platform.channel.event

import android.app.Application
import cn.jesse.guideflutter.platform.channel.IChannel
import cn.jesse.magicbox.MagicBox
import cn.jesse.magicbox.data.PerformanceData
import cn.jesse.magicbox.data.RequestLoggerData
import cn.jesse.nativelogger.NLogger
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel

/**
 * 性能event
 *
 * 回调 {cpu: , mem: }
 *
 * @author jesse
 */
class EventPerformanceChannel constructor(private var application: Application, private var flutterEngine: FlutterEngine) : IChannel, EventChannel.StreamHandler, MagicBox.OnDashboardDataListener {

    companion object {
        const val EVENT_PERFORMANCE = "event_performance"
    }

    private var eventSink: EventChannel.EventSink? = null;

    override fun register() {
        EventChannel(flutterEngine.dartExecutor.binaryMessenger, EVENT_PERFORMANCE).setStreamHandler(this)
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        NLogger.e("onListen")
        MagicBox.getPerformanceManager().startMonitorCPU()
        MagicBox.getPerformanceManager().startMonitorMem()
        MagicBox.registerDashboardData(this)
        eventSink = events;
    }

    override fun onCancel(arguments: Any?) {
        NLogger.e("onCancel")
        MagicBox.getPerformanceManager().stopMonitorCPU()
        MagicBox.getPerformanceManager().stopMonitorMem()
        MagicBox.unregisterDashboardData(this)
    }

    override fun onHttpRequestLog(p0: RequestLoggerData?) {
        // unused
    }

    override fun onPerformance(data: PerformanceData?) {
        if (data == null || eventSink == null) {
            return
        }

        val outputMap = mutableMapOf<String, String>()

        outputMap["cpu"] = data.currentCPUUsage.toString()
        outputMap["mem"] = data.currentMemUsage.toString()
        eventSink?.success(outputMap)
    }
}
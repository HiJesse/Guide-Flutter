package cn.jesse.guideflutter

import cn.jesse.guideflutter.platform.channel.ChannelManager
import cn.jesse.magicbox.MagicBox
import cn.jesse.magicbox.data.PerformanceData
import cn.jesse.magicbox.data.RequestLoggerData
import cn.jesse.nativelogger.NLogger
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

/**
 * flutter 主页
 *
 * @author jesse
 */
class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channelManager = ChannelManager(application, flutterEngine)
        channelManager.registerCommonChannel()

        MagicBox.getPerformanceManager().startMonitorCPU()
        MagicBox.registerDashboardData(object : MagicBox.OnDashboardDataListener {
            override fun onHttpRequestLog(p0: RequestLoggerData?) {
                // unused
            }

            override fun onPerformance(p0: PerformanceData?) {
                NLogger.d("cpu : " + p0?.currentCPUUsage + "%")
            }

        })

    }
}

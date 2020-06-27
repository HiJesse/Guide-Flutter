package cn.jesse.guideflutter

import cn.jesse.guideflutter.platform.channel.ChannelManager
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
    }
}

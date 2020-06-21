package cn.jesse.guideflutter

import android.os.Handler
import android.util.Log
import cn.jesse.guideflutter.platform.channel.ChannelManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec

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

        val basicMessageChannel = BasicMessageChannel(flutterEngine!!.dartExecutor!!.binaryMessenger, "basic_channel", StringCodec.INSTANCE)
        // Receive messages from Dart
        basicMessageChannel.setMessageHandler { message, reply ->
            Log.d("Android", "Received message = $message")
            reply.reply("Reply from Android")
        }

        // Send message to Dart
        Handler().postDelayed({
            basicMessageChannel.send("Hello World from Android") { reply ->
                Log.d("Android", "$reply")
            }
        }, 500)
    }
}

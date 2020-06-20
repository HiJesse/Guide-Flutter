package cn.jesse.guideflutter.platform.channel

import android.app.Application
import android.text.TextUtils
import android.widget.Toast
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StandardMessageCodec


/**
 * basic channel 管理器
 *
 * @author jesse
 */
class BasicChannelManager constructor(private var application: Application, private var flutterEngine: FlutterEngine) {
    companion object {
        const val CHANNEL_TOAST = "channel_toast"
    }

    /**
     * 统一注册基础功能
     */
    fun registerCommonChannels() {
        registerToast()
    }

    /**
     * 注册并监听toast
     */
    private fun registerToast() {
        val basicMessageChannel = BasicMessageChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_TOAST, StandardMessageCodec.INSTANCE)
        basicMessageChannel.setMessageHandler { o, _ ->
            val map = o as Map<*, *>;
            if (!TextUtils.isEmpty(map["message"].toString())) {
                val longDuration = map["longDuration"] as Boolean
                Toast.makeText(application, map["message"].toString(), if (longDuration) Toast.LENGTH_LONG else Toast.LENGTH_SHORT).show()
            }

        }
    }
}
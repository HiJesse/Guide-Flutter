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
        const val CHANNEL_APP_INFO = "channel_app_info"
    }

    /**
     * 统一注册基础功能
     */
    fun registerCommonChannels() {
        registerToast()
        registerAppInfo()
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

    /**
     * 注册监听回调app信息
     */
    private fun registerAppInfo() {
        val basicMessageChannel = BasicMessageChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_APP_INFO, StandardMessageCodec.INSTANCE)
        basicMessageChannel.setMessageHandler { _, reply ->
            val result = mapOf(
                    "appVersionName" to "v1.0.0",
                    "appVersionCode" to "1",
                    "flutterVersionName" to "v0.5.0",
                    "flutterVersionCode" to "12"
            )
            reply.reply(result)
        }
    }
}
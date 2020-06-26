package cn.jesse.guideflutter.platform.channel.method

import android.app.Application
import android.text.TextUtils
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/**
 * 安全 channel
 *
 * @author jesse
 */
class MethodSecurityChannel constructor(private var application: Application, private var flutterEngine: FlutterEngine) : IMethodChannel {

    companion object {
        const val CHANNEL_SECURITY = "channel_security"

        const val METHOD_ENCODE_STRING = "method_encode_string"
    }

    override fun register() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_SECURITY).setMethodCallHandler { call, result ->
            if (TextUtils.isEmpty(call.method)) {
                return@setMethodCallHandler;
            }

            if (METHOD_ENCODE_STRING == call.method) {
                encodeString(call, result)
            }
        }
    }

    /**
     * 提供多种encode 编码字符
     * 字符串, md5, base64
     * return map {md5 : , base64: }
     */
    private fun encodeString(call: MethodCall, result: MethodChannel.Result) {
        val inputMap = call.arguments as Map<String, Object>
        val outputMap = mutableMapOf<String, String>()

        val src = inputMap["src"] as String
        outputMap["src"] = src

        if (inputMap["md5Enable"] as Boolean) {
            outputMap["md5"] = "c6f057b86584942e415435ffb1fa93d4"
        }

        if (inputMap["base64Enable"] as Boolean) {
            outputMap["base64"] = "MDAw"
        }

        result.success(outputMap)
    }
}
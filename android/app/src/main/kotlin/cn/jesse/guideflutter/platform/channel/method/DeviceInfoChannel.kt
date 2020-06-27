package cn.jesse.guideflutter.platform.channel.method

import android.app.Application
import android.text.TextUtils
import cn.jesse.guideflutter.platform.channel.IChannel
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

/**
 * 设备信息 channel
 *
 * @author jesse
 */
class DeviceInfoChannel constructor(private var application: Application, private var flutterEngine: FlutterEngine) : IChannel {

    companion object {
        const val CHANNEL_DEVICE_INFO = "channel_device_info"

        const val METHOD_GET_DEVICE_ID = "method_get_device_id"
    }

    override fun register() {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_DEVICE_INFO).setMethodCallHandler { call, result ->
            if (TextUtils.isEmpty(call.method)) {
                return@setMethodCallHandler;
            }

            if (METHOD_GET_DEVICE_ID == call.method) {
                getDeviceID(result)
            }
        }
    }

    /**
     * 获取设备ID
     */
    private fun getDeviceID(result: MethodChannel.Result) {
        result.success("0000000000000")
    }
}
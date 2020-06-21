package cn.jesse.guideflutter.platform.channel

import android.app.Application
import cn.jesse.guideflutter.platform.channel.method.IMethodChannel
import cn.jesse.guideflutter.platform.channel.method.MethodDeviceInfoChannel
import io.flutter.embedding.engine.FlutterEngine

/**
 * method channel 管理器
 *
 * @author jesse
 */
class MethodChannelManager constructor(private var application: Application, private var flutterEngine: FlutterEngine) {
    private lateinit var deviceInfoChannel: IMethodChannel;

    /**
     * 注册公共method channel
     */
    fun registerCommonChannels() {
        // 设备信息channel
        deviceInfoChannel = MethodDeviceInfoChannel(application, flutterEngine)
        deviceInfoChannel.register()
    }

}
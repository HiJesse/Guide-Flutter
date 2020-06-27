package cn.jesse.guideflutter.platform.channel

import android.app.Application
import cn.jesse.guideflutter.platform.channel.event.EventPerformanceChannel
import cn.jesse.guideflutter.platform.channel.method.DeviceInfoChannel
import cn.jesse.guideflutter.platform.channel.method.SecurityChannel
import io.flutter.embedding.engine.FlutterEngine

/**
 * platform channel 管理器
 *
 * @author jesse
 */
class ChannelManager constructor(var application: Application, flutterEngine: FlutterEngine) {

    private var basicChannelManager: BasicChannelManager = BasicChannelManager(application, flutterEngine)

    private var deviceInfoChannel: IChannel = DeviceInfoChannel(application, flutterEngine);
    private var securityChannel: IChannel = SecurityChannel(application, flutterEngine);

    private var performanceChannel: IChannel = EventPerformanceChannel(application, flutterEngine);

    /**
     * 注册通用功能
     */
    fun registerCommonChannel() {
        // basic channel
        basicChannelManager.registerCommonChannels()
        // method channel
        deviceInfoChannel.register()
        securityChannel.register()
        // event channel
        performanceChannel.register()
    }

}
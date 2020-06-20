package cn.jesse.guideflutter.platform.channel

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine

/**
 * platform channel 管理器
 *
 * @author jesse
 */
class ChannelManager constructor(var application: Application, flutterEngine: FlutterEngine) {

    private var basicChannelManager: BasicChannelManager = BasicChannelManager(application, flutterEngine)

    /**
     * 注册通用功能
     */
    fun registerCommonChannel() {
        basicChannelManager.registerCommonChannels()
    }

}
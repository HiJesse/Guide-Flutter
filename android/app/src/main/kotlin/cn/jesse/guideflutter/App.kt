package cn.jesse.guideflutter

import cn.jesse.magicbox.MagicBox
import cn.jesse.nativelogger.NLoggerConfig
import io.flutter.app.FlutterApplication

/**
 * 应用入口
 *
 * @author jesse
 */
class App : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        //初始化logger
        NLoggerConfig.init(this)
        // 初始化魔盒
        MagicBox.init(this)
    }
}
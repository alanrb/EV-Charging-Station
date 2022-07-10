package com.github.alanrb.evchargingstation.ui.main

import android.app.Activity
import com.github.alanrb.evchargingstation.App
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

/**
 * Created by Tuong (Alan) on 03/07/2022.
 */

class EngineBindings(private val activity: Activity, entrypoint: String, channelName: String) {
    private val channel: MethodChannel
    val engine: FlutterEngine

    init {
        val app = activity.applicationContext as App
        // This has to be lazy to avoid creation before the FlutterEngineGroup.
        val dartEntrypoint =
            DartExecutor.DartEntrypoint(
                FlutterInjector.instance().flutterLoader().findAppBundlePath(), entrypoint
            )
        engine = app.engines.createAndRunEngine(activity, dartEntrypoint)
        channel = MethodChannel(engine.dartExecutor.binaryMessenger, channelName)
    }

    fun attach(handler: MethodChannel.MethodCallHandler) {
        GeneratedPluginRegistrant.registerWith(engine)
        channel.setMethodCallHandler(handler)
        channel.invokeMethod("setData", "token_arguments")
    }

    fun detach() {
        engine.destroy()
        channel.setMethodCallHandler(null)
    }
}
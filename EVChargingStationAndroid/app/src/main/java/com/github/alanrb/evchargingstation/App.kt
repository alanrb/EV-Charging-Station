package com.github.alanrb.evchargingstation

import android.app.Application
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup

/**
 * Created by Tuong (Alan) on 01/07/2022.
 */

class App: Application() {
    lateinit var engines: FlutterEngineGroup

    override fun onCreate() {
        super.onCreate()
        engines = FlutterEngineGroup(this)
    }
}
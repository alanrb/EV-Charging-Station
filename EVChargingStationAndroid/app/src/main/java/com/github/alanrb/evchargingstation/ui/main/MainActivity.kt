package com.github.alanrb.evchargingstation.ui.main

import android.content.Context
import android.os.Bundle
import androidx.activity.viewModels
import com.github.alanrb.evchargingstation.data.model.StationModel
import com.github.alanrb.evchargingstation.ui.station.StationDetailsActivity
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterFragmentActivity() {
    private val engineBindings: EngineBindings by lazy {
        EngineBindings(activity = this, entrypoint = "main", channelName = "multiple-flutters")
    }
    private val mainViewModel: MainViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        engineBindings.attach { call, result ->
            when (call.method) {
                "station_show_details" -> {
                    call.arguments<HashMap<String, Any>>()?.let { map ->
                        val gson = Gson()
                        val stationJson = gson.toJson(map)
                        val station = gson.fromJson(stationJson, StationModel::class.java)
                        startActivity(StationDetailsActivity.startedIntent(this@MainActivity,
                            station))
                    }
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        engineBindings.detach()
    }

    override fun provideFlutterEngine(context: Context): FlutterEngine {
        return engineBindings.engine
    }

}
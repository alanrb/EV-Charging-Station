package com.github.alanrb.evchargingstation.ui.station

import android.content.Context
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import com.bumptech.glide.Glide
import com.github.alanrb.evchargingstation.data.model.StationModel
import com.github.alanrb.evchargingstation.databinding.ActivityStationDetailsBinding

class StationDetailsActivity : AppCompatActivity() {

    companion object {
        private const val DATA = "StationDetailsActivity.Data"

        fun startedIntent(context: Context, station: StationModel) =
            Intent(context, StationDetailsActivity::class.java).apply {
                putExtra(DATA, station)
            }
    }

    private lateinit var binding: ActivityStationDetailsBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityStationDetailsBinding.inflate(layoutInflater)
        setContentView(binding.root)

        intent.extras?.let {
            it.getParcelable<StationModel>(DATA)?.let { station ->
                Glide.with(applicationContext).load(station.thumb).into(binding.imgThumb)
                binding.tvTitle.text = station.title
            }
        }
    }
}
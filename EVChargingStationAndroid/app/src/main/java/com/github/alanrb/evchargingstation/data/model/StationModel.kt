package com.github.alanrb.evchargingstation.data.model

import android.os.Parcelable
import kotlinx.android.parcel.Parcelize

/**
 * Created by Tuong (Alan) on 07/07/2022.
 */

@Parcelize
data class StationModel(
    val id: Int,
    val thumb: String,
    val title: String,
    val long: Double,
    val lat: Double,
    val address: String,
    val connection: Int,
    val speed: String,
) : Parcelable
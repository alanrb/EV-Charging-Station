//
//  StationModel.swift
//  EVChargingStationiOS
//
//  Created by Tuong Nguyen on 09/07/2022.
//

import Foundation
import SwiftyJSON

struct StationModel {
    let title: String
    let thumb: String

    init(_ json: JSON) {
        self.title = json["title"].stringValue
        self.thumb = json["thumb"].stringValue
    }
}

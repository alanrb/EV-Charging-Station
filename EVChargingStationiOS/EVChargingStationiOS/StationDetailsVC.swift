//
//  StationDetailsView.swift
//  EVChargingStationiOS
//
//  Created by Tuong Nguyen on 08/07/2022.
//

import UIKit
import AlamofireImage

class StationDetailsVC: UIViewController {

    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!

    var stationModel: StationModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Dismiss",
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(leftHandAction))
        if let stationModel = stationModel {
            lblTitle.text = stationModel.title
            imgThumbnail.af_setImage(withURL: URL(string: stationModel.thumb)!)
        }
    }


    @objc func leftHandAction() {
        self.dismiss(animated: true)
    }
}

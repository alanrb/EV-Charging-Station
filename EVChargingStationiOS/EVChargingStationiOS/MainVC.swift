//
//  SingleFlutterVC.swift
//  EVChargingStationiOS
//
//  Created by Tuong Nguyen on 01/07/2022.
//

import Foundation
import SwiftyJSON
import Flutter
import FlutterPluginRegistrant

class MainVC: FlutterViewController {
    private var channel: FlutterMethodChannel?

    init(withEntrypoint entryPoint: String?) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let newEngine = appDelegate.engines.makeEngine(withEntrypoint: entryPoint, libraryURI: nil)
        GeneratedPluginRegistrant.register(with: newEngine)
        super.init(engine: newEngine, nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        channel = FlutterMethodChannel(
            name: "multiple-flutters", binaryMessenger: self.engine!.binaryMessenger)
        channel!.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "station_show_details" {

                guard let jsonData = call.arguments else {
                    fatalError("Unable get arguments")
                }
                let json = JSON(jsonData)

                guard let detailsVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "StationDetailsVC") as? StationDetailsVC else {
                    fatalError("Unable to instantiate StationDetailsVC")
                }
                detailsVC.stationModel = StationModel(json)
                if let nav = self.navigationController {
                    nav.pushViewController(detailsVC, animated: true)
                } else {
                    self.present(UINavigationController(rootViewController: detailsVC), animated: true)
                }
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
    }
}

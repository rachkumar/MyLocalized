//
//  ViewController.swift
//  LocalizationApp
//
//  Created by Raj Kumar on 08/03/20.
//  Copyright © 2020 Raj Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults.standard.set("Tamil", forKey: "App_Language")
        self.myLabel.text = "app_name".localized()
    }


}

extension String {
    func localized() ->String {
        var lang = UserDefaults.standard.string(forKey: "App_Language") ?? "English"
        switch lang {
        case "English":
            lang = "en"
            break
        case "Tamil":
            lang = "ta"
            break
        case "Chinese":
            lang = "zh-Hans"
            break
        case "Bengali":
            lang = "bn"
        default:
            lang = "en"
            break
        }
        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}

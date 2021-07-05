//
//  ViewController.swift
//  WidgetAppGroup
//
//  Created by Ashlee Muscroft on 21/06/2021.
//

import UIKit
#if canImport(WidgetKit)
    import WidgetKit
#endif
class ViewController: UIViewController {

    @IBOutlet weak var goSports: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goSportsAction(_ sender: Any) {
        #if canImport(WidgetKit) //how is this compiled when supporting iOS 13, does the app binary internally have a iOS13 and iOS14 app that's submitted to the store?
            WidgetCenter.shared.reloadAllTimelines()
        #endif
    }
    
}


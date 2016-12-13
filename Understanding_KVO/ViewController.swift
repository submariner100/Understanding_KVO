//
//  ViewController.swift
//  Understanding_KVO
//
//  Created by Macbook on 12/12/2016.
//  Copyright © 2016 Chappy-App. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     @IBOutlet var timeLable: UILabel!
     
     let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
     override func viewDidLoad() {
          super.viewDidLoad()
          
     addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt), options: [.old, .new, .initial], context: nil)
     }
     
     // MARK: - Key-Value Observing
     
     override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
     
     // Update Time Label
     
     timeLable.text = configurationManager.updatedAt
          
     }
     
     deinit {
     
          removeObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updatedAt))
     }
     
     @IBAction func updateConfiguration(sender: UIButton) {
          
          configurationManager.updateConfiguration()
     }
}

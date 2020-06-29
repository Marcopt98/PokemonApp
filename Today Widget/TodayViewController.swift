//
//  TodayViewController.swift
//  Today Widget
//
//  Created by Marco André Marinho Lopes on 25/06/2020.
//  Copyright © 2020 Marco Lopes. All rights reserved.
//

import UIKit
import NotificationCenter
import SwiftUI

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        let widgetViewController  = UIHostingController(rootView: WidgetView())
        self.addChild(widgetViewController)
        self.view.addSubview(widgetViewController.view)
        widgetViewController.didMove(toParent: self)
        
        widgetViewController.view.translatesAutoresizingMaskIntoConstraints = false
        widgetViewController.view.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        widgetViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        widgetViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        widgetViewController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        widgetViewController.view.backgroundColor = UIColor.clear
    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}

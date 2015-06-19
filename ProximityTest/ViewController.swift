//
//  ViewController.swift
//  ProximityTest
//
//  Created by Rens Wijnmalen on 19/06/15.
//  Copyright (c) 2015 YipYip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkingToggleButton: UIButton!
    @IBOutlet weak var debugLabel: UILabel!
    @IBOutlet weak var screenDebugLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkingToggleButton.setTitle("Start checking", forState: UIControlState.Normal)
        self.debugLabel.text = "Not checking"
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("proximityChanged:"), name: "UIDeviceProximityStateDidChangeNotification", object: nil)
    }

    @IBAction func handleCheckingToggle(sender: AnyObject) {
        
        let enabled = !UIDevice.currentDevice().proximityMonitoringEnabled
        if enabled {
            self.debugLabel.text = "Checking"
            self.checkingToggleButton.setTitle("Stop checking", forState: UIControlState.Normal)
        } else {
            self.debugLabel.text = "Not checking"
            self.checkingToggleButton.setTitle("Start checking", forState: UIControlState.Normal)
        }
        UIApplication.sharedApplication().idleTimerDisabled = enabled
        UIDevice.currentDevice().proximityMonitoringEnabled = enabled
        
    }
    
    func proximityChanged(notification:NSNotification)
    {
        if UIDevice.currentDevice().proximityState{
            self.screenDebugLabel.text = "Proximity true"
            println("Proximity true")
        } else {
            self.screenDebugLabel.text = "Proximity false"
            println("Proximity false")
        }
    }
    
}


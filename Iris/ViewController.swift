//
//  ViewController.swift
//  Siri
//
//  Created by Marin Todorov on 6/23/15.
//  Copyright (c) 2015 Underplot ltd. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var speakButton: UIButton!
    
    let monitor = MicMonitor()
    let assistant = Assistant()
    let replicator = CAReplicatorLayer()
    let dot = CALayer()
    
    let dotLength: CGFloat = 6.0
    let dotOffset: CGFloat = 8.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        replicator.frame = view.bounds
        view.layer.addSublayer(replicator)
        
        dot.frame = CGRect(x: view.frame.size.width - dotLength, y: view.center.y, width: dotLength, height: dotLength)
        dot.backgroundColor = UIColor.grayColor().CGColor
        dot.borderColor = UIColor(white: 1.0, alpha: 1.0).CGColor
        dot.borderWidth = 4.0
        dot.cornerRadius = 1.5
        
        replicator.addSublayer(dot)
        
        replicator.instanceCount = Int(view.frame.size.width / dotOffset)
        replicator.instanceTransform = CATransform3DMakeTranslation(-dotOffset, 0.0, 0.0)
        
        let anim = CABasicAnimation(keyPath: "position.y")
        anim.fromValue = dot.position.y
        anim.toValue = dot.position.y - 50.0
        anim.duration = 1.0
        anim.repeatCount = 10
        
        dot.addAnimation(anim, forKey: nil)
        replicator.instanceDelay = 0.2
    }
    
    @IBAction func actionStartMonitoring(sender: AnyObject) {
        
    }
    
    @IBAction func actionEndMonitoring(sender: AnyObject) {
        
        //speak after 1 second
        delay(seconds: 1.0, completion: {
            self.startSpeaking()
        })
    }
    
    func startSpeaking() {
        print("speak back")
        
        
    }
    
    func endSpeaking() {
        
    }
}
//
//  ConversionViewController.swift
//  iPhone Unit Converter Application
//
//  Created by Fazal on 2021-03-12.
//

import UIKit

class ConversionViewController: UIViewController {
    
    
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var lengthView: UIView!
    @IBOutlet weak var speedView: UIView!
    @IBOutlet weak var volumeView: UIView!
    @IBOutlet weak var timeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapSegment(segment:UISegmentedControl){
        if segment.selectedSegmentIndex == 0 {
            weightView.alpha = 1
            tempView.alpha = 0
            lengthView.alpha = 0
            speedView.alpha = 0
            volumeView.alpha = 0
            timeView.alpha = 0
        } else if segment.selectedSegmentIndex == 1 {
            weightView.alpha = 0
            lengthView.alpha = 0
            tempView.alpha = 1
            speedView.alpha = 0
            volumeView.alpha = 0
            timeView.alpha = 0
        }else if segment.selectedSegmentIndex == 2 {
            weightView.alpha = 0
            lengthView.alpha = 1
            tempView.alpha = 0
            speedView.alpha = 0
            volumeView.alpha = 0
            timeView.alpha = 0
        }else if segment.selectedSegmentIndex == 3 {
            weightView.alpha = 0
            lengthView.alpha = 0
            tempView.alpha = 0
            speedView.alpha = 1
            volumeView.alpha = 0
            timeView.alpha = 0
        }else if segment.selectedSegmentIndex == 4 {
            weightView.alpha = 0
            lengthView.alpha = 0
            tempView.alpha = 0
            speedView.alpha = 0
            volumeView.alpha = 1
            timeView.alpha = 0
        }else if segment.selectedSegmentIndex == 5 {
            weightView.alpha = 0
            lengthView.alpha = 0
            tempView.alpha = 0
            speedView.alpha = 0
            volumeView.alpha = 0
            timeView.alpha = 1
        }
        
        
    }
    
}

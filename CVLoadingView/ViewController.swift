//
//  ViewController.swift
//  CVLoadingView
//
//  Created by 范玉杰 on 2017/3/31.
//  Copyright © 2017年 范玉杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TimerDelegate {
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    weak var loadingView: LoadingView!
    weak var newtonCradle: NewTonGradleLoadingView!
    var timer: TimeMeterHelper?
    
    
    @IBAction func clickStart(_ sender: UIButton) {
        
        starLoadingView()
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func clickStop(_ sender: UIButton) {
        
        loadingView.hideLoadingView()
        newtonCradle.hideNewTonGradleView()
        start.isEnabled = true
        stop.isEnabled = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        starLoadingView()
        
        self.start.isEnabled = false
        self.stop.isEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func starLoadingView(){
        
        print("开始了")
        
        let loadingView = LoadingView.showLoadingWithView(view: self.view)
        
        let newtonCradle = NewTonGradleLoadingView.showLoadingWithView(view: self.view)
        
        self.loadingView = loadingView
        self.newtonCradle = newtonCradle
        
//        timer = TimeMeterHelper.init()
//        timer?.creatTimer(ltimer: 128)
//        timer?.delegate = self
    }
    
    func timerChange(value: String) {
        print("timer = \(value)")
    }
    
    
}


//
//  ViewController.swift
//  CVLoadingView
//
//  Created by 范玉杰 on 2017/3/31.
//  Copyright © 2017年 范玉杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    weak var loadingView: LoadingView!
    
    @IBAction func clickStart(_ sender: UIButton) {
        
        starLoadingView()
        start.isEnabled = false
        stop.isEnabled = true
    }
    
    @IBAction func clickStop(_ sender: UIButton) {
        
        loadingView.hideLoadingView()
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
        
        self.loadingView = loadingView
    }
}


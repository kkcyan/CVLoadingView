//
//  TimeMeterHelper.swift
//  CVLoadingView
//
//  Created by 范玉杰 on 2017/5/10.
//  Copyright © 2017年 范玉杰. All rights reserved.
//

//MARK: Protocol

protocol TimerDelegate :class{
    func timerChange(value: String)
}

import UIKit

class TimeMeterHelper: NSObject {

    fileprivate var timer: Timer = Timer()
    fileprivate var ltimer = Int()
    
    weak var delegate: TimerDelegate?
    
    func creatTimer(ltimer: CGFloat){
        
        self.ltimer = Int(ltimer)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                                       target:self,selector:#selector(TimeMeterHelper.changeTimer),
                                                       userInfo:nil,repeats:true)
        
//        timer = Timer.init(timeInterval: 1, target: self, selector: #selector(TimeMeterHelper.changeTimer), userInfo: nil, repeats: true)
        
//        let runLoop:RunLoop = RunLoop.init()
//        runLoop.add(timer, forMode: .defaultRunLoopMode)
        
    }
    
    func changeTimer(){
        ltimer = ltimer - 1
        
        let min: String = String(format:"%02i",ltimer/60)
        let sec: String = String(format:"%02i",ltimer%60)
        
        delegate?.timerChange(value: "\(min):\(sec)")
    }
    
    func stop() -> Void {
        timer.invalidate()
    }
    
    override init() {
        super.init()
    }
}

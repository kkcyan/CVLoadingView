//
//  NewTonGradleLoadingView.swift
//  CVLoadingView
//
//  Created by 范玉杰 on 2017/7/6.
//  Copyright © 2017年 范玉杰. All rights reserved.
//

import UIKit

private let kScreenW: CGFloat = UIScreen.main.bounds.width
private let kScreenH: CGFloat = UIScreen.main.bounds.height
private let viewColor = UIColor(r: 81, g: 188, b: 62)
private let animTime = 1.5
private let animRepeatTime:Float = 50
private let kRoundW: CGFloat = 10

class NewTonGradleLoadingView: UIView {

    let leftCycle = CAShapeLayer.init()
    let rightCycle = CAShapeLayer.init()
    
    var leftCycleV = UIView.init()
    var rightCycleV = UIView.init()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        loadCenterThreeBall()
        
        startLeftAnim()
//        startRightAnim()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("NewTonGradleLoadingView 销毁了")
    }

}

extension NewTonGradleLoadingView {
    // 加载动画在view上
    class func showLoadingWithView(view: UIView) -> NewTonGradleLoadingView {
        let loadingView = NewTonGradleLoadingView.init(frame: view.bounds)
        view.addSubview(loadingView)
        return loadingView
    }
    
    // 加载动画在Window上
    class func showLoadingWithWindow() -> NewTonGradleLoadingView {
        let lastWindow = UIApplication.shared.windows.last
        let loadingView = NewTonGradleLoadingView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        lastWindow?.addSubview(loadingView)
        return loadingView
    }
}


extension NewTonGradleLoadingView{
    func hideNewTonGradleView() {
        self.leftCycleV.layer.removeAllAnimations()
        self.rightCycleV.layer.removeAllAnimations()
        
        //直接销毁
        self.removeFromSuperview()
    }
}
    
extension NewTonGradleLoadingView{
    func loadCenterThreeBall(){
        
        let startX: CGFloat = kScreenW/2-25
        
        for index in 0...4 {
            let x: CGFloat = startX+CGFloat(index*10)
            print((x))
            
//            let  shapeLayer : CAShapeLayer = createCycle(x: CGFloat(x), y: 70)
//            self.layer .addSublayer(shapeLayer)
            
            let cycleView : UIView = creatCycleV(x: x, y: kScreenH/2)
            self .addSubview(cycleView)
            
            if index == 0 {
                leftCycleV = cycleView
            }
            if index == 4 {
                rightCycleV = cycleView
            }
        }
    }
    
    func createCycle(x:CGFloat,y:CGFloat) -> CAShapeLayer {
        
        
        let shapeLayer = CAShapeLayer.init(layer: self)
        
        let path = CGMutablePath.init()
        path.addArc(center: CGPoint.init(x: 0, y: 0), radius: 5, startAngle: 0, endAngle: CGFloat(Double.pi*2), clockwise: true)
        
        shapeLayer.path = path
        
        shapeLayer.frame = CGRect.init(x: x, y: y, width: 10, height: 10)
        
        shapeLayer.fillColor = viewColor.cgColor
        
        print("shapLayer frame ==\(shapeLayer.frame)")
        
        return shapeLayer
    }
    
    func creatCycleV(x:CGFloat,y:CGFloat) -> UIView {
        
        let cycleView = UIView.init(frame: CGRect.init(x: x, y: y, width: 10, height: 10))
        cycleView.layer.masksToBounds = true
        cycleView.layer.cornerRadius = 5
        cycleView.layer.borderColor = viewColor.cgColor
        cycleView.layer.borderWidth = 0.5
        
        cycleView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.3254901961, blue: 0.3254901961, alpha: 1)
        return cycleView
        
    }
}

extension NewTonGradleLoadingView: CAAnimationDelegate{
    
    func startLeftAnim() {
        let path = CGMutablePath.init()
        path.addArc(center: CGPoint.init(x: kScreenW/2-20, y: kScreenH/2-70), radius: 75, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi / 2) + CGFloat(Double.pi / 8), clockwise: false)
        let leftKeyFrameAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init()
        leftKeyFrameAnimation.keyPath = "position"
        leftKeyFrameAnimation.calculationMode = kCAAnimationCubic
        leftKeyFrameAnimation.path = path
        leftKeyFrameAnimation.duration = 0.4
//        leftKeyFrameAnimation.repeatCount = MAXFLOAT
        leftKeyFrameAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        leftKeyFrameAnimation.autoreverses = true
        leftKeyFrameAnimation.fillMode = kCAFillModeForwards
        leftKeyFrameAnimation.delegate = self
        leftKeyFrameAnimation.setValue("left", forKey: "left")
        self.leftCycleV.layer.add(leftKeyFrameAnimation, forKey: "leftKeyFrameAnimation")
        
    }
    
    func startRightAnim() {
        
        let path = CGMutablePath.init()
        path.addArc(center: CGPoint.init(x: kScreenW/2+20, y: kScreenH/2-70), radius: 75, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi / 2) - CGFloat(Double.pi / 8), clockwise: true)
        let rightKeyFrameAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init()
        rightKeyFrameAnimation.keyPath = "position"
        rightKeyFrameAnimation.calculationMode = kCAAnimationCubic
        rightKeyFrameAnimation.path = path
        rightKeyFrameAnimation.duration = 0.4
        rightKeyFrameAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
        rightKeyFrameAnimation.autoreverses = true
        rightKeyFrameAnimation.fillMode = kCAFillModeForwards
        rightKeyFrameAnimation.delegate = self
        rightKeyFrameAnimation.setValue("right", forKey: "right")
        self.rightCycleV.layer.add(rightKeyFrameAnimation, forKey: "rightKeyFrameAnimation")
        
    }
}

extension NewTonGradleLoadingView{
    ///动画停止
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
//        startRightAnim()
//        startLeftAnim()
        
        
        if ((anim.value(forKey: "left")) != nil)  {
            startRightAnim()
        }
        else{
            startLeftAnim()
        }
        
    }
}







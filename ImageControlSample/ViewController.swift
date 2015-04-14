//
//  ViewController.swift
//  ImageControlSample
//
//  Created by とし on 2015/04/15.
//  Copyright (c) 2015年 Toshiaki Nakamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageBeHereNow: UIImageView!
    var startPoint: CGPoint?
    var imageBeHereNowPoint: CGPoint?
    var isImageInside: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageBeHereNow.image = UIImage(named: "BeHereNow.jpg")
        
        // FIXME:イメージをタップ可能にする。
        self.imageBeHereNow.userInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
        
        let touch: UITouch = touches.first as! UITouch
        
        // FIXME:タップしたビューがUIImageViewか判断する。
        if touch.view .isKindOfClass(UIImageView){
            // UIImageViewの場合はイメージを動かせるようにする。
            isImageInside = true
            
            // タッチをやり始めた座標を取得
            startPoint = touch.locationInView(self.view)
            // タッチをやり始めた時のイメージの座標を取得
            imageBeHereNowPoint = self.imageBeHereNow.frame.origin
        }else{
            // UIImageViewでない場合はイメージを動かせないようにする。
            isImageInside = false
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
        
        if isImageInside! {
            // タッチ中の座標を取得
            let touch: UITouch = touches.first as! UITouch
            let location: CGPoint = touch.locationInView(self.view)
            
            // 移動量を計算
            let deltaX: CGFloat = CGFloat(location.x - startPoint!.x)
            let deltaY: CGFloat = CGFloat(location.y - startPoint!.y)
            
            // イメージを移動
            self.imageBeHereNow.frame.origin.x = imageBeHereNowPoint!.x + deltaX
            self.imageBeHereNow.frame.origin.y = imageBeHereNowPoint!.y + deltaY
        } else {
            // Do nothing
        }
        
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        //println("\(__FUNCTION__) is called!!")
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!) {
        //println("\(__FUNCTION__) is called!!")
    }
}


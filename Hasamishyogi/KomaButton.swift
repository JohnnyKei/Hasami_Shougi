//
//  KomaButton.swift
//  Hasamishyogi
//
//  Created by kei on 2015/02/07.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class KomaButton: UIButton {
    
    
    var xPoint: NSInteger!
    var yPoint: NSInteger!
    
    var isMine: Bool!
    
    var isSelected : Bool!
    
    override init() {
        super.init()
    }
    
    
    init(frame: CGRect, x:NSInteger, y:NSInteger, isMine:Bool) {
        self.xPoint = x
        self.yPoint = y
        self.isMine = isMine
        self.isSelected = false
        
        super.init(frame: frame)
        
        self.userInteractionEnabled = true
        self.highlighted = false
//        self.addTarget(self, action: "didTouch:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
     

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

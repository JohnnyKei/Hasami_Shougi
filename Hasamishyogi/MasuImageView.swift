//
//  MasuImageView.swift
//  Hasamishyogi
//
//  Created by kei on 2015/02/07.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class MasuImageView: UIImageView {
    
    
    var xPoint: NSInteger!
    var yPoint: NSInteger!
    
    
    override init(){
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(image: UIImage! , x:NSInteger, y:NSInteger){
        self.xPoint = x
        self.yPoint = y
        
        super.init(image: image)
    }
    
    
    init(frame: CGRect, x:NSInteger, y:NSInteger) {
        self.xPoint = x
        self.yPoint = y
        
        super.init(frame: frame)
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  KomaController.swift
//  Hasamishyogi
//
//  Created by kei on 2015/02/07.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class KomaController: NSObject {
    
    let komas: [AnyObject]!
    
    override init() {
        
        super.init()
        komas = [AnyObject]()
    }
    
    init(komas:[AnyObject]) {
        super.init()
        self.komas = komas
    }
    
    
    func initilizer(){
        
    }
    
    
   
}

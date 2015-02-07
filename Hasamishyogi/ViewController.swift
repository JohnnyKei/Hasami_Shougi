//
//  ViewController.swift
//  Hasamishyogi
//
//  Created by kei on 2015/02/07.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var komaDatas:NSMutableArray!
    var masuDatas:NSMutableArray!
//    var komaPastDatas:NSMutableArray!
    
    var currentSelectedKoma:KomaButton!
    var banImageView :UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.komaDatas = NSMutableArray()
//        self.komaPastDatas = NSMutableArray()
        self.masuDatas = NSMutableArray()
        
        self.view.userInteractionEnabled = true
        
//        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tapGesture:"))
    
        banImageView = UIImageView(frame:CGRectMake(0, 0, 320, 320))
        banImageView.userInteractionEnabled = true
        banImageView.image = UIImage(named:"ban.png");
        self.view.addSubview(banImageView);
        
        
        var undoButton = UIButton(frame: CGRectMake(40, 350, 60, 20))
        undoButton.titleLabel?.text = "待った"
        self.view.addSubview(undoButton)
        
        var myGetButton = UIButton(frame: CGRectMake(40, 350, 60, 20))
        myGetButton.titleLabel?.text = "先手:0"
        self.view.addSubview(myGetButton)
        
        var youGetButton = UIButton(frame: CGRectMake(40, 350, 60, 20))
        youGetButton.titleLabel?.text = "後手:0"
        self.view.addSubview(youGetButton)

        
        
        
        for var x = 0; x<9 ; x++ {
            
            for var y = 0; y<9 ; y++ {
                let xPoint = CGFloat( 31 * x)
                let yPoint = CGFloat( 31 * y)
//                let imgView = UIImageView(image:UIImage(named: "masu.png"))
                let imgView = MasuImageView(image: UIImage(named: "masu.png"), x: x+1, y: y+1)
                imgView.userInteractionEnabled = true
                imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "masuTapped:"))
                imgView.frame = CGRectMake(20.5 + xPoint, 20.5 + yPoint, 31, 31)
                banImageView.addSubview(imgView)
                masuDatas.addObject(imgView)
                
            }
            
        }
        
        
        for var x = 0; x<9 ; x++ {
            
            for var y = 0; y<9 ; y++ {
                let xPoint = CGFloat( 31 * x)
                let yPoint = CGFloat( 31 * y)
                if(y == 0){
                    let komaButton = KomaButton(frame: CGRectMake(20.5 + xPoint, 20.5 + yPoint, 31, 31), x: x+1, y: y+1, isMine: false)
                    komaButton.setImage(UIImage(named: "koma_to_r.png"), forState:UIControlState.Normal)
                    komaButton.addTarget(self, action: "didTouched:", forControlEvents: UIControlEvents.TouchUpInside)
                    
                    banImageView.addSubview(komaButton)
                    
                    self.komaDatas.addObject(komaButton)
                    
                    
                }else if(y == 8){
                    
                    
                    let komaButton = KomaButton(frame: CGRectMake(20.5 + xPoint, 20.5 + yPoint, 31, 31), x: x+1, y: y+1, isMine: true)
                    komaButton.setImage(UIImage(named: "koma_ho.png"), forState:UIControlState.Normal)
                    komaButton.addTarget(self, action: "didTouched:", forControlEvents: UIControlEvents.TouchUpInside)

                    banImageView.addSubview(komaButton)
                    
                    self.komaDatas.addObject(komaButton)

                    
                }
            }
        }


        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func didTouched(sender:KomaButton){
        if(sender.isMine == true){
            if((self.currentSelectedKoma) != nil){
                if(self.currentSelectedKoma == sender){
                    if(sender.isSelected == false){
                        sender.isSelected = true
                        sender.setImage(UIImage(named: "koma_ho_hover.png"), forState:UIControlState.Normal)
                        self.caluculateForMoveable(self.currentSelectedKoma)

                    }else{
                        sender.isSelected = false
                        sender.setImage(UIImage(named: "koma_ho.png"), forState:UIControlState.Normal)
                    }
                    

                }else{
                    self.currentSelectedKoma.isSelected == false
                    self.currentSelectedKoma.setImage(UIImage(named: "koma_ho.png"), forState:UIControlState.Normal)

                    sender.isSelected = true
                    self.currentSelectedKoma = sender;
                    sender.setImage(UIImage(named: "koma_ho_hover.png"), forState:UIControlState.Normal)
                    
                    self.caluculateForMoveable(self.currentSelectedKoma)


                }
            }else{
                self.currentSelectedKoma = sender
                sender.isSelected = true
                sender.setImage(UIImage(named: "koma_ho_hover.png"), forState:UIControlState.Normal)
                self.caluculateForMoveable(self.currentSelectedKoma)


            }
        }
        
        

    }
    
    func caluculateForMoveable(sender:KomaButton){
        
        var currentx = sender.xPoint
        var currenty = sender.yPoint
        
        println(currentx)
        println(currenty)
        
        var up = 0
        var bottom = 0
        var left = 0
        var right =  0
        
        for btn in self.komaDatas {
            var button = btn as KomaButton
            if(button.xPoint == currentx){
                if(currenty < button.yPoint){
                    bottom = button.yPoint - currenty
                }else if(currenty > button.yPoint){
                    up = currenty - button.yPoint
                    
                }
            }else if (button.yPoint == currenty){
                if(currentx < button.xPoint){
                    right = button.xPoint - currenty
                }else if(currenty > button.xPoint){
                    left = currenty - button.xPoint
                    
                }
                
            }
            
            
//            if(currentx != button.xPoint && currenty == button.yPoint){
//                if(button.xPoint < currentx){
//                    if(currentx - button.xPoint - 1<left){
//                    left = currentx - button.xPoint - 1
//                    }
//                    
//                }else if (button.xPoint > currentx){
//                    if(button.xPoint - currentx - 1<right){
//                    right = button.xPoint - currentx - 1
//                    }
//                }
//                
//            }else if(currenty != button.yPoint && currentx == button.xPoint){
//                if(button.yPoint < currenty){
//                    if(currenty - button.yPoint - 1<up){
//                    up = currenty - button.yPoint - 1
//                    }
//                }else if (button.yPoint > currenty){
//                    if(button.yPoint - currenty - 1<bottom){
//                    bottom = button.yPoint - currenty - 1
//                    }
//                }
//                
//            }
        }
        
        println(up)
        println(bottom)
        println(left)
        println(right)
      
        for view in self.masuDatas {
            var masu = view as MasuImageView
            
            if(masu.xPoint == currentx && masu.yPoint+up > currenty){
                masu.image = UIImage(named: "masu_hover.png")
            }else if(masu.xPoint == currenty && masu.yPoint + bottom > currenty){
                masu.image = UIImage(named: "masu_hover.png")
            }else if(masu.yPoint == currentx && masu.xPoint+right > currentx){
                masu.image = UIImage(named: "masu_hover.png")
            }else if(masu.yPoint == currenty && masu.xPoint + left > currentx){
                masu.image = UIImage(named: "masu_hover.png")
                
            }
            else{
                masu.image = UIImage(named: "masu.png")
            }
            
            
//            if(currentx == masu.xPoint && currenty == up){
//                if(masu.xPoint < currentx){
//                    if(currentx - masu.xPoint - 1<left){
//                        left = currentx - masu.xPoint - 1
//                    }
//                    
//                }else if (masu.xPoint > currentx){
//                    if(masu.xPoint - currentx - 1<right){
//                        right = button.xPoint - currentx - 1
//                    }
//                }
//                
//            }else if(currenty != masu.yPoint && currentx == masu.xPoint){
//                if(masu.yPoint < currenty){
//                    if(currenty - masu.yPoint - 1<up){
//                    }
//                }else if (masu.yPoint > currenty){
//                    if(masu.yPoint - currenty - 1<bottom){
//                    }
//                }
//                
//            }
            
        }
        
    }
    
    
    func masuTapped(sender:UITapGestureRecognizer){
        
        
        var imgView = sender.view as MasuImageView
        
        if(imgView.yPoint == self.currentSelectedKoma.yPoint || imgView.xPoint == self.currentSelectedKoma.xPoint){
            if(self.currentSelectedKoma.isSelected == true){
                //            var index:NSInteger = self.komaDatas.indexOfObject(self.currentSelectedKoma)
                let xPoint = CGFloat( 31 * (imgView.xPoint-1))
                let yPoint = CGFloat( 31 * (imgView.yPoint-1))
                
                
                let komaButton = KomaButton(frame: CGRectMake(20.5 + xPoint, 20.5 + yPoint, 31, 31), x: imgView.xPoint, y: imgView.yPoint, isMine: true)
                komaButton.setImage(UIImage(named: "koma_ho.png"), forState:UIControlState.Normal)
                komaButton.addTarget(self, action: "didTouched:", forControlEvents: UIControlEvents.TouchUpInside)
                
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.currentSelectedKoma.frame = CGRectMake(20.5 + xPoint, 20.5 + yPoint, 31, 31)
                    self.currentSelectedKoma.xPoint = imgView.xPoint
                    self.currentSelectedKoma.yPoint = imgView.yPoint
                    
                    for view in self.masuDatas {
                        var masu = view as MasuImageView
                        masu.image = UIImage(named: "masu.png")
                    }
                    
                    self.didTouched(self.currentSelectedKoma)
                })
                
            }
        }
        

    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  SpotSupply.swift
//  SMaiSuLang
//
//  Created by XYX on 15/8/14.
//  Copyright (c) 2015年 成良雨. All rights reserved.
//

import UIKit

class SpotSupply: UIViewController {
    var myLabel :UILabel = UILabel()
    var myView :UIView = UIView()
    var myButton:UIButton = UIButton()
    var myImageView :UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "现货供应"
        self.myLabel = createLabel()
        self.view.addSubview(self.myLabel)
        
        self.myView = createView()
        self.view.addSubview(self.myView)
        
        self.myButton = createButton()
        self.view.addSubview(self.myButton)
        
        self.myImageView = createImageView()
        self.view.addSubview(self.myImageView)



        // Do any additional setup after loading the view.
    }
    
    //创建uilabel 
    func createLabel() ->UILabel{
        var label:UILabel = UILabel(frame: CGRectMake(10, 80, self.view.frame.size.width-20, 50))
        label.backgroundColor = UIColor.greenColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = "hello swift"
        return label
    }
    
    //uiview 
    func createView()->UIView{
        var orginY = CGRectGetMaxX(self.myLabel.frame)+10
        var myView:UIView = UIView(frame: CGRectMake(10, orginY, self.view.frame.width-20, 30))
        myView.backgroundColor = UIColor.yellowColor()
        return myView
    }
    
    // UIButton
    func createButton() -> UIButton {
        var orginY = CGRectGetMaxY(self.myView.frame) + 10
        var button: UIButton = UIButton(frame: CGRectMake(10, orginY, self.view.frame.size.width-20, 30))
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Button", forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(12)
        button.addTarget(self, action: "tappedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        button.tag = 100
        return button
    }
    
    // UIImageView
    func createImageView() -> UIImageView {
        var orginY = CGRectGetMaxY(self.myButton.frame) + 10
        var imageView: UIImageView = UIImageView(frame: CGRectMake((self.view.frame.size.width-100)/2, orginY, 100, 50))
        var image: UIImage = UIImage(named: "user")!
        imageView.image = image
        return imageView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button target
    func tappedButton(sender:UIButton!) {
         println(sender.tag)
    }

    


}

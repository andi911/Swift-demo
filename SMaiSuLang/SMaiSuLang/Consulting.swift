//
//  Consulting.swift
//  SMaiSuLang
//
//  Created by XYX on 15/8/14.
//  Copyright (c) 2015年 成良雨. All rights reserved.
//

import UIKit

class Consulting: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
        self.navigationItem.title = "资讯"
        
        var button: UIButton = UIButton(frame: CGRectMake(10, 100, self.view.frame.size.width-20, 30))
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Button", forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.systemFontOfSize(12)
        button.addTarget(self, action: "tappedButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    
    func tappedButton(sender: UIButton) {
        var v: UIViewController = UIViewController()
        v.title = "View Controller"
        self.navigationController!.pushViewController(v, animated: true)
    }



        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

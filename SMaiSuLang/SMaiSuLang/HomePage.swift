//
//  HomePage.swift
//  SMaiSuLang
//
//  Created by XYX on 15/8/14.
//  Copyright (c) 2015年 成良雨. All rights reserved.
//

import UIKit
import Foundation

class HomePage: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var tableView:UITableView?
    var array:NSMutableArray?
    var leftButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        let hackerNewsApiUrl = "http://qingbin.sinaapp.com/api/lists?ntype=%E5%9B%BE%E7%89%87&pageNo=1&pagePer=10&list.htm"
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "首页"
        self.array = NSMutableArray()
        self.array!.addObject("111")
        self.array!.addObject("222")
        self.array!.addObject("333")
        self.array!.addObject("444")
        dropDown()
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    func dropDown(){
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: "loadData", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func setupViews(){
        self.tableView = UITableView(frame: self.view!.frame)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view?.addSubview(self.tableView!)
    }
    
    func loadData(){
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = String(format: "%i", indexPath.row+1)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
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

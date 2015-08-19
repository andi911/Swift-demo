//
//  Consulting.swift
//  SMaiSuLang
//
//  Created by XYX on 15/8/14.
//  Copyright (c) 2015年 成良雨. All rights reserved.
//
import Foundation
import UIKit
class Consulting: UITableViewController {
    var dataSource = []
    
    var thumbQueue = NSOperationQueue()
    
    let hackerNewsApiUrl = "http://qingbin.sinaapp.com/api/lists?ntype=%E5%9B%BE%E7%89%87&pageNo=1&pagePer=10&list.htm"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "XHNewsCell")
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        refreshControl.addTarget(self, action: "loadDataSource", forControlEvents: UIControlEvents.ValueChanged)
        self.refreshControl = refreshControl
        
        loadDataSource();
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDataSource() {
        self.refreshControl?.beginRefreshing()
        var url: NSURL = NSURL(string: hackerNewsApiUrl)!
        
        var request = NSURLRequest(URL: url)
        var loadDataSourceQueue = NSOperationQueue();
        
        NSURLConnection.sendAsynchronousRequest(request, queue: loadDataSourceQueue, completionHandler: { response, data, error in
            if (error != nil) {
                println(error)
                dispatch_async(dispatch_get_main_queue(), {
                    //                    self.refreshControl?.endRefreshing()
                })
            } else {
                let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSDictionary
                let newsDataSource = json["item"] as! NSArray
                
                var currentNewsDataSource = NSMutableArray()
                for currentNews : AnyObject in newsDataSource {
                    let newsItem = XHNewsItem()
                    newsItem.newsTitle = currentNews["title"] as! NSString
                    newsItem.newsThumb = currentNews["thumb"] as! NSString
                    newsItem.newsID = currentNews["id"] as! NSString
                    currentNewsDataSource.addObject(newsItem)
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.dataSource = currentNewsDataSource
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                })
            }
        })
    }
    
    // #pragma mark - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("XHNewsCell", forIndexPath: indexPath) as! UITableViewCell
        let newsItem = dataSource[indexPath.row] as! XHNewsItem
        cell.textLabel!.text = newsItem.newsTitle as String
        cell.detailTextLabel?.text = newsItem.newsID as String;
        cell.imageView!.image = UIImage(named :"cell_photo_default_small")
        cell.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
        
        var url: NSURL = NSURL(string: newsItem.newsThumb as String)!
        
        
        let request = NSURLRequest(URL :url)
        NSURLConnection.sendAsynchronousRequest(request, queue: thumbQueue, completionHandler: { response, data, error in
            if (error != nil) {
                println(error)
                
            } else {
                let image = UIImage.init(data :data)
                dispatch_async(dispatch_get_main_queue(), {
                    cell.imageView!.image = image
                })
            }
        })
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

}

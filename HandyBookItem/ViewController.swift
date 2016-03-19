//
//  ViewController.swift
//  HandyBookItem
//
//  Created by 宫澄光 on 3/19/16.
//  Copyright © 2016 cggong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var bookTableView: UITableView!
    
    var data: [bookinfo] = [
        bookinfo(title: "Odyssey", author: "Robert Fagles", isbn: "9780140268867", oncampus: 16, lowestoffer: 7.5),
        bookinfo(title: "Hortensius", author: "William Forsyth", isbn: "9781330550335", oncampus: 14, lowestoffer: 5.5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bookTableView.dataSource = self
        bookTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return data.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: BookCell = bookTableView.dequeueReusableCellWithIdentifier("BookCell", forIndexPath: indexPath) as! BookCell
        let book: bookinfo = data[indexPath.section]
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
        cell.isbnLabel.text = "ISBN: \(book.isbn)"
        cell.oncampusLabel.text = "On Campus: \(book.oncampus)"
        cell.lowestofferLabel.text = "Lowest Offer: $\(book.lowestoffer)"
        return cell
    }

}


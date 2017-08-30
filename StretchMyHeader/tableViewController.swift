//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Mohammad Shahzaib Ather on 2017-08-29.
//  Copyright © 2017 Mohammad Shahzaib Ather. All rights reserved.
//

import UIKit



private let kTableViewHeaderHeight : CGFloat = 300

class tableViewController: UITableViewController {

    
    
    var newsItemsArray : [newsItem] = []
    
    @IBOutlet weak var datelabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
       
        tableView.contentInset = UIEdgeInsetsMake(kTableViewHeaderHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint (x: 0, y: -kTableViewHeaderHeight)

      updateHeaderView()
       updateDate()
        
        newsItemsArray.append(newsItem.init(category: .World, headline: "Climate change protests, divestments meet fossil fuels realities"))
        newsItemsArray.append(newsItem.init(category: .Europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime"))
        newsItemsArray.append(newsItem.init(category: .MiddleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
        newsItemsArray.append(newsItem.init(category: .Africa, headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
        newsItemsArray.append(newsItem.init(category: .AsiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
        newsItemsArray.append(newsItem.init(category: .Americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
        newsItemsArray.append(newsItem.init(category: .World, headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
        newsItemsArray.append(newsItem.init(category: .Europe, headline: "One million babies' created by EU student exchanges"))
    }
    
    
    
    func updateDate(){
 
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd yyyy"
       
        let dateString = dateFormatter.string(from: date)
        
        self.datelabel.text = dateString
        
    }
    
    func updateHeaderView(){
        
        var headerRect = CGRect(x: 0, y: -kTableViewHeaderHeight, width: tableView.bounds.width, height: kTableViewHeaderHeight)
        if tableView.contentOffset.y < -kTableViewHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
//Tableview Methods

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        tableView.estimatedRowHeight = 65
        tableView.rowHeight = UITableViewAutomaticDimension
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? TableViewCell
      

        cell?.category.text = newsItemsArray[indexPath.row].category.name()
        cell?.headline.text = newsItemsArray[indexPath.row].headline
        cell?.category.textColor = newsItemsArray[indexPath.row].category.color()
        return cell!
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItemsArray.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }



}

 struct newsItem  {
    
        var category : Category
        var headline : String
    
  
    init(category: Category , headline: String) {
        self.category = category
        self.headline = headline
    }
    
}

enum Category {
    
    case Americas
    case Africa
    case Europe
    case MiddleEast
    case AsiaPacific
    case World
    
    
    func color() -> UIColor {
        switch self {
        case .Americas:
            return UIColor.blue
        case .Africa:
            return UIColor.orange
        case .Europe:
            return UIColor.green
        case .MiddleEast:
            return UIColor.yellow
        case .AsiaPacific:
            return UIColor.purple
        case .World:
            return UIColor.red
            
        }
    }
    
    func name() -> String{
        switch self {
        case .Americas:
                return "Americas"
        case .Africa:
                return "Africa"
        case .Europe:
                return "Europe"
        case .MiddleEast:
                return "Middle East"
        case .AsiaPacific:
                return "Asia Pacific"
        case .World:
                return "World"
                
            }
    }
}












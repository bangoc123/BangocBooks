//
//  ViewBook.swift
//  BangocBooks
//
//  Created by Ngoc on 9/22/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewBook: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var type: String!
    
//    let PDFBooks = [
//        ("abrieferhistory"),
//        ("aspoofonsexdonwireman"),
//        ("barrysworldjenvey"),
//        ("foreigneduwilliam"),
//        ("gonewithtrash"),
//        ("gospelbuckydennis"),
//        ("oddjobsbowling"),
//        ("oneclownshortwright"),
//        ("questingromana"),
//        ("thedistancetravelled")
//    ]
    
//    let DOCBooks = [
//        ("coexistcrane"),
//        ("darkkisssylviaday"),
//        ("isthislove"),
//        ("lovelikethishubbard"),
//        ("lumberlacewards")
//    
//    ]
    
    
    let DOCBooks = ["coexistcrane": "Co-exist", "darkkisssylviaday": "A Dark Kiss Of Raptune", "isthislove": "Is This Love?", "lovelikethishubbard" : "Love Like This", "lumberlacewards":"Lumber and Bace"]
    
    let HTMLBooks = [
        "computer":"Wireless Networking"
    ]
    
    
    let PDFBooks = ["abrieferhistory" : "A Brief History Of Time", "aspoofonsexdonwireman" :"A Spoof On Sex and Other Things", "barrysworldjenvey" : "Barry's World", "foreigneduwilliam" : "A Foreign Education", "gonewithtrash" : "Gone With The Trash", "gospelbuckydennis" : "The Gospel of bucky Dennis", "oddjobsbowling": "Odd-Jobs", "oneclownshortwright": "One Clown Short","questingromana"  :"Questing Adventure", "thedistancetravelled": "The Distance Travelled"]
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count: Int!
        
        switch(type){
        
        case "PDF":
            count = PDFBooks.count
        case "DOCX":
            count = DOCBooks.count
        case "HTML":
            count = HTMLBooks.count
        default:
            break
        }
        
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        var thubImage: UIImage!
        var name: String!
        
        switch type {
        case "PDF":
            thubImage = UIImage(named: (Array(PDFBooks.keys)[indexPath.item] + ".jpg"))
            name = Array(PDFBooks.values)[indexPath.item]
        case "DOCX":
            thubImage = UIImage(named: (Array(DOCBooks.keys)[indexPath.item] + ".jpg"))
            name = Array(DOCBooks.values)[indexPath.item]
        case "HTML":
            thubImage = UIImage(named: (Array(HTMLBooks.keys)[indexPath.item] + ".jpg"))
            name = Array(HTMLBooks.values)[indexPath.item]
        default:
            break
        }
        
        cell.imageView.image = thubImage
        cell.label.text = name
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailBookVC = self.storyboard?.instantiateViewControllerWithIdentifier("DetailVC") as! ViewDetailBook
        
        detailBookVC.type = type
        
        switch type {
        case "PDF":
            detailBookVC.urlString = Array(PDFBooks.keys)[indexPath.item]
            detailBookVC.webTitle = Array(PDFBooks.values)[indexPath.item]
        case "DOCX":
            detailBookVC.urlString = Array(DOCBooks.keys)[indexPath.item]
            detailBookVC.webTitle = Array(DOCBooks.values)[indexPath.item]
        case "HTML":
            break
        default:
            break
        }
        
        self.navigationController?.pushViewController(detailBookVC, animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        type = self.tabBarItem.title
        print(type)
        
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

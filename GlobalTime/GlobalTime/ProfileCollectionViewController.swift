//
//  ProfileCollectionViewController.swift
//  GlobalTime
//
//  Created by Samuel Shaw on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ProfileCollectionViewController: UICollectionViewController {

    var animationLayout: SDEFlowLayoutWithAnimation?
     var sectionCount = 3
    var itemCountInSection: [Int] = [8, 8, 8,]

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
collectionView?.backgroundColor = UIColor.whiteColor()
        animationLayout = SDEFlowLayoutWithAnimation()
        animationLayout?.itemSize = CGSize(width: 60, height: 60)
        animationLayout?.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView?.collectionViewLayout = animationLayout!
        
        
        //         Register cell classes

        // Do any additional setup after loading the view.
        let insertItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertItem")
        let deleteItem = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "deleteItem")
        let moveItem = UIBarButtonItem(title: "Move", style: .Plain, target: self, action: "moveItem")
        self.navigationItem.rightBarButtonItems = [moveItem, deleteItem, insertItem]

    }
    
    func insertItem()
    {
        let randomSection = Int(arc4random_uniform(UInt32(sectionCount)))
        let previousCount = itemCountInSection[randomSection]
        itemCountInSection[randomSection] = previousCount + 1
        let randomItem = Int(arc4random_uniform(UInt32(previousCount)))
        self.collectionView?.insertItemsAtIndexPaths([NSIndexPath(forItem: randomItem, inSection: randomSection)])
    }
    
    func deleteItem()
    {
        let randomSection = Int(arc4random_uniform(UInt32(sectionCount)))
        let previousCount = itemCountInSection[randomSection]
        if previousCount > 0
        {
            let randomItem = Int(arc4random_uniform(UInt32(previousCount)))
            let deletedIndexPath = NSIndexPath(forItem: randomItem, inSection: randomSection)
            let visibleIndexPaths = self.collectionView?.indexPathsForVisibleItems()
            let filteredIndexPaths = visibleIndexPaths?.filter({
                indexPath in
                return indexPath.section == deletedIndexPath.section && indexPath.item == deletedIndexPath.item
            })
            
            self.itemCountInSection[randomSection] = previousCount - 1
            if filteredIndexPaths?.count > 0
            {
                let deletedCell = self.collectionView?.cellForItemAtIndexPath(deletedIndexPath)
                let animationTime: NSTimeInterval = 0.5
                deletedCell?.destructWithTime(animationTime)
                self.collectionView?.performSelector("deleteItemsAtIndexPaths:", withObject: [deletedIndexPath], afterDelay: animationTime)
            }
            else
            {
                self.collectionView?.deleteItemsAtIndexPaths([deletedIndexPath])
            }
        }
    }
    
    
    func moveItem(){
        let randomSection = Int(arc4random_uniform(UInt32(sectionCount)))
        let itemCount = itemCountInSection[randomSection]
        if itemCount > 2{
            let fromItem = Int(arc4random_uniform(UInt32(itemCount)))
            var toItem = Int(arc4random_uniform(UInt32(itemCount)))
            while fromItem == toItem{
                toItem = Int(arc4random_uniform(UInt32(itemCount)))
            }
            
            let fromIndexPath = NSIndexPath(forItem: fromItem, inSection: randomSection)
            let toIndexPath = NSIndexPath(forItem: toItem, inSection: randomSection)
            
            self.collectionView?.moveItemAtIndexPath(fromIndexPath, toIndexPath: toIndexPath)
        }else{
            print("NOT ENOUGH ITEMS, TRY AGAIN")
        }
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionCount
        
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemCountInSection[section]
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
        
//       LogoCollectionViewCell

       cell.backgroundColor = UIColor(red:CGFloat(arc4random_uniform(255))/255.0, green:CGFloat(arc4random_uniform(255))/255.0, blue:CGFloat(arc4random_uniform(255))/255.0, alpha: 1)
        
        return cell
    }

    // MARK: UICollectionViewDelegate
    
    
    override func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath)
    {
        if animationLayout != nil
        {
            let filteredItems = animationLayout!.insertedItemsToAnimate.filter({
                element in
                return element.section == indexPath.section && element.item == indexPath.item
            })
            if filteredItems.count > 0
            {
                cell.refactor()
            }
        }
    }
    

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}

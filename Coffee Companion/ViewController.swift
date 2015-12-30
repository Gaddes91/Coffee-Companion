//
//  ViewController.swift
//  Coffee Companion
//
//  Created by Matthew Gaddes on 28/12/2015.
//  Copyright © 2015 Matthew Gaddes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var numberOfRemainingPods: UILabel!
    
    let model = Model()
    
    // TODO: this should update the value within the model itself (not just the label.text)!
    @IBAction func addSleeve(sender: UIButton)
    {
        if let num = Int(numberOfRemainingPods.text!) { // Check label.text can be converted to Int
            
            numberOfRemainingPods.text = String(num + 10)
        }
    }
    
    // TODO: this should update the value within the model itself (not just the label.text)!
    @IBAction func removePod(sender: UIButton)
    {
        if let num = Int(numberOfRemainingPods.text!) { // Check label.text can be converted to Int
            
            if num > 0 {
                numberOfRemainingPods.text = String(num - 1)
            }
        }
    }
    
    // MARK: START - ScrollView
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    var imageView: UIImageView!
    var pageImages: [UIImage] = []
    var pageViews: [UIImageView?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1 Associate each individual image with a page in the Scroll View
        for value in model.coffeeDetails {
            pageImages.append(value.icon)
        }
        
        // The numberOfRemainingPods shown when the view first loads should relate to the first image in the array
        numberOfRemainingPods.text = "\(model.coffeeDetails[0].quantity)"
        
        let pageCount = pageImages.count
        
        // 2
        pageControl.currentPage = 0
        pageControl.numberOfPages = pageCount
        
        // 3
        for _ in 0..<pageCount {
            pageViews.append(nil)
        }
        
        // 4
        let pagesScrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), pagesScrollViewSize.height)
        
        // 5
        loadVisiblePages()
    }
    
    func loadPage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // 1
        if let pageView = pageViews[page] {
            // Do nothing. The view is already loaded.
        } else {
            // 2
            var frame = scrollView.bounds
            frame.origin.x = frame.size.width * CGFloat(page)
            frame.origin.y = 0.0
            
            // 3
            let newPageView = UIImageView(image: pageImages[page])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = frame
            scrollView.addSubview(newPageView)
            
            // 4
            pageViews[page] = newPageView
        }
    }
    
    func purgePage(page: Int) {
        
        if page < 0 || page >= pageImages.count {
            // If it's outside the range of what you have to display, then do nothing
            return
        }
        
        // Remove a page from the scroll view and reset the container array
        if let pageView = pageViews[page] {
            pageView.removeFromSuperview()
            pageViews[page] = nil
        }
    }
    
    func loadVisiblePages() {
        
        // First, determine which page is currently visible
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        // Update the page control
        pageControl.currentPage = page
        
        // Work out which pages you want to load
        let firstPage = page - 1
        let lastPage = page + 1
        
        
        // Purge anything before the first page
        for var index = 0; index < firstPage; ++index {
            purgePage(index)
        }
        
        // Load pages in our range
        for var index = firstPage; index <= lastPage; ++index {
            loadPage(index)
        }
        
        // Purge anything after the last page
        for var index = lastPage+1; index < pageImages.count; ++index {
            purgePage(index)
        }
        
        // TODO: keep numberOfRemainingPods in sync with current coffee
        numberOfRemainingPods.text = "\(model.coffeeDetails[page].quantity)"
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        loadVisiblePages()
    }
    
    // MARK: END - ScrollView

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    


}


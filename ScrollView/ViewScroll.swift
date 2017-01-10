//
//  ViewScroll.swift
//  ScrollView
//
//  Created by Nhật Minh on 1/10/17.
//  Copyright © 2017 Nhật Minh. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var zoomSlider: UISlider!
    @IBOutlet weak var scrollView: UIScrollView!
    var photo = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView(image: UIImage(named: "shop1-0.jpg"))
        imgView.frame = CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height)
        imgView.contentMode = .scaleAspectFit
        imgView.isUserInteractionEnabled = true
        imgView.isMultipleTouchEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapImg(_:)))
        tap.numberOfTapsRequired = 1
        imgView.addGestureRecognizer(tap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapImg(_:)))
        doubleTap.numberOfTapsRequired = 2
        tap.require(toFail: doubleTap)
        imgView.addGestureRecognizer(doubleTap)
        
        photo = imgView
        
        scrollView.contentSize = CGSize(width: imgView.bounds.width, height: imgView.bounds.height)
        scrollView.minimumZoomScale = 0.5
        scrollView.maximumZoomScale = 2
        
        self.scrollView.addSubview(imgView)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView?
    {
        return photo
    }
    
    func tapImg(_ gesture: UITapGestureRecognizer)
    {
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 1.5 , center: position)
    }
    
    
    func doubleTapImg(_ gesture: UITapGestureRecognizer)
    {
        let position = gesture.location(in: photo)
        zoomRectForScale(scale: scrollView.zoomScale * 0.5 , center: position)
    }
    
    
    func zoomRectForScale(scale: CGFloat, center: CGPoint)
    {
        var zoomRect = CGRect()
        let scrollViewSize = scrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        scrollView.zoom(to: zoomRect, animated: true)
    }
    
    @IBAction func zoom(_ sender: UISlider) {
        scrollView.zoomScale = CGFloat(sender.value)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

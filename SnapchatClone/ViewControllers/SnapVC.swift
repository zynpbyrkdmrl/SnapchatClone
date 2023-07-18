//
//  SnapVC.swift
//  SnapchatClone
//
//  Created by Zeynep Bayrak Demirel on 14.07.2023.
//

import UIKit
import ImageSlideshow
import ImageSlideshowKingfisher

class SnapVC: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var inputArray = [KingfisherSource] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if let snap = selectedSnap {
            
            timeLabel.text = "Time Left: \(snap.timeDifference)"
            for imageUrl in snap.imageUrlArray {
                inputArray.append(KingfisherSource(urlString: imageUrl)!)
            }
            
            let imageSlideShow = ImageSlideshow (frame: CGRect(x: 10, y: 10, width: self.view.frame.width * 0.95, height: self.view.frame.height * 0.90 ))
            imageSlideShow.backgroundColor = UIColor.white
            
            //fotografların altınki noktalar.
            let pageIndicator = UIPageControl()
            pageIndicator.currentPageIndicatorTintColor = UIColor.lightGray //güncel sayfayı gösterir gri nokta
            pageIndicator.pageIndicatorTintColor = UIColor.black // geri kalan sayfalar siyah nokta
            imageSlideShow.pageIndicator = pageIndicator
            
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel) // seçtigin görünüm önde görünür.
            
        }
        
    }
    



}

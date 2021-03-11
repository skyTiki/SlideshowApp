//
//  ImageDetailViewController.swift
//  SlideshowApp
//
//  Created by takatoshi.ichige on 2021/03/11.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageViiew: UIImageView!
    var fileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViiew.image = UIImage(named: fileName)
    }
    
}

//
//  ViewController.swift
//  SlideshowApp
//
//  Created by takatoshi.ichige on 2021/03/11.
//

import UIKit

class ViewController: UIViewController {

    // アウトレット接続　画像表示用ボタン
    @IBOutlet weak var imageViewButton: UIButton!
    
    // アウトレット接続　画像表示制御ボタン類
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var autoSlideButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    // 画像ファイル名の配列
    let fileNameList = ["umi0076-16", "umi0178-22", "umi0179-22", "umi0181-73", "wtr0053-24", "yuu0040-013"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageViewButton.setImage(UIImage(named: fileNameList.first!), for: .normal)
    }

    // ボタンタップアクション
    // 自動再生・停止
    @IBAction func tappedAutoSlide(_ sender: Any) {
    }
    
    // 戻る
    @IBAction func tappedBackButton(_ sender: Any) {
    }
    
    // 進む
    @IBAction func tappedNextButton(_ sender: Any) {
    }
    
    
    
}


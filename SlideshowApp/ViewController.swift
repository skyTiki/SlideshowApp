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
    
    var timer: Timer!
    
    // 画像ファイル名の配列
    let fileNameList = ["umi0076-16", "umi0178-22", "umi0179-22", "umi0181-73", "wtr0053-24", "yuu0040-13"]
    // 現在表示している画像
    var selectedFileName = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageViewButton.setImage(UIImage(named: fileNameList.first!), for: .normal)
        selectedFileName = fileNameList.first!
    }
    
    // ボタンタップアクション
    // 自動再生・停止
    @IBAction func tappedAutoSlide(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideImageView(_:)), userInfo: nil, repeats: true)
            autoSlideButton.setTitle("停止", for: .normal)
            
            backButton.isEnabled = false
            nextButton.isEnabled = false
        } else {
            timer.invalidate()
            timer = nil
            
            autoSlideButton.setTitle("再生", for: .normal)
            
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
    }
    
    // 戻る
    @IBAction func tappedBackButton(_ sender: Any) {
        setBackFileName()
        changeImageView()
    }
    
    // 進む
    @IBAction func tappedNextButton(_ sender: Any) {
        setNextFileName()
        changeImageView()
    }
    
    @objc func slideImageView(_ timer: Timer) {
        setNextFileName()
        changeImageView()
    
    }
    
    
    // 次のファイルネームをselectedFileNameにセットする
    private func setNextFileName() {
        // 選択された画像のインデックスを取得
        guard let selectedFileNameIndex = fileNameList.firstIndex(where: { $0 == selectedFileName }) else { return }
        
        // 次の写真の名前を設定（最後の写真の場合は最初に戻る）
        if selectedFileNameIndex == fileNameList.count - 1 {
            selectedFileName = fileNameList[0]
        } else {
            selectedFileName = fileNameList[selectedFileNameIndex + 1]
        }
    }
    // 前のファイルネームをselectedFileNameにセットする
    private func setBackFileName() {
        // 選択された画像のインデックスを取得
        guard let selectedFileNameIndex = fileNameList.firstIndex(where: { $0 == selectedFileName }) else { return }
        
        // 前の写真の名前を設定（最初の写真の場合は最後にする）
        if selectedFileNameIndex == 0{
            selectedFileName = fileNameList[fileNameList.count - 1]
        } else {
            selectedFileName = fileNameList[selectedFileNameIndex - 1]
        }
    }
    
    // selectedFileNameに切り替える
    private func changeImageView() {
        UIView.animate(withDuration: 1) {
            self.imageViewButton.alpha = 0.5
            self.imageViewButton.setImage(UIImage(named: self.selectedFileName), for: .normal)
            self.imageViewButton.alpha = 1
        }
    }
}


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
        
        // 配列に必ず先頭が存在しているため強制アンラップ
        imageViewButton.setImage(UIImage(named: fileNameList.first!), for: .normal)
        selectedFileName = fileNameList.first!
    }
    
    // ボタンタップアクション
    // 自動再生・停止
    @IBAction func tappedAutoSlide(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(slideImageView(_:)), userInfo: nil, repeats: true)
            
            setViewStatusStart()
            
        } else {
            timer.invalidate()
            timer = nil
            
            setViewStatusStop()
        }
    }
    
    // 戻る
    @IBAction func tappedBackButton(_ sender: Any) {
        changeBackImageView()
    }
    
    // 進む
    @IBAction func tappedNextButton(_ sender: Any) {
        changeNextImageView()
    }
    
    // タイマーから呼ばれる処理
    @objc func slideImageView(_ timer: Timer) {
        changeNextImageView()
    }
    
    // 画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let imageDetailViewController = segue.destination as! ImageDetailViewController
        imageDetailViewController.fileName = selectedFileName
        
        
        // タイマーが開始されていた場合は、止める
        if timer != nil {
            timer.invalidate()
            timer = nil
            
            setViewStatusStop()
        }
    }
    
    
    // 内部処理
    // 次のファイルネームをselectedFileNameにセットする
    private func changeNextImageView() {
        // 選択された画像のインデックスを取得
        guard let selectedFileNameIndex = fileNameList.firstIndex(where: { $0 == selectedFileName }) else { return }
        
        // 次の写真の名前を設定
        // 最後の写真の場合は最初に戻る
        if selectedFileNameIndex == fileNameList.count - 1 {
            selectedFileName = fileNameList[0]
        } else {
            selectedFileName = fileNameList[selectedFileNameIndex + 1]
        }
        
        imageViewButton.setImage(UIImage(named: selectedFileName), for: .normal)
    }
    // 前のファイルネームをselectedFileNameにセットする
    private func changeBackImageView() {
        // 選択された画像のインデックスを取得
        guard let selectedFileNameIndex = fileNameList.firstIndex(where: { $0 == selectedFileName }) else { return }
        
        // 前の写真の名前を設定
        // 最初の写真の場合は最後にする
        if selectedFileNameIndex == 0{
            selectedFileName = fileNameList[fileNameList.count - 1]
        } else {
            selectedFileName = fileNameList[selectedFileNameIndex - 1]
        }
        
        imageViewButton.setImage(UIImage(named: selectedFileName), for: .normal)
    }
    
    
    private func setViewStatusStart() {
        autoSlideButton.setTitle("停止", for: .normal)
        
        // 非活性
        backButton.isEnabled = false
        nextButton.isEnabled = false
        
        backButton.backgroundColor = .lightGray
        nextButton.backgroundColor = .lightGray
    }
    
    private func setViewStatusStop() {
        autoSlideButton.setTitle("再生", for: .normal)
        
        // 活性化
        backButton.isEnabled = true
        nextButton.isEnabled = true
        
        backButton.backgroundColor = .white
        nextButton.backgroundColor = .white
    }
    
}


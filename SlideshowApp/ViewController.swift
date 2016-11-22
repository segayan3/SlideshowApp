//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Naohiro Segawa on 2016/11/21.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var beforeBtn: UIButton!
    
    var width: CGFloat = 0
    var height: CGFloat = 0
    
    // 画像番号を初期化
    var i = 0
    
    // 画像ファイル名を格納する配列
    let images = ["IMG_8889.JPG", "IMG_9453.JPG", "FullSizeRender.jpg"]
    
    // 再生停止ボタンのタップ回数
    var n = 0
    
    // Timerのインスタンスを作る
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 最初の画像を表示
        imgDisplay(n: i)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 画像がタップされた時のメソッド
    @IBAction func tapImage(_ sender: Any) {
        // segueを利用して画面遷移
        performSegue(withIdentifier: "tapSegue", sender: nil)
    }
    
    // 遷移先からsegueを利用して戻るメソッド
    @IBAction func unwind(segue: UIStoryboardSegue) {
        print("戻る")
    }
    
    // タップした画像情報をsegueを利用して渡すメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のExViewControllerのインスタンスを取得
        let exViewController: ExViewController = segue.destination as! ExViewController
        //　遷移先のExViewControllerに画像ファイル名を渡す
        let imgInfo = images[i]
        exViewController.img = imgInfo // 表示中の画像ファイル名を渡す
    }
    
    // 今表示している画像の次の画像を表示
    @IBAction func nextImage(_ sender: Any) {
        i = i + 1
        
        if(i <= 2) {
            imgDisplay(n: i)
        } else if(i == 3) {
            i = 0
            imgDisplay(n: i)
        } else {
            print("エラーです")
        }
    }
    
    // 今表示している画像の前の画像を表示
    @IBAction func beforeImage(_ sender: Any) {
        i = i - 1
        
        if(i >= 0) {
            imgDisplay(n: i)
        } else if(i == -1) {
            i = 2
            imgDisplay(n: i)
        } else {
            print("エラーです")
        }
    }
    
    // 画像を表示するメソッド
    func imgDisplay(n: Int) {
        let img = UIImage(named: images[n])
        imageView.image = img
    }
    
    // 再生停止ボタン
    @IBAction func playStopBtn(_ sender: Any) {
        if(n == 0) {
            // 進むボタンと戻るボタンをタップ不可にする
            nextBtn.isEnabled = false
            beforeBtn.isEnabled = false
            
            // timerに条件設定しスライドショーをスタート
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(ViewController.playBack), userInfo: nil, repeats: true)
            
            n = 1
        }else if(n == 1) {
            // スライドショーを停止
            timer.invalidate()
            
            n = 0
            
            // 進むボタンと戻るボタンをタップ可能にする
            nextBtn.isEnabled = true
            beforeBtn.isEnabled = true
        }

    }
    
    // スライドショーを再生するメソッド
    func playBack() {
        i = i + 1
        
        if(i <= 2) {
            imgDisplay(n: i)
        } else if(i == 3) {
            i = 0
            imgDisplay(n: i)
        } else {
            print("エラーです")
        }
    }
}


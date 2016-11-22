//
//  ExViewController.swift
//  SlideshowApp
//
//  Created by Naohiro Segawa on 2016/11/21.
//  Copyright © 2016年 segayan3. All rights reserved.
//

import UIKit

class ExViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    // viewControllerから受け取る画像情報を保存するパラメーター
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // imageViewに画像を貼り付け
        let imgEx = UIImage(named: img) // 拡大する画像のインスタンスを作成
        imageView.image = imgEx // 貼り付け
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

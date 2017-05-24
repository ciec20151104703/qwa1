//
//  ViewController.swift
//  qwa
//
//  Created by s20151104703 on 17/5/22.
//  Copyright © 2017年 s20151104703. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate{

    @IBOutlet weak var score1: UILabel!
    @IBOutlet weak var score2: UILabel!
    @IBOutlet weak var score3: UILabel!
    @IBOutlet weak var score4: UILabel!
    var a:Int = 0;
    var b:Int = 0;
    var c:Int = 0;
    var d:Int = 0;
    var dlg:Int = 0;
    var flagA:Int = 0;
    var flagB:Int = 0;
    @IBOutlet weak var phtotoone: UIImageView!
    @IBOutlet weak var phototwo: UIImageView!
    @IBAction func photo1(_ sender: UIButton) {
        if(dlg==0){
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker,animated: true,
                             completion: {
                                ()->Void in
                })
                
            }else{
                print("读取相册错误")
            }
        }

    }
    @IBAction func photo2(_ sender: UIButton) {
        if(dlg==0){
            flagA=0
            flagB=1
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //弹出控制器，显示界面
                self.present(picker,animated: true,
                             completion: {
                                ()->Void in
                })
                
            }else{
                print("读取相册错误")
            }
        }

    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看inof对象
        print(info)
        //显示的图片
        let image:UIImage!
        //获取选择原因
        image=info[UIImagePickerControllerOriginalImage] as! UIImage
        if(flagA==1){
            phtotoone.image = image
        }
        else if(flagB==1){
            phototwo.image = image
        }
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }

    @IBAction func add1(_ sender: UIButton) {
        a = a + 1;
        score1.text = ("\(a)");
        if(a >= 11 && a>=2+b){
            c = c+1;
            score3.text = ("\(c)");
            a = 0;
            b = 0;
            score1.text=("\(a)");
            score2.text = ("\(b)");
        }
        if(c == 3){
            let alertVC = UIAlertController(title: "提示", message: "甲胜！！！", preferredStyle: UIAlertControllerStyle.alert)
            a=0;
            b=0;
            c=0;
            d=0;
            score1.text=("\(c)");
            score2.text=("\(d)");
            score3.text=("\(a)");
            score4.text=("\(b)");
            let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.destructive) { (UIAlertAction) -> Void in
                print("click Sure")
            }
            let acCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) {
                (UIAlertAction) -> Void in
                print("click Cancel")
            }
            alertVC.addAction(acSure)
            alertVC.addAction(acCancel)
            self.present(alertVC, animated: true, completion: nil)
        }
        
    }
    @IBAction func add2(_ sender: UIButton) {
        b = b + 1;
        score2.text = ("\(b)");
        if(b >= 11 && b>=2+a){
            d = d+1;
            score4.text = ("\(d)");
            a = 0;
            b = 0;
            score1.text=("\(a)");
            score2.text = ("\(b)");
        }
        if(d == 3){
            let alertVC = UIAlertController(title: "提示", message: "乙胜！！！", preferredStyle: UIAlertControllerStyle.alert)
            a=0;
            b=0;
            c=0;
            d=0;
            score1.text=("\(c)");
            score2.text=("\(d)");
            score3.text=("\(a)");
            score4.text=("\(b)");
            let acSure = UIAlertAction(title: "确定", style: UIAlertActionStyle.destructive) { (UIAlertAction) -> Void in
                print("click Sure")
            }
            let acCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel) {
                (UIAlertAction) -> Void in
                print("click Cancel")
            }
            alertVC.addAction(acSure)
            alertVC.addAction(acCancel)
            self.present(alertVC, animated: true, completion: nil)
        }

    }
    
    @IBAction func rightsubtraction(_ sender: UIButton) {
        b = Int(score2.text!)!
        if(b>0){
            b = b - 1;
        }
        score2.text = ("\(b)");

    }
    @IBAction func leftsubtraction(_ sender: UIButton) {
    
            a = Int(score1.text!)!
            if(a>0){
                a = a - 1;
            }
            score1.text = ("\(a)");

    }
    @IBAction func chang(_ sender: UIButton) {
        let image = phototwo.image
        phototwo.image = phtotoone.image
        phtotoone.image = image
        let text = score2.text
        score2.text = score1.text
        score1.text = text
        let number = score4.text
        score4.text = score3.text
        score3.text = number
        let  g = c
        c = d
        d = g
        
    }
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


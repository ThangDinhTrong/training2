//
//  ViewController.swift
//  Training2
//
//  Created by dinh trong thang on 7/13/16.
//  Copyright © 2016 dinh trong thang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var maleRadio: SSRadioButton!
    @IBOutlet weak var femaleRadio: SSRadioButton!
    var radioButtonController = SSRadioButtonsController()
    
    @IBOutlet weak var emailField: UITextField!
    var emailTextBool = false
    
    @IBOutlet weak var name1: UITextField!
    
    
    @IBOutlet weak var name2: UITextField!
    
    
    @IBOutlet weak var furi1: UITextField!
    
    
    @IBOutlet weak var furi2: UITextField!
    
    
    @IBOutlet weak var birth: UITextField!
    
    @IBOutlet weak var tel1: UITextField!
    
    @IBOutlet weak var tel2: UITextField!
    
    @IBOutlet weak var tel3: UITextField!
    
    var sex:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        radioButtonController.setButtonsArray([maleRadio,femaleRadio])
        radioButtonController.delegate = self
        maleRadio.selected = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(sender: UIButton) {
        if name1.text?.characters.count < 1 || name2.text?.characters.count < 1 ||
            furi1.text?.characters.count < 1 ||
            furi2.text?.characters.count < 1 ||
            birth.text?.characters.count < 1 ||
            tel1.text?.characters.count < 1 ||
            emailField.text?.characters.count < 1 ||
            tel2.text?.characters.count < 1 ||
            tel3.text?.characters.count < 1 {
            //alert
            let alertController = UIAlertController(title:"Warning",message:"Nhap thieu thong tin",preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Default,handler:nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            return
            
        }
        
        
        if emailField.text?.characters.count > 0 {
            let emailStr = emailField.text
            if emailStr![(emailStr?.startIndex)!] == "@" {
                emailTextBool = false
                //alert thong bao
                let alertController = UIAlertController(title:"Warning",message:"Nhap sai dinh dang",preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Default,handler:nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                return
                
            }
            else {
                var haveAcong = false
                var haveDot = false
                
                for char in (emailStr?.characters)! {
                    if char == "@" && haveAcong == true {
                        haveAcong = false
                        emailTextBool = false
                        break
                    }
                    if char == "@" {
                        haveAcong = true
                    }
                    if haveAcong == true {
                        if char == "." {
                            haveDot = true
                        }
                    }
        
                }
                
                if haveAcong == true && haveDot == true {
                    emailTextBool = true
                }
                
                if emailTextBool == false {
                    //alert thong bao
                    let alertController = UIAlertController(title:"Warning",message:"Nhap sai dinh dang",preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Default,handler:nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                    return
                }
            }
            
        }
        

        //in ket qua
        print("Ten khach hang:\t \(name1.text!) \(name2.text!)")
        print("Furigana:\t\t \(furi1.text!) \(furi2.text!)")
        print("Email:\t\t\t \(emailField.text!)")
        print("Ngay sinh:\t\t \(birth.text!)")
        print("Gioi tinh:\t\t \(sex)")
        print("Dien thoai:\t\t \(tel1.text!) \(tel2.text!) \(tel3.text!)")
        
        let alertController = UIAlertController(title:"",message:"Thanh cong",preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title:"Cancel", style:UIAlertActionStyle.Default,handler:nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

}

extension ViewController: SSRadioButtonControllerDelegate{
    func didSelectButton(aButton: UIButton?) {
        if (aButton?.titleLabel?.text == "男性"){
            sex = "男性"
        }
        else {
            sex = "女性"
        }
    }
}

//
//  LoginViewController.swift
//  ChaChaChart
//
//  Created by  NateRobinson on 2019/4/9.
//  Copyright © 2019  NateRobinson. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.text = "nate"
        passwordTextfield.text = "123456"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        BmobUser.loginWithUsername(inBackground: nameTextfield.text!, password: passwordTextfield.text!){
            (user, error) in
            SVProgressHUD.dismiss()
            if error != nil {
                print(error!.localizedDescription)
            } else {
                print("登录成功")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

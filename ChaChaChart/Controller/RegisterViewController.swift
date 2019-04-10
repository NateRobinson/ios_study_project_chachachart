//
//  RegisterViewController.swift
//  ChaChaChart
//
//  Created by  NateRobinson on 2019/4/9.
//  Copyright © 2019  NateRobinson. All rights reserved.
//

import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        
        //TODO: Set up a new user on our Bomb database
        let user = BmobUser()
        user.username = nameTextField.text!
        user.password = passwordTextfield.text!
        
        user.signUpInBackground() { (isSuccessful, error) in
            if isSuccessful {
                print("注册成功")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }else{
                SVProgressHUD.dismiss()
                print("注册失败，错误原因：\(error!.localizedDescription)")
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

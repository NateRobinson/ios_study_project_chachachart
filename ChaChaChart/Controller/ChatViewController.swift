//
//  ChatViewController.swift
//  ChaChaChart
//
//  Created by  NateRobinson on 2019/4/9.
//  Copyright © 2019  NateRobinson. All rights reserved.
//

import UIKit
import ChameleonFramework

class ChatViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let messageArray = ["1","2","3"]
        cell.messageText.text = messageArray[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var messageTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        //configureTableView()
        messageTableView.rowHeight = 88
        messageTextfield.delegate = self
        // Do any additional setup after loading the view.
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
         messageTableView.register(UINib(nibName: "CustomMessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        
        messageTableView.separatorStyle = .none
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
    }
    
    @objc func tableViewTapped() {
        messageTextfield.endEditing(true)
    }
    

    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        messageTextfield.endEditing(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5, animations: {
            self.heightConstraint.constant = 318
            self.view.layoutIfNeeded()
        })
    }
    
    
    
    //TODO: Declare textFieldDidEndEditing here:
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func logoutPressed(_ sender: Any) {
        BmobUser.logout()
        navigationController?.popToRootViewController(animated: true)
    }
}

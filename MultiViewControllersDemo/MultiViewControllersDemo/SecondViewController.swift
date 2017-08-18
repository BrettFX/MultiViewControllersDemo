//
//  SecondViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/18/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

protocol MyProtocol{
    func setResultOfBusinessLogic(valueSent: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: MyProtocol?
    
    var myStringValue: String?
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Provides default value of ""
        myLabel.text = "\(myStringValue ?? "")... Please enter your last name."
        
        self.myTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("The value of myStringValue is: \(myStringValue!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goBack(_ sender: Any) {
        if(myTextField.text?.isEmpty)!{
            return
        }
        
        let fullName: String = "\(myStringValue ?? "") \(myTextField.text ?? "")"
        
        delegate?.setResultOfBusinessLogic(valueSent: fullName)
        dismiss(animated: true, completion: nil)
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

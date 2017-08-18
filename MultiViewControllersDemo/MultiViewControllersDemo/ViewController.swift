//
//  ViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/18/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyProtocol, UITextFieldDelegate {
    
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var valueSentFromSecondViewController: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.myTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let valueToDisplay: String = valueSentFromSecondViewController! == "" ? "None" : valueSentFromSecondViewController!
        
        print("Value from display = \(valueToDisplay)")
        
        if(valueSentFromSecondViewController != ""){
            myLabel.text! = "Welcome \(valueSentFromSecondViewController ?? ""), you are quite the programming genious!"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        self.view.endEditing(true)
        return false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButtonTapped(_ sender: Any) {
        if(myTextField.text?.isEmpty)!{
            return
        }
        
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        secondViewController.myStringValue = myTextField.text
        
        //IMPORTANT: for being able to pass data back
        secondViewController.delegate = self
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    func setResultOfBusinessLogic(valueSent: String){
        self.valueSentFromSecondViewController = valueSent
    }
}


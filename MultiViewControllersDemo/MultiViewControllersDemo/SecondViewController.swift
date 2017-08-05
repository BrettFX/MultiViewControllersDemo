//
//  SecondViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/3/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func setResultOfBusinessLogic(valueSent: String)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var delegate: MyProtocol?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtLastName: UITextField!
    
    var myString = String()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let lastName: String = txtLastName.text!
        delegate?.setResultOfBusinessLogic(valueSent: lastName)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text! = "\(myString)... Please enter your last name."
        self.txtLastName.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        self.view.endEditing(true)
        return false
    }
    
    
    @IBAction func back(_ sender: Any) {
        if(txtLastName.text != ""){
            performSegue(withIdentifier: "passBackSegue", sender: self)
            dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let firstController = segue.destination as! ViewController
        firstController.firstName = label.text!
        firstController.lastName = txtLastName.text!
    }
    

}

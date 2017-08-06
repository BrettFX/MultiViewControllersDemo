//
//  ViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/2/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//
//  http://swiftdeveloperblog.com/pass-information-back-to-the-previous-view-controller/
//

import UIKit

class ViewController: UIViewController, MyProtocol{

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var lblWelcome: UILabel!
    
    var firstName: String = ""
    var lastName: String = ""
    
    @IBAction func enter(_ sender: Any) {
        if(txtInput.text != ""){
            let secondController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            
            secondController.delegate = self
            
            self.navigationController?.pushViewController(secondController, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(lastName != ""){
            print("Value from display = \(lastName)")
            lblWelcome.text! = "Welcome \(firstName) \(lastName)!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setResultOfBusinessLogic(valueSent: String){
        lastName = valueSent
    }
}


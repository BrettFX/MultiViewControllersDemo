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
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(lastName != ""){
           print("Value from display = \(lastName)")
        }
    }
    
    /**Code is performed before segue is performed*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.myString = txtInput.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstName != "" && lastName != ""){
            lblWelcome.text! = "Welcome \(firstName) \(lastName)!"
        }else{
            lblWelcome.text! = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setResultOfBusinessLogic(valueSent: String){
        
    }
}


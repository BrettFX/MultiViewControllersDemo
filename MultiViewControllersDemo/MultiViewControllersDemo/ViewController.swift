//
//  ViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/18/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyProtocol {
    
    @IBOutlet weak var myTextField: UITextField!
    
    var valueSentFromSecondViewController: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let valueToDisplay: String = (valueSentFromSecondViewController?.isEmpty)! ? "None" : valueSentFromSecondViewController!
        
        print("Value from display = \(valueToDisplay)")
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


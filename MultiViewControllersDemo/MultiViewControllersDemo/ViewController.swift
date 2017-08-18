//
//  ViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/18/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}


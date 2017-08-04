//
//  ViewController.swift
//  MultiViewControllersDemo
//
//  Created by Brett Allen on 8/2/17.
//  Copyright © 2017 Brett Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var lblLastName: UILabel!
    
    var lastName = String()
    
    @IBAction func enter(_ sender: Any) {
        if(txtInput.text != ""){
            performSegue(withIdentifier: "segue", sender: self)
        }
    }
    
    /**Code is performed before segue is performed*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondController = segue.destination as! SecondViewController
        secondController.myString = txtInput.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


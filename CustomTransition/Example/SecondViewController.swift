//
//  SecondViewController.swift
//  CustomTransition
//
//  Created by Mayank Rikh on 10/08/20.
//  Copyright © 2020 Mayank Rikh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    //MARK:- IBAction
    @IBAction func crossAction(_ sender: UIButton) {

        dismiss(animated: true, completion: nil)
    }
}

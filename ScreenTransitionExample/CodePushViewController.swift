//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by yc on 2021/09/03.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
 
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

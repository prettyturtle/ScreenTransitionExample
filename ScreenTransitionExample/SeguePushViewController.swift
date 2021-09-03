//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by yc on 2021/09/03.
//

import UIKit

class SeguePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
//        self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기
    }
    
}

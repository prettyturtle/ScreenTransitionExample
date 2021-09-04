//
//  SeguePushViewController.swift
//  ScreenTransitionExample
//
//  Created by yc on 2021/09/03.
//

import UIKit

class SeguePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SeguePushViewController에서 viewDidLoad가 실행되었다")
        
        if let name = name {
            self.nameLabel.text = name
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePushViewController에서 viewWillAppear가 실행되었다")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePushViewController에서 viewDidAppear가 실행되었다")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePushViewController에서 viewWillDisapper가 실행되었다")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SeguePushViewController에서 viewDidDisapper가 실행되었다")
    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true) // 이전 화면으로 가기
//        self.navigationController?.popToRootViewController(animated: true) // 루트 뷰로 가기
    }
    
}

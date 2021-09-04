//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by yc on 2021/09/03.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    // 화면간 데이터 전달 확인
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    // weak 필수
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = name {
            self.nameLabel.text = name
        }
    }
    

    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "이전 화면으로부터 데이터를 전달 받았습니다")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

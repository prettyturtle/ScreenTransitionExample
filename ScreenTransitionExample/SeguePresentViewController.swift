//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by yc on 2021/09/03.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SeguePresentViewController에서 viewDidLoad가 실행되었다")

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePresentViewController에서 viewWillAppear가 실행되었다")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("SeguePresentViewController에서 viewDidAppear가 실행되었다")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SeguePresentViewController에서 viewWillDisapper가 실행되었다")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("SeguePresentViewController에서 viewDidDisapper가 실행되었다")
    }
    

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}

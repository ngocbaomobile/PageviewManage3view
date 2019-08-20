//
//  ViewController.swift
//  ReportViewController
//
//  Created by Ngoc on 8/20/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedIdex: Int = 0 {
        didSet {
            let sender = headerButtons[selectedIdex]
            UIView.animate(withDuration: 0.35) {
                self.buttonLine.frame = CGRect(x: sender.frame.minX, y: sender.frame.maxY, width: sender.frame.width, height: 2)
            }
        }
    }
    
    @IBOutlet var headerButtons: [UIButton]!
    @IBOutlet weak var buttonLine: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIdex = 1
    }

    @IBAction func onClickButton(sender: UIButton) {
        selectedIdex = headerButtons.firstIndex(of: sender) ?? 0
        if let titleButton = sender.currentTitle {
            switch titleButton {
            case "Bán Hàng":
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "banhang"), object: nil)
            case "Kho":
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kho"), object: nil)
            default:
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "taichinh"), object: nil)
            }
        }
    }

}


//
//  CustomNavController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/9/21.
//

//
//  ViewController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/8/21.
//

import UIKit

class HomeNavigationController: UINavigationController {
    
    override public init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.backgroundColor = .blue
        }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


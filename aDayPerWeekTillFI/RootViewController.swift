//
//  ViewController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/8/21.
//

import UIKit

class RootViewController: UITabBarController {
    
    public init() {
        bottomNav = UITabBar()
        topBar = UINavigationBar()
        super.init(nibName: nil, bundle: nil)
        setUpviews()

        }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setUpviews()
        
    }
    
    public var bottomNav: UITabBar
    public var topBar: UINavigationBar
    
    private func setUpviews(){
        view.addSubview(bottomNav)
        
        let home = HomeScreenViewController(title: "Weekly Allowance")
        
        
        let navController1 = HomeNavigationController(rootViewController: home)
        navController1.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        viewControllers = [
            navController1
        ]
        
    }

    @objc func add(){}

}


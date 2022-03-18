//
//  ViewController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/8/21.
//

import UIKit

class HomeScreenViewController: UIViewController, ModalDelegate {
    func changeValue(value: Float) {
        weeklyBudgeNumber += value
        weeklyBudgetLabel.text = "$\(weeklyBudgeNumber)"
       
    }
    

    public init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        view.backgroundColor = .systemBackground

        setUpviews()
        }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var weeklyBudgeNumber: Float = 400
    private var weeklyBudgetLabel: UILabel = UILabel()
    private var weeklyDatesLabel: UILabel = UILabel()
    private var moneyLeftLabel: UILabel = UILabel()
    private var addMoneyButton: UIButton = UIButton(type: .roundedRect)
    private var subtractMoneyButton: UIButton = UIButton(type: .roundedRect)

    
    private func setUpviews(){
        setUpWeeklyDateLabel()
        setUpWeeklyBudgetLabel()
        setUpMoneyLeftLabel()
        setUpAddSubtractButtons()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    private func setUpWeeklyDateLabel(){
        weeklyDatesLabel.translatesAutoresizingMaskIntoConstraints = false
        weeklyDatesLabel.text = "November 8th - November 14th"
        
        view.addSubview(weeklyDatesLabel)
        
        weeklyDatesLabel.textAlignment = .center
        weeklyDatesLabel.adjustsFontSizeToFitWidth = true
        
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .subheadline)
            .addingAttributes([.traits : [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]])

            let semiboldFont = UIFont(descriptor: descriptor, size: 25)
        
        weeklyBudgetLabel.font = semiboldFont
        
        NSLayoutConstraint.activate([
            weeklyDatesLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            weeklyDatesLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 0),
            weeklyDatesLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: 0)
        ])
    }
    
    private func setUpWeeklyBudgetLabel(){
        weeklyBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        weeklyBudgetLabel.text = "$\(weeklyBudgeNumber)"
        
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline)
                .addingAttributes([.traits : [UIFontDescriptor.TraitKey.weight: UIFont.Weight.semibold]])

            let semiboldFont = UIFont(descriptor: descriptor, size: 80)
        
        weeklyBudgetLabel.font = semiboldFont
        
        
        weeklyBudgetLabel.textAlignment = .center
        weeklyBudgetLabel.adjustsFontSizeToFitWidth = true

        view.addSubview(weeklyBudgetLabel)



        NSLayoutConstraint.activate([
            weeklyBudgetLabel.topAnchor.constraint(equalTo: weeklyDatesLabel.bottomAnchor, constant: 10),
            weeklyBudgetLabel.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor, constant: 0),
            weeklyBudgetLabel.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor, constant: 0)
        ])
        
    }
    
    private func setUpMoneyLeftLabel() {
        moneyLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        moneyLeftLabel.text = "Left to spend this week"
        
        let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .caption1)
            .addingAttributes([.traits : [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]])

            let semiboldFont = UIFont(descriptor: descriptor, size: 20)
        
        moneyLeftLabel.font = semiboldFont
        
        moneyLeftLabel.textAlignment = .center
        
        view.addSubview(moneyLeftLabel)
        
        NSLayoutConstraint.activate([
            moneyLeftLabel.topAnchor.constraint(equalTo: weeklyBudgetLabel.bottomAnchor, constant: 0),
            moneyLeftLabel.leadingAnchor.constraint(equalTo: weeklyBudgetLabel.leadingAnchor, constant: 0),
            moneyLeftLabel.trailingAnchor.constraint(equalTo: weeklyBudgetLabel.trailingAnchor, constant: 0)
        ])
    }
    
    @objc func prepareForAddMoneyVC(){
        let vc = AddMoneyViewController(title: "Add money")
        vc.delegate = self   
        self.navigationController?.present(vc, animated: true)

    }
    
    @objc func prepareForAddSubtractVC(){
        let vc = SubtractMoneyViewController(title: "Subtract money")
        vc.delegate = self
        self.navigationController?.present(vc, animated: true)

    }
    
    private func setUpAddSubtractButtons(){
        addMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        subtractMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        
        addMoneyButton.addTarget(self, action: #selector(prepareForAddMoneyVC), for: .touchUpInside)
        subtractMoneyButton.addTarget(self, action: #selector(prepareForAddSubtractVC), for: .touchUpInside)
        
        addMoneyButton.setTitle("Add money", for: .normal)
        subtractMoneyButton.setTitle("Subtract money", for: .normal)


        
        view.addSubview(addMoneyButton)
        view.addSubview(subtractMoneyButton)
        
        NSLayoutConstraint.activate([
            addMoneyButton.topAnchor.constraint(equalTo: moneyLeftLabel.bottomAnchor, constant: 10),
            subtractMoneyButton.topAnchor.constraint(equalTo: moneyLeftLabel.bottomAnchor, constant: 10),
            addMoneyButton.leadingAnchor.constraint(equalTo: weeklyBudgetLabel.leadingAnchor, constant: 60),
            subtractMoneyButton.leadingAnchor.constraint(equalTo: addMoneyButton.trailingAnchor, constant: 10)
        ])
        
    }
    
  
}


protocol ModalDelegate {
    func changeValue(value: Float)
}


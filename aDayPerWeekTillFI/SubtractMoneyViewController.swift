//
//  AddMoneyViewController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/12/21.
//

import UIKit

class SubtractMoneyViewController: UIViewController {
    var delegate: ModalDelegate?
    var moneyToSubtract: Float = 0
    
    let subtractMoneyLabel: UILabel = UILabel()
    
    var closeButton: UIButton = UIButton(type: .close)
    private var subtractMoneyButton: UIButton = UIButton(type: .roundedRect)
    let subtractMoneyInput: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 100.00));

    public init(title: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        view.backgroundColor = .green

        setUpViews()
        }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func dismissModal(){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureTextField() {
        subtractMoneyInput.delegate = self
    }
    
    private func setUpSubtractButton() {
        subtractMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        subtractMoneyButton.setTitle("Save", for: .normal)
        subtractMoneyButton.addTarget(self, action: #selector(subtractAmountFromTextField), for: .touchUpInside)
        self.view.addSubview(subtractMoneyButton)
        
        NSLayoutConstraint.activate([
            subtractMoneyButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            subtractMoneyButton.topAnchor.constraint(equalTo: subtractMoneyInput.bottomAnchor,constant: 5)
        ])
    }
    
    private func setUpAddMoneyLabel() {
        subtractMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        subtractMoneyLabel.text = "Subtract a dollar amount"
        subtractMoneyLabel.font.withSize(40)
        
        self.view.addSubview(subtractMoneyLabel)
        
        NSLayoutConstraint.activate([
            subtractMoneyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            subtractMoneyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            subtractMoneyLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
        ])
        
        
    }
    
    
    
    func setUpViews(){
        configureTextField()
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.accessibilityLabel = "close"
        
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        subtractMoneyInput.translatesAutoresizingMaskIntoConstraints = false
        
        
        subtractMoneyInput.backgroundColor = .white
        subtractMoneyInput.placeholder = "0"
        
        
        self.view.addSubview(subtractMoneyInput)
        self.view.addSubview(closeButton)
        setUpAddMoneyLabel()
        setUpSubtractButton()

        
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            subtractMoneyInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            subtractMoneyInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            subtractMoneyInput.topAnchor.constraint(equalTo: subtractMoneyLabel.bottomAnchor, constant: 10),
        ])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   @objc private func subtractAmountFromTextField() {
    if let newValue = subtractMoneyInput.text {
        if let num = Float(newValue), let delegate = self.delegate {
            delegate.changeValue(value: -num)
        }}
        
        dismissModal()
    }
    
    

}


extension SubtractMoneyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        subtractMoneyInput.resignFirstResponder()
        subtractAmountFromTextField()
    
        return true
    }
}






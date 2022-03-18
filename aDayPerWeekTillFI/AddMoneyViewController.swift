//
//  AddMoneyViewController.swift
//  aDayPerWeekTillFI
//
//  Created by Anderson Day on 11/12/21.
//

import UIKit

class AddMoneyViewController: UIViewController {
    var delegate: ModalDelegate?
    var moneyToAdd: Float = 0
    
    let addMoneyLabel: UILabel = UILabel()
    
    var closeButton: UIButton = UIButton(type: .close)
    private var addMoneyButton: UIButton = UIButton(type: .roundedRect)
    let addMoneyInput: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 100.00));

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
        addMoneyInput.delegate = self
    }
    
    private func setUpAddButton() {
        addMoneyButton.translatesAutoresizingMaskIntoConstraints = false
        addMoneyButton.setTitle("Save", for: .normal)
        addMoneyButton.addTarget(self, action: #selector(addAmountFromTextField), for: .touchUpInside)
        self.view.addSubview(addMoneyButton)
        
        NSLayoutConstraint.activate([
            addMoneyButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            addMoneyButton.topAnchor.constraint(equalTo: addMoneyInput.bottomAnchor,constant: 5)
        ])
    }
    
    private func setUpAddMoneyLabel() {
        addMoneyLabel.translatesAutoresizingMaskIntoConstraints = false
        addMoneyLabel.text = "Add a dollar amount"
        addMoneyLabel.font.withSize(40)
        
        self.view.addSubview(addMoneyLabel)
        
        NSLayoutConstraint.activate([
            addMoneyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            addMoneyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            addMoneyLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 10),
        ])
        
        
    }
    
    
    
    func setUpViews(){
        configureTextField()
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.accessibilityLabel = "close"
        
        closeButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
        
        addMoneyInput.translatesAutoresizingMaskIntoConstraints = false
        
        
        addMoneyInput.backgroundColor = .white
        addMoneyInput.placeholder = "0"
        
        
        self.view.addSubview(addMoneyInput)
        self.view.addSubview(closeButton)
        setUpAddMoneyLabel()
        setUpAddButton()

        
        
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10),
            addMoneyInput.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            addMoneyInput.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10),
            addMoneyInput.topAnchor.constraint(equalTo: addMoneyLabel.bottomAnchor, constant: 10),
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
    
   @objc private func addAmountFromTextField() {
    if let newValue = addMoneyInput.text {
        if let num = Float(newValue), let delegate = self.delegate {
            delegate.changeValue(value: num)
        }}
        
        dismissModal()
    }
    
    

}


extension AddMoneyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addMoneyInput.resignFirstResponder()
        addAmountFromTextField()
    
        return true
    }
}






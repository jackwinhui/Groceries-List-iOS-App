//
//  ViewController.swift
//  jkh232_p2
//
//  Created by Jackwin Hui on 10/5/19.
//  Copyright © 2019 Jackwin Hui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nameLabel: UILabel!
    var groceryTextView: UITextView!
    var groceryTextField: UITextField!
    var quantityTextView: UITextView!
    var quantityTextField: UITextField!
    var addButton: UIButton!
    var removeButton: UIButton!
    var changeButton: UIButton!
    var groceriesList = [String : String]()
    var listTextView: UITextView!
    var groceriesString = "GROCERY LIST: \n"
    
    var isAdded: Bool = false

    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        nameLabel = UILabel()
        nameLabel.text = "Groceries List"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        groceryTextView = UITextView()
        groceryTextView.text = "Grocery Item: "
        groceryTextView.textColor = .white
        groceryTextView.backgroundColor = .black
        groceryTextView.textAlignment = .right
        groceryTextView.isEditable = false
        groceryTextView.font = UIFont.systemFont(ofSize: 20)
        groceryTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(groceryTextView)
        
        groceryTextField = UITextField()
        groceryTextField.placeholder = "i.e. Apples"
        groceryTextField.textColor = .black
        groceryTextField.font = UIFont.systemFont(ofSize: 20)
        groceryTextField.translatesAutoresizingMaskIntoConstraints = false
        groceryTextField.textAlignment = .center
        groceryTextField.backgroundColor = .white
        groceryTextField.layer.borderColor = UIColor.systemBlue.cgColor
        view.addSubview(groceryTextField)
                
        quantityTextView = UITextView()
        quantityTextView.text = "Quantity: "
        quantityTextView.textColor = .white
        quantityTextView.backgroundColor = .black
        quantityTextView.textAlignment = .right
        quantityTextView.isEditable = false
        quantityTextView.font = UIFont.systemFont(ofSize: 20)
        quantityTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityTextView)
        
        quantityTextField = UITextField()
        quantityTextField.placeholder = "i.e. 2"
        quantityTextField.textColor = .black
        quantityTextField.font = UIFont.systemFont(ofSize: 20)
        quantityTextField.translatesAutoresizingMaskIntoConstraints = false
        quantityTextField.textAlignment = .center
        quantityTextField.backgroundColor = .white
        quantityTextField.layer.borderColor = UIColor.systemBlue.cgColor
        view.addSubview(quantityTextField)
    
        addButton = UIButton()
        addButton.backgroundColor = .lightGray
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        addButton.setTitle("Add item", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.layer.borderWidth = 1
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        view.addSubview(addButton)
        
        removeButton = UIButton()
        removeButton.backgroundColor = .lightGray
        removeButton.addTarget(self, action: #selector(removeButtonPressed), for: .touchUpInside)
        removeButton.setTitle("Remove item", for: .normal)
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.layer.borderWidth = 1
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        view.addSubview(removeButton)

        changeButton = UIButton()
        changeButton.backgroundColor = .lightGray
        changeButton.addTarget(self, action: #selector(changeButtonPressed), for: .touchUpInside)
        changeButton.setTitle("Change quantity", for: .normal)
        changeButton.setTitleColor(.black, for: .normal)
        changeButton.layer.borderWidth = 1
        changeButton.translatesAutoresizingMaskIntoConstraints = false
        changeButton.contentEdgeInsets = UIEdgeInsets(top: 20, left: 40, bottom: 20, right: 40)
        view.addSubview(changeButton)
        
        listTextView = UITextView()
        listTextView.text = groceriesString
        listTextView.textColor = .white
        listTextView.backgroundColor = .black
        listTextView.isEditable = false
        listTextView.font = UIFont.systemFont(ofSize: 20)
        listTextView.textAlignment = .center
        listTextView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listTextView)
        
        setupConstraints()
    }

    // MARK: - Constraints
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            groceryTextView.topAnchor.constraint(equalTo:nameLabel.bottomAnchor,constant:20),
            groceryTextView.heightAnchor.constraint(equalToConstant: 40),
            groceryTextView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            groceryTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            groceryTextField.topAnchor.constraint(equalTo:nameLabel.bottomAnchor,constant:25),
            groceryTextField.heightAnchor.constraint(equalToConstant: 30),
            groceryTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2-30),
            groceryTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            quantityTextView.topAnchor.constraint(equalTo:groceryTextView.bottomAnchor,constant:15),
            quantityTextView.heightAnchor.constraint(equalToConstant: 40),
            quantityTextView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            quantityTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            quantityTextField.topAnchor.constraint(equalTo:groceryTextField.bottomAnchor,constant:25),
            quantityTextField.heightAnchor.constraint(equalToConstant: 30),
            quantityTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2-30),
            quantityTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor, constant: 25),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5),
            addButton.heightAnchor.constraint(equalToConstant:25),
        ])
        
        NSLayoutConstraint.activate([
            removeButton.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            removeButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5),
            removeButton.heightAnchor.constraint(equalToConstant:25),
        ])
        
        NSLayoutConstraint.activate([
            changeButton.topAnchor.constraint(equalTo: removeButton.bottomAnchor, constant: 10),
            changeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            changeButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/1.5),
            changeButton.heightAnchor.constraint(equalToConstant:25),
        ])
        
        NSLayoutConstraint.activate([
            listTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            listTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            listTextView.topAnchor.constraint(equalTo: changeButton.bottomAnchor, constant: 20),
            listTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - AddButtonPressed
    @objc func addButtonPressed() {
        let bothError = UIAlertController(title: "Error", message: "Please enter a grocery item and a quantity for your grocery item.", preferredStyle: UIAlertController.Style.alert)
        bothError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let groceryError = UIAlertController(title: "Error", message: "Please enter a grocery item.", preferredStyle: UIAlertController.Style.alert)
        groceryError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        let quantityError = UIAlertController(title: "Error", message: "Please enter a quantity for your grocery item.", preferredStyle: UIAlertController.Style.alert)
        quantityError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let numberError = UIAlertController(title: "Error", message: "Please enter a valid number for the quantity.", preferredStyle: UIAlertController.Style.alert)
        numberError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let added = UIAlertController(title: "Added", message: nil, preferredStyle: UIAlertController.Style.alert)

        if let gText = groceryTextField.text, let qText = quantityTextField.text, gText == "", qText == "" {
            self.present(bothError, animated: true, completion: nil)
        }
        else if let gText = groceryTextField.text, gText == "" {
            self.present(groceryError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, qText == "" {
            self.present(quantityError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, Int(qText) == nil {
            self.present(numberError, animated: true, completion: nil)
        }
        else if let gText = groceryTextField.text {
            self.present(added, animated: true, completion: nil)
            if (!groceriesList.keys.contains(gText)) {
                groceriesList[gText] = quantityTextField.text!
            }
            else {
                let quantity = (Int)(quantityTextField.text!)
                let groceriesQuantity = (Int)(groceriesList[gText]!)!
                groceriesList[gText] = (String)(groceriesQuantity+quantity!)
            }
            added.dismiss(animated: true, completion: nil)
        }
    
        groceriesString = "GROCERY LIST: \n"
        for (item,quantity) in groceriesList {
            groceriesString +=  "Item: \(item), Quantity: \(quantity)\n"
        }
    
        listTextView.text = groceriesString
    }
    
    // MARK: - RemoveButtonPressed
    @objc func removeButtonPressed() {
        let bothError = UIAlertController(title: "Error", message: "Please enter a grocery item and a quantity for your grocery item.", preferredStyle: UIAlertController.Style.alert)
        bothError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let groceryError = UIAlertController(title: "Error", message: "Please enter a valid grocery item already on the list.", preferredStyle: UIAlertController.Style.alert)
        groceryError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        let quantityError = UIAlertController(title: "Error", message: "Please enter a quantity less than that already on your grocery item.", preferredStyle: UIAlertController.Style.alert)
        quantityError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let numberError = UIAlertController(title: "Error", message: "Please enter a valid number for the quantity.", preferredStyle: UIAlertController.Style.alert)
        numberError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let removed = UIAlertController(title: "Removed", message: nil, preferredStyle: UIAlertController.Style.alert)

        if let gText = groceryTextField.text, let qText = quantityTextField.text, gText == "", qText == "" {
            self.present(bothError, animated: true, completion: nil)
        }
        else if let gText = groceryTextField.text, gText == "" {
            self.present(groceryError, animated: true, completion: nil)
        }
        if let qText = quantityTextField.text, qText == "" {
            self.present(removed, animated: true, completion: nil)
            groceriesList.removeValue(forKey: groceryTextField.text!)
            removed.dismiss(animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, (Int)(qText)! > (Int)(groceriesList[groceryTextField.text!]!)! {
            self.present(quantityError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, Int(qText) == nil {
            self.present(numberError, animated: true, completion: nil)
        }
        else {
            self.present(removed, animated: true, completion: nil)
            let quantity = (Int)(quantityTextField.text!)
            let item = groceryTextField.text!
            let groceriesQuantity = (Int)(groceriesList[item]!)!
            
            if (quantity == (Int)(groceriesList[groceryTextField.text!]!)) {
                groceriesList.removeValue(forKey: item)
            }
            if (quantity! < groceriesQuantity) {
                groceriesList[item] = (String)(groceriesQuantity-quantity!)
            }
            removed.dismiss(animated: true, completion: nil)
        }
    
        groceriesString = "GROCERY LIST: \n"
        for (item,quantity) in groceriesList {
            groceriesString +=  "Item: \(item), Quantity: \(quantity)\n"
        }
    
        listTextView.text = groceriesString
    }
    
    // MARK: - ChangeButtonPressed
    @objc func changeButtonPressed() {
        let bothError = UIAlertController(title: "Error", message: "Please enter a grocery item and a quantity for your grocery item.", preferredStyle: UIAlertController.Style.alert)
        bothError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let groceryError = UIAlertController(title: "Error", message: "Please enter a grocery item.", preferredStyle: UIAlertController.Style.alert)
        groceryError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        let quantityError = UIAlertController(title: "Error", message: "Please enter a quantity for your grocery item.", preferredStyle: UIAlertController.Style.alert)
        quantityError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let numberError = UIAlertController(title: "Error", message: "Please enter a valid number for the quantity.", preferredStyle: UIAlertController.Style.alert)
        numberError.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        let changed = UIAlertController(title: "Changed", message: nil, preferredStyle: UIAlertController.Style.alert)

        if let gText = groceryTextField.text, let qText = quantityTextField.text, gText == "", qText == "" {
            self.present(bothError, animated: true, completion: nil)
        }
        else if let gText = groceryTextField.text, gText == "" {
            self.present(groceryError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, qText == "" {
            self.present(quantityError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, Int(qText) == nil {
            self.present(numberError, animated: true, completion: nil)
        }
        else if let qText = quantityTextField.text, let gText = groceryTextField.text{
            self.present(changed, animated: true, completion: nil)
            if Int(qText) == 0 {
                groceriesList.removeValue(forKey: gText)
            }
            else {
                groceriesList[gText] = qText
            }
            changed.dismiss(animated: true, completion: nil)
        }
    
        groceriesString = "GROCERY LIST: \n"
        for (item,quantity) in groceriesList {
            groceriesString +=  "Item: \(item), Quantity: \(quantity)\n"
        }
    
        listTextView.text = groceriesString
    }

}

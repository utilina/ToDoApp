//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {

    private enum Constants {
        static let textFieldsInsets = UIEdgeInsets(top: 10, left: 50, bottom: .zero, right: 50)
        static let textFieldHeight = CGFloat(50)
        static let buttonHeight = CGFloat(70)
        static let buttonWidth = CGFloat(200)
    }

    var taskManager: TaskManager!
    var geocoder = CLGeocoder()

    var titleTextField = UITextField()
    var locationTextField = UITextField()
    var dateTextField =  UITextField()
    var descriptionTextField = UITextField()
    var addressTextField = UITextField()
    var cancelButton = UIButton()
    var saveButton = UIButton()

    weak var delegate: ControllerDismissDelegate?

    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupAppearance()
        setupConstraints()
    }

    private func setupAppearance() {
        setupButtons()
        setupTextfields()
    }

    private func setupButtons() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.layer.cornerRadius = 5
        saveButton.backgroundColor = .green
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.layer.cornerRadius = 5
        cancelButton.backgroundColor = .red
    }

    private func setupTextfields() {
        titleTextField.setupAppearance(withPlaceholder: "Title")
        locationTextField.setupAppearance(withPlaceholder: "Place")
        dateTextField.setupAppearance(withPlaceholder: "Date")
        descriptionTextField.setupAppearance(withPlaceholder: "Description")
        addressTextField.setupAppearance(withPlaceholder: "Address")
    }

    private func setupConstraints() {
        let views = [titleTextField, locationTextField, dateTextField, descriptionTextField, addressTextField, cancelButton, saveButton]
        let constraints = [
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.textFieldsInsets.top),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.textFieldsInsets.left),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.textFieldsInsets.right),
            titleTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),

            locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: Constants.textFieldsInsets.top),
            locationTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.textFieldsInsets.left),
            locationTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.textFieldsInsets.right),
            locationTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),

            dateTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: Constants.textFieldsInsets.top),
            dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.textFieldsInsets.left),
            dateTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.textFieldsInsets.right),
            dateTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),

            descriptionTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: Constants.textFieldsInsets.top),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.textFieldsInsets.left),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.textFieldsInsets.right),
            descriptionTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),

            addressTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: Constants.textFieldsInsets.top),
            addressTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.textFieldsInsets.left),
            addressTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -Constants.textFieldsInsets.right),
            addressTextField.heightAnchor.constraint(equalToConstant: Constants.textFieldHeight),

            cancelButton.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: Constants.textFieldsInsets.top),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),

            saveButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: Constants.textFieldsInsets.top),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            saveButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
            ]
        view.addSubviewsWithConstraints(views, constraints: constraints)

    }

    @objc func save() {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormatter.date(from: dateTextField.text!)
        let descriptionSrting = descriptionTextField.text
        let adressString = addressTextField.text
        
        geocoder.geocodeAddressString(adressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            print(coordinate)
            let location = Location(name: locationString!, coordinate: coordinate)
            print(location)
            let task = Task(title: titleString!, description: descriptionSrting!, date: date, location: location)
            self.taskManager.add(task: task)
            DispatchQueue.main.async {
                self.delegate?.didDismiss(controller: self)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}

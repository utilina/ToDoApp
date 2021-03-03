//
//  NewTaskViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import UIKit
import CoreLocation

class NewTaskViewController: UIViewController {

    var taskManager: TaskManager!
    var geocoder = CLGeocoder()

    let titleTextField = UITextField()
    let locationTextField = UITextField()
    let dateTextField =  UITextField()
    let descriptionTextField = UITextField()
    let adressTextField = UITextField()
    let cancelButton = UIButton()
    let saveButton = UIButton()

    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupConstraints()
    }

    private func setupAppearance() {
        view.addSubview(titleTextField)
        view.addSubview(locationTextField)
        view.addSubview(dateTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(adressTextField)
        view.addSubview(cancelButton)
        view.addSubview(saveButton)
        sutupSaveButton()
    }

    private func sutupSaveButton() {
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }

    private func setupConstraints() {
        let views = [titleTextField, locationTextField, dateTextField, descriptionTextField, adressTextField, cancelButton, saveButton]
        let constraints = [
            titleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            titleTextField.heightAnchor.constraint(equalToConstant: 100),

            locationTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 5),
            locationTextField.leftAnchor.constraint(equalTo: view.leftAnchor),
            locationTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            locationTextField.heightAnchor.constraint(equalToConstant: 100),

            dateTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 5),
            dateTextField.leftAnchor.constraint(equalTo: view.leftAnchor),
            dateTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            dateTextField.heightAnchor.constraint(equalToConstant: 100),

            descriptionTextField.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 5),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 100),

            adressTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 5),
            adressTextField.leftAnchor.constraint(equalTo: view.leftAnchor),
            adressTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            adressTextField.heightAnchor.constraint(equalToConstant: 100),

            cancelButton.topAnchor.constraint(equalTo: adressTextField.bottomAnchor, constant: 5),
            cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            cancelButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: 100),

            saveButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 5),
            saveButton.leftAnchor.constraint(equalTo: view.leftAnchor),
            saveButton.rightAnchor.constraint(equalTo: view.rightAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 100)
            ]
        view.addSubviewsWithConstraints(views, constraints: constraints)

    }

    @objc func save() {
        let titleString = titleTextField.text
        let locationString = locationTextField.text
        let date = dateFormatter.date(from: dateTextField.text!)
        let descriptionSrting = descriptionTextField.text
        let adressString = adressTextField.text
        
        geocoder.geocodeAddressString(adressString!) { [unowned self] (placemarks, error) in
            let placemark = placemarks?.first
            let coordinate = placemark?.location?.coordinate
            let location = Location(name: locationString!, coordinate: coordinate)
            let task = Task(title: titleString!, description: descriptionSrting!, date: date, location: location)
            self.taskManager.add(task: task)
        }

    }
}

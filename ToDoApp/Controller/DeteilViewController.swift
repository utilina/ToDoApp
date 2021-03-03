//
//  DeteilViewController.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 02.03.2021.
//

import UIKit
import MapKit

class DeteilViewController: UIViewController {

    let titleLabel =  UILabel()
    let descriptionLabel = UILabel()
    let locationLabel = UILabel()
    let dateLabel = UILabel()
    let mapView = MKMapView()
    var task: Task!
    var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        view.addSubview(locationLabel)
        view.addSubview(mapView)
        setLabelConstraints()
        setDescriptionLabelConstraints()
        setDateLabelConstraints()
        setMapViewConstraints()
        setLocationLabelConstraints()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        if let coordinate = task.location?.coordinate {
            print(coordinate)
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.setRegion(region, animated: true)
        }
        self.titleLabel.text = task.title
        self.descriptionLabel.text = task.description
        self.locationLabel.text = task.location?.name
        self.dateLabel.text = dateFormatter.string(from: (task.date))
    }

    func setLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 100).isActive = true
    }

    func setDescriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant:20).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 100).isActive = true
    }

    func setDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant:20).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 100).isActive = true
    }

    func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant:20).isActive = true
        mapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 200).isActive = true
    }

    func setLocationLabelConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: mapView.topAnchor, constant:20).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 100).isActive = true

    }
}

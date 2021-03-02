//
//  TaskCell.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 01.03.2021.
//

import UIKit

class TaskCell: UITableViewCell {

    let titleLabel = UILabel()
    let locationLabel = UILabel()
    let dateLabel = UILabel()

    private var dateFormatter: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black

        contentView.addSubview(titleLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(dateLabel)
        setLabelConstraints()
        setLocationLabelConstraints()
        setDateLabelConstraints()
    }

    func setLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }

    func setLocationLabelConstraints() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        locationLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }

    func setDateLabelConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: locationLabel.rightAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 5).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withTask task: Task, done: Bool = false) {
        if done {
            let attributedString = NSAttributedString(string: task.title, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
            titleLabel.attributedText = attributedString
            dateLabel.isHidden = true
            locationLabel.isHidden = true
        } else {
            let dateString = dateFormatter.string(from: task.date)
            dateLabel.text = dateString
            locationLabel.text = task.location?.name
            titleLabel.text = task.title
        }
    }
}

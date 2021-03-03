//
//  UITextFieldExt.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 03.03.2021.
//

import UIKit

extension UITextField {

    func setupAppearance(withPlaceholder placeholder: String?) {
        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.placeholder = placeholder
        self.textColor = .black
        self.font = UIFont.systemFont(ofSize: 30)
    }
}

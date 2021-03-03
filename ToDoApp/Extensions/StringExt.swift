//
//  StringExt.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 03.03.2021.
//

import Foundation

extension String {
    var percentEncoded: String {
        let allowedCharacters = CharacterSet(charactersIn: "~!@#$%^&*()-+=[]\\}{,./?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {fatalError()}
        return encodedString
    }
}

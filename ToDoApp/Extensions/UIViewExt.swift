//
//  UIView ext.swift
//  ToDoApp
//
//  Created by Улитина Анастасия Сергеевна on 03.03.2021.
//

import UIKit

extension UIView {

    /// A string used to identify the view object if it is to be reused.
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    /// Adds the views to the end of the receiver’s list of subviews with specify constraints.
    ///
    /// - Parameters:
    ///   - views: Subviews collection.
    ///   - constraints: The relationship between subviews.
    func addSubviewsWithConstraints(_ views: [UIView], constraints: [NSLayoutConstraint]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate(constraints)
    }

    /// Adds equaly constraints on the layout of the receiving view or its subviews.
    ///
    /// - Parameters:
    ///   - view: The view to be copied constraints.
    ///   - margins: The inset distances for view.
    func addFrameEqualityConstraints(to view: UIView, withMargins margins: UIEdgeInsets = .zero) {
        let rules = ["H:|-\(margins.left)-[v]-\(margins.right)-|", "V:|-\(margins.top)-[v]-\(margins.bottom)-|"]
        let views = ["v": view]
        for rule in rules {
            let constraints = NSLayoutConstraint.constraints(withVisualFormat: rule, options: [], metrics: nil, views: views)
            addConstraints(constraints)
        }
    }

    /// Adds a view to the end of the receiver’s list of subviews with equality constraints.
    ///
    /// - Parameter subview: The view to be added.
    func addFrameEqualitySubview(_ subview: UIView) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        addFrameEqualityConstraints(to: subview)
    }
}

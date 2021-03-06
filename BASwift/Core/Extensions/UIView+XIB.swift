//
//  UIView+IXBase.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 25/03/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

public extension UIView {

    // MARK: - Properties
    class var myNibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }

    class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: myNibName, ofType: "nib") {
            return UINib(nibName: myNibName, bundle: nil)
        } else {
            return nil
        }
    }

    // MARK: - Methods
    class func fromNib(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil) -> Self {
        return fromNib(bundle: bundle, nibNameOrNil: nibNameOrNil, type: self)
    }

    class func fromNib<T: UIView>(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(bundle: bundle, nibNameOrNil: nibNameOrNil, type: T.self)
        return v!
    }

    class func fromNib<T: UIView>(bundle: Bundle = Bundle.main, nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let myNibName = nibNameOrNil {
            name = myNibName
        } else {
            name = myNibName
        }

        guard let nibViews = bundle.loadNibNamed(name, owner: nil, options: nil) else {
            fatalError("Could not load nib")
        }

        for v in nibViews {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }

}

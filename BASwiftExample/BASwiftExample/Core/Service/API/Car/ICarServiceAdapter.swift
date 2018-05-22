//
//  ICarServiceAdapter.swift
//  BASwiftExample
//
//  Created by Burak Akkaya on 22.05.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import Foundation

public protocol ICarServiceAdapter {
    func getBrands(onSuccess:@escaping (BrandList) -> Void, onError:@escaping (Error?) -> Void)
}

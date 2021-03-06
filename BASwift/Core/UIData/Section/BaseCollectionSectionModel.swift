//
//  BaseCollectionSection.swift
//  IX_iOSBaseProject
//
//  Created by Burak Akkaya on 09/10/2017.
//  Copyright © 2017 Burak Akkaya. All rights reserved.
//

import UIKit

open class BaseCollectionSectionModel: BaseSectionModel {

    // MARK: - Private Properties
    private var _headerWidth: CGFloat
    private var _landscapeHeaderWidth: CGFloat!
    private var _footerWidth: CGFloat
    private var _landscapeFooterWidth: CGFloat!

    // MARK: - Properties
    var headerType: AnyClass!

    var landscapeHeaderWidth: CGFloat {
        if let landscapeWidth = _landscapeHeaderWidth {
            return landscapeWidth
        } else {
            return _headerWidth
        }
    }

    var headerWidth: CGFloat {
        if(UIDevice.current.orientation.isLandscape) {
            return landscapeHeaderWidth
        } else {
            return _headerWidth
        }
    }

    var landscapeFooterWidth: CGFloat {
        if let landscapeWidth = _landscapeFooterWidth {
            return landscapeWidth
        } else {
            return _footerWidth
        }
    }

    var footerWidth: CGFloat {

        if(UIDevice.current.orientation.isLandscape) {
            return landscapeFooterWidth
        } else {
            return _footerWidth
        }
    }

    // MARK: - Initialization
    public init(type: AnyClass! = nil, cellModels: [BaseCellModel], headerHeight: CGFloat = 0,
                landscapeHeaderHeight: CGFloat! = nil, headerWidth: CGFloat = 0,
                landscapeHeaderWidth: CGFloat! = nil, footerHeight: CGFloat = 0,
                landscapeFooterHeight: CGFloat! = nil, footerWidth: CGFloat = 0,
                landscapeFooterWidth: CGFloat! = nil, sectionText: String! = nil) {

        self.headerType = type
        _headerWidth = headerWidth
        _landscapeHeaderWidth = landscapeHeaderWidth
        _footerWidth = footerWidth
        _landscapeFooterWidth = landscapeFooterWidth
        super.init(cellModels: cellModels, headerHeight: headerHeight,
                   landscapeHeaderHeight: landscapeHeaderHeight,
                   footerHeight: footerHeight, landscapeFooterHeight: landscapeFooterHeight,
                   sectionText: sectionText)
    }
}

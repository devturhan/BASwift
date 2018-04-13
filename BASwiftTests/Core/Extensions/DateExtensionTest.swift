//
//  DateExtensionTest.swift
//  BASwiftTests
//
//  Created by Burak Akkaya on 12.04.2018.
//  Copyright © 2018 Burak Akkaya. All rights reserved.
//

import XCTest


class DateExtensionTest: XCTestCase {
    
    // GMT: Thursday, April 12, 2018 1:35:38 PM
    let april_12_2018 : Date = Date.init(timeIntervalSince1970: 1523540138)
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateInit(){
        let dateText = "12.04.2018 16:35:38"
        let date = Date.init(fromText: dateText, withFormat: Date.dd_mm_yyyy_hh_mm_ss)
        
        XCTAssertEqual(date, april_12_2018)
    }
    
    
    func test_dd_mm_yyyy(){
        let dd_mm_yyyy = april_12_2018.formattedText(withFormat: Date.dd_mm_yyyy)
        
        XCTAssertEqual(dd_mm_yyyy, "12.04.2018")
    }
    
    func test_dd_mm_yyyy_hh_mm(){
        let dd_mm_yyyy_hh_mm = april_12_2018.formattedText(withFormat: Date.dd_mm_yyyy_hh_mm)
        
        XCTAssertEqual(dd_mm_yyyy_hh_mm, "12.04.2018 16:35")
    }
    
    func test_dd_mm_yyyy_hh_mm_ss(){
        let dd_mm_yyyy_hh_mm_ss = april_12_2018.formattedText(withFormat: Date.dd_mm_yyyy_hh_mm_ss)
        
        XCTAssertEqual(dd_mm_yyyy_hh_mm_ss, "12.04.2018 16:35:38")
    }
    
    func test_mm_yyyy(){
        let mm_yyyy = april_12_2018.formattedText(withFormat: Date.mm_yyyy)
        XCTAssertEqual(mm_yyyy, "04.2018")
    }
    
    func test_mm_yy(){
        let mm_yy = april_12_2018.formattedText(withFormat: Date.mm_yy)
        
        XCTAssertEqual(mm_yy, "04/18")
    }
    
}

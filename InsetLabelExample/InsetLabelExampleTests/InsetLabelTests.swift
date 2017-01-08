//
//  InsetLabelTests.swift
//  InsetLabelTests
//

import UIKit
import XCTest

#if !DISABLE_TESTABLE
@testable import InsetLabelExample
#endif

class InsetLabelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNSCoding() {
        // default contentInsets
        do {
            let label = InsetLabel(frame: .zero)
            XCTAssertEqual(.zero, label.contentInsets)
            let data = NSKeyedArchiver.archivedData(withRootObject: label)
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            XCTAssertEqual(.zero, (object as! InsetLabel).contentInsets)
        }
        // custom contentInsets
        do {
            let label = InsetLabel(frame: .zero)
            let contentInsets = UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4)
            label.contentInsets = contentInsets
            let data = NSKeyedArchiver.archivedData(withRootObject: label)
            let object = NSKeyedUnarchiver.unarchiveObject(with: data)
            XCTAssertEqual(contentInsets, (object as! InsetLabel).contentInsets)
        }
    }

    func testContentInsetsTop() {
        // default value
        do {
            let label = InsetLabel(frame: .zero)
            XCTAssertEqual(0, label.contentInsetsTop)
        }
        // contentInsetsTop == contentInsets.top
        do {
            let label = InsetLabel(frame: .zero)
            let top: CGFloat = 5
            label.contentInsetsTop = top
            XCTAssertEqual(top, label.contentInsets.top)
        }
        // contentInsets.top == contentInsetsTop
        do {
            let label = InsetLabel(frame: .zero)
            let top: CGFloat = 5
            label.contentInsets.top = top
            XCTAssertEqual(top, label.contentInsetsTop)
        }
    }

    func testContentInsetsLeft() {
        // default value
        do {
            let label = InsetLabel(frame: .zero)
            XCTAssertEqual(0, label.contentInsetsLeft)
        }
        // contentInsetsLeft == contentInsets.left
        do {
            let label = InsetLabel(frame: .zero)
            let left: CGFloat = 5
            label.contentInsetsLeft = left
            XCTAssertEqual(left, label.contentInsets.left)
        }
        // contentInsets.left == contentInsetsLeft
        do {
            let label = InsetLabel(frame: .zero)
            let left: CGFloat = 5
            label.contentInsets.left = left
            XCTAssertEqual(left, label.contentInsetsLeft)
        }
    }

    func testContentInsetsBottom() {
        // default value
        do {
            let label = InsetLabel(frame: .zero)
            XCTAssertEqual(0, label.contentInsetsBottom)
        }
        // contentInsetsBottom == contentInsets.bottom
        do {
            let label = InsetLabel(frame: .zero)
            let bottom: CGFloat = 5
            label.contentInsetsBottom = bottom
            XCTAssertEqual(bottom, label.contentInsets.bottom)
        }
        // contentInsets.bottom == contentInsetsBottom
        do {
            let label = InsetLabel(frame: .zero)
            let bottom: CGFloat = 5
            label.contentInsets.bottom = bottom
            XCTAssertEqual(bottom, label.contentInsetsBottom)
        }
    }

    func testContentInsetsRight() {
        // default value
        do {
            let label = InsetLabel(frame: .zero)
            XCTAssertEqual(0, label.contentInsetsRight)
        }
        // contentInsetsRight == contentInsets.right
        do {
            let label = InsetLabel(frame: .zero)
            let right: CGFloat = 5
            label.contentInsetsRight = right
            XCTAssertEqual(right, label.contentInsets.right)
        }
        // contentInsets.right == contentInsetsRight
        do {
            let label = InsetLabel(frame: .zero)
            let right: CGFloat = 5
            label.contentInsets.right = right
            XCTAssertEqual(right, label.contentInsetsRight)
        }
    }
}

//
//  InsetLabel.swift
//

import UIKit.UILabel

@IBDesignable
@objc(GSLInsetLabel)
open class InsetLabel: UILabel {
    // MARK: Properties

    open var contentInsets: UIEdgeInsets = .zero {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    @IBInspectable
    open var contentInsetsTop: CGFloat {
        get {
            return contentInsets.top;
        }
        set {
            var contentInsets = self.contentInsets
            contentInsets.top = newValue
            self.contentInsets = contentInsets
        }
    }

    @IBInspectable
    open var contentInsetsLeft: CGFloat {
        get {
            return contentInsets.left;
        }
        set {
            var contentInsets = self.contentInsets
            contentInsets.left = newValue
            self.contentInsets = contentInsets
        }
    }

    @IBInspectable
    open var contentInsetsBottom: CGFloat {
        get {
            return contentInsets.bottom;
        }
        set {
            var contentInsets = self.contentInsets
            contentInsets.bottom = newValue
            self.contentInsets = contentInsets
        }
    }

    @IBInspectable
    open var contentInsetsRight: CGFloat {
        get {
            return contentInsets.right;
        }
        set {
            var contentInsets = self.contentInsets
            contentInsets.right = newValue
            self.contentInsets = contentInsets
        }
    }

    // MARK: Initializers

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    // MARK: NSCoding

    override open func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(contentInsets, forKey: PropertyKey.contentInsets)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentInsets = aDecoder.decodeUIEdgeInsets(forKey: PropertyKey.contentInsets)
    }

    // MARK: UILabel

    override open func drawText(in rect: CGRect) {
        let newRect = UIEdgeInsetsInsetRect(rect, contentInsets)
        super.drawText(in: newRect)
    }

    // MARK: UIView (UIConstraintBasedLayoutLayering)

    override open var intrinsicContentSize : CGSize {
        let size = super.intrinsicContentSize
        let width = size.width + contentInsets.left + contentInsets.right
        let height = size.height + contentInsets.top + contentInsets.bottom
        return CGSize(width: width, height: height)
    }

    // MARK: Private Constants

    private struct PropertyKey {
        static let contentInsets = "contentInsets"
    }
}

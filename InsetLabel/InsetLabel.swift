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
            contentInsets.top = newValue
        }
    }

    @IBInspectable
    open var contentInsetsLeft: CGFloat {
        get {
            return contentInsets.left;
        }
        set {
            contentInsets.left = newValue
        }
    }

    @IBInspectable
    open var contentInsetsBottom: CGFloat {
        get {
            return contentInsets.bottom;
        }
        set {
            contentInsets.bottom = newValue
        }
    }

    @IBInspectable
    open var contentInsetsRight: CGFloat {
        get {
            return contentInsets.right;
        }
        set {
            contentInsets.right = newValue
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
        let newRect = rect.inset(by: contentInsets)
        super.drawText(in: newRect)
    }

    // MARK: UIView (UIViewHierarchy)

    override open func layoutSubviews() {
        super.layoutSubviews()
        preferredMaxLayoutWidth = frame.width - (contentInsetsLeft + contentInsetsRight)
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

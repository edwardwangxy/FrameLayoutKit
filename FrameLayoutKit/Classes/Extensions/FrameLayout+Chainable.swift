//
//  FrameLayout+Chainable.swift
//  FrameLayoutKit
//
//  Created by Nam Kennic on 9/12/21.
//

import Foundation
import UIKit

/**
Supports chaining syntax:

frameLayout.flexible().align(vertical: .center, horizontal: .left).padding(top: 10, bottom: 20).minHeight(100)
*/

extension FrameLayout {
	
	@discardableResult public func align(vertical: NKContentVerticalAlignment? = nil, horizontal: NKContentHorizontalAlignment? = nil) -> Self {
		alignment = (vertical ?? alignment.vertical, horizontal ?? alignment.horizontal)
		return self
	}
	
	@discardableResult public func extends(size: CGSize) -> Self {
		extendSize = size
		return self
	}
	
	@discardableResult public func extends(width: CGFloat) -> Self {
		extendSize.width = width
		return self
	}
	
	@discardableResult public func extends(height: CGFloat) -> Self {
		extendSize.height = height
		return self
	}
	
	@discardableResult public func fixedSize(_ value: CGSize) -> Self {
		fixedSize = value
		return self
	}
	
	@discardableResult public func fixedHeight(_ value: CGFloat) -> Self {
		fixedHeight = value
		return self
	}
	
	@discardableResult public func fixedWidth(_ value: CGFloat) -> Self {
		fixedWidth = value
		return self
	}
	
	@discardableResult public func minSize(_ value: CGSize) -> Self {
		minSize = value
		return self
	}
	
	@discardableResult public func maxSize(_ value: CGSize) -> Self {
		maxSize = value
		return self
	}
	
	@discardableResult public func minWidth(_ value: CGFloat) -> Self {
		minWidth = value
		return self
	}
	
	@discardableResult public func maxWidth(_ value: CGFloat) -> Self {
		maxWidth = value
		return self
	}
	
	@discardableResult public func maxHeight(_ value: CGFloat) -> Self {
		maxHeight = value
		return self
	}
	
	@discardableResult public func minHeight(_ value: CGFloat) -> Self {
		minHeight = value
		return self
	}
	
	@discardableResult public func fixedContentSize(_ value: CGSize) -> Self {
		fixedContentSize = value
		return self
	}
	
	@discardableResult public func fixedContentWidth(_ value: CGFloat) -> Self {
		fixedContentWidth = value
		return self
	}
	
	@discardableResult public func fixedContentHeight(_ value: CGFloat) -> Self {
		fixedContentHeight = value
		return self
	}
	
	@discardableResult public func maxContentSize(_ value: CGSize) -> Self {
		maxContentSize = value
		return self
	}
	
	@discardableResult public func minContentSize(_ value: CGSize) -> Self {
		minContentSize = value
		return self
	}
	
	@discardableResult public func maxContentWidth(_ value: CGFloat) -> Self {
		maxContentWidth = value
		return self
	}
	
	@discardableResult public func maxContentHeight(_ value: CGFloat) -> Self {
		maxContentHeight = value
		return self
	}
	
	@discardableResult public func minContentWidth(_ value: CGFloat) -> Self {
		minContentWidth = value
		return self
	}
	
	@discardableResult public func minContentHeight(_ value: CGFloat) -> Self {
		minContentHeight = value
		return self
	}
	
	@discardableResult public func heightRatio(_ value: CGFloat) -> Self {
		heightRatio = value
		return self
	}
	
	@discardableResult public func translationOffset(_ value: CGPoint) -> Self {
		translationOffset = value
		return self
	}
	
	@discardableResult public func translationX(_ value: CGFloat) -> Self {
		translationX = value
		return self
	}
	
	@discardableResult public func translationY(_ value: CGFloat) -> Self {
		translationY = value
		return self
	}
	
	@discardableResult public func lazyBindFrame(to: @escaping (() -> UIView?)) -> Self {
		lazyBindingViews = { [to()] }
		return self
	}
	
	@discardableResult public func lazyBindFrame(to: @escaping (() -> [UIView?])) -> Self {
		lazyBindingViews = to
		return self
	}
	
	@discardableResult public func bindFrame(to views: UIView ...) -> Self {
		bindingViews = views
		return self
	}
	
	@discardableResult public func bindingEdgeInsets(_ value: UIEdgeInsets) -> Self {
		bindingEdgeInsets = value
		return self
	}
	
	@discardableResult public func enable(_ value: Bool) -> Self {
		isEnabled = value
		return self
	}
	
	@discardableResult public func debug(_ value: Bool) -> Self {
		debug = value
		return self
	}
	
	@discardableResult public func debugColor(_ value: UIColor) -> Self {
		debugColor = value
		return self
	}
	
	@discardableResult public func contentVerticalGrowing(_ value: Bool) -> Self {
		allowContentVerticalGrowing = value
		return self
	}
	
	@discardableResult public func contentVerticalShrinking(_ value: Bool) -> Self {
		allowContentVerticalShrinking = value
		return self
	}
	
	@discardableResult public func contentHorizontalGrowing(_ value: Bool) -> Self {
		allowContentHorizontalGrowing = value
		return self
	}
	
	@discardableResult public func contentHorizontalShriking(_ value: Bool) -> Self {
		allowContentHorizontalShrinking = value
		return self
	}
	
	@discardableResult public func ignoreHiddenView(_ value: Bool) -> Self {
		ignoreHiddenView = value
		return self
	}
	
	@discardableResult public func willLayoutSubviews(_ block: @escaping (FrameLayout) -> Void) -> Self {
		willLayoutSubviewsBlock = block
		return self
	}
	
	@discardableResult public func didLayoutSubviews(_ block: @escaping (FrameLayout) -> Void) -> Self {
		didLayoutSubviewsBlock = block
		return self
	}
	
	@discardableResult public func willSizeThatFits(_ block: @escaping (FrameLayout, CGSize) -> Void) -> Self {
		willSizeThatFitsBlock = block
		return self
	}
	
}

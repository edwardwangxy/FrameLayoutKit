//
//  ScrollStackView+Chainable.swift
//  FrameLayoutKit
//
//  Created by Nam Kennic on 9/12/21.
//

import Foundation
import UIKit

extension ScrollStackView {
	
	@discardableResult public func axis(_ value: NKLayoutAxis) -> Self {
		axis = value
		return self
	}
	
	@discardableResult public func spacing(_ value: CGFloat) -> Self {
		spacing = value
		return self
	}
	
	@discardableResult public func distribution(_ value: NKLayoutDistribution) -> Self {
		distribution = value
		return self
	}
	
	@discardableResult public func directionalLock(_ value: Bool) -> Self {
		isDirectionalLockEnabled = value
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
	
	@discardableResult public func contentFitSize(_ value: CGSize) -> Self {
		contentFitSize = value
		return self
	}
	
	@discardableResult public func heightRatio(_ value: CGFloat) -> Self {
		heightRatio = value
		return self
	}
	
	@discardableResult public func flexible(_ value: Bool) -> Self {
		isFlexible = value
		return self
	}
	
	@discardableResult public func overlapped(_ value: Bool) -> Self {
		isOverlapped = value
		return self
	}
	
	@discardableResult public func minItemSize(_ value: CGSize) -> Self {
		minItemSize = value
		return self
	}
	
	@discardableResult public func maxItemSize(_ value: CGSize) -> Self {
		maxItemSize = value
		return self
	}
	
	@discardableResult public func fixItemSize(_ value: CGSize) -> Self {
		fixItemSize = value
		return self
	}
	
	@discardableResult public func clipToBounds(_ value: Bool) -> Self {
		clipsToBounds = value
		return self
	}
	
}

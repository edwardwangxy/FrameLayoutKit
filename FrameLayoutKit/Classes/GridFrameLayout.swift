//
//  GridFrameLayout.swift
//  FrameLayoutKit
//
//  Created by Nam Kennic on 5/8/20.
//

import UIKit

open class GridFrameLayout<T: UIView>: FrameLayout<T>{
	public var axis: NKLayoutAxis = .horizontal {
		didSet {
			arrangeViews()
		}
	}
	
	/// Auto set number of columns or rows base on its size
	public var isAutoSize = false
	
	public override var isIntrinsicSizeEnabled: Bool {
		get { stackLayout.isIntrinsicSizeEnabled }
		set {
			stackLayout.isIntrinsicSizeEnabled = newValue
			setNeedsLayout()
		}
	}
	
	override public var edgeInsets: UIEdgeInsets {
		get { stackLayout.edgeInsets }
		set {
			stackLayout.edgeInsets = newValue
			setNeedsLayout()
		}
	}
	
	override public var minSize: CGSize {
		didSet {
			stackLayout.minSize = minSize
			setNeedsLayout()
		}
	}
	
	override public var maxSize: CGSize {
		didSet {
			stackLayout.maxSize = minSize
			setNeedsLayout()
		}
	}
	
	override public var fixedSize: CGSize {
		didSet {
			stackLayout.fixedSize = fixedSize
			setNeedsLayout()
		}
	}
	
	public var minRowHeight: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.forEach { $0.minSize = CGSize(width: $0.minSize.width, height: minRowHeight) }
			setNeedsLayout()
		}
	}
	
	public var maxRowHeight: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.forEach { $0.maxSize = CGSize(width: $0.maxSize.width, height: maxRowHeight) }
			setNeedsLayout()
		}
	}
	
	public var fixedRowHeight: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.forEach { $0.fixedSize = CGSize(width: $0.fixedSize.width, height: fixedRowHeight) }
			setNeedsLayout()
		}
	}
	
	public var minColumnWidth: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.filter { $0 is StackFrameLayout }.forEach { $0.minSize = CGSize(width: minColumnWidth, height: $0.minSize.height) }
			setNeedsLayout()
		}
	}
	
	public var maxColumnWidth: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.filter { $0 is StackFrameLayout }.forEach { $0.maxSize = CGSize(width: maxColumnWidth, height: $0.maxSize.height) }
			setNeedsLayout()
		}
	}
	
	public var fixedColumnWidth: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.filter { $0 is StackFrameLayout }.forEach { $0.fixedSize = CGSize(width: fixedColumnWidth, height: $0.fixedSize.height) }
			setNeedsLayout()
		}
	}
	
	override public var heightRatio: CGFloat {
		didSet {
			stackLayout.heightRatio = heightRatio
			setNeedsLayout()
		}
	}
	
	override public var debug: Bool {
		didSet {
			stackLayout.debug = debug
			stackLayout.frameLayouts.forEach { $0.debug = debug }
			setNeedsLayout()
		}
	}
	
	public var verticalSpacing: CGFloat {
		get { stackLayout.spacing }
		set {
			stackLayout.spacing = newValue
			setNeedsLayout()
		}
	}
	
	public var horizontalSpacing: CGFloat = 0 {
		didSet {
			stackLayout.frameLayouts.filter { $0 is StackFrameLayout }.forEach { ($0 as? StackFrameLayout)?.spacing = horizontalSpacing }
			setNeedsLayout()
		}
	}
	
	public var rows: Int {
		get { stackLayout.frameLayouts.count }
		set {
			let count = stackLayout.frameLayouts.count
			
			if newValue == 0 {
				removeAllCells()
				return
			}
			
			if newValue < count {
				while stackLayout.frameLayouts.count > newValue {
					removeRow(at: stackLayout.frameLayouts.count - 1)
				}
			}
			else if newValue > count {
				while stackLayout.frameLayouts.count < newValue {
					addRow()
				}
			}
		}
	}
	
	private var initColumns: Int = 0
	public var columns: Int = 0 {
		didSet {
			stackLayout.frameLayouts.forEach { (layout) in
				if let layout = layout as? StackFrameLayout<UIView> {
					layout.numberOfFrameLayouts = columns
					layout.frameLayouts.forEach {
						if fixedColumnWidth > 0 {
							$0.fixedSize = CGSize(width: fixedColumnWidth, height: $0.fixedSize.height)
						}
						else {
							$0.minSize = CGSize(width: minColumnWidth, height: $0.minSize.height)
							$0.maxSize = CGSize(width: maxColumnWidth, height: $0.maxSize.height)
						}
					}
				}
			}
		}
	}
	
	public fileprivate(set) var viewCount: Int = 0
	public var views: [T] = [] {
		didSet {
			views.forEach {
				if $0.superview == nil {
					addSubview($0)
				}
			}
			
			viewCount = views.count
			arrangeViews()
		}
	}
	
	public var firstRowLayout: StackFrameLayout<UIView>? {
		return stackLayout.firstFrameLayout as? StackFrameLayout
	}
	
	public var lastRowLayout: StackFrameLayout<UIView>? {
		return stackLayout.lastFrameLayout as? StackFrameLayout
	}
	
	let stackLayout = StackFrameLayout(axis: .vertical, distribution: .equal)
	
	// MARK: -
	
	public convenience init(axis: NKLayoutAxis, column: Int = 0, rows: Int = 0) {
		self.init()
		
		self.axis = axis
		defer {
			self.rows = rows
			self.columns = column
			self.initColumns = column
		}
	}
	
	public required init() {
		super.init()
		
		axis = .horizontal
		isIntrinsicSizeEnabled = true
		addSubview(stackLayout)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	@discardableResult
	public init(_ block: (GridFrameLayout) throws -> Void) rethrows {
		super.init()
		try block(self)
	}
	
	// MARK: -
	
	public func viewAt(row: Int, column: Int) -> T? {
		return frameLayout(row: row, column: column)?.targetView as? T
	}
	
	public func viewsAt(row: Int) -> [T]? {
		return rows(at: row)?.frameLayouts.compactMap( { return $0.targetView as? T } )
	}
	
	public func viewsAt(column: Int) -> [T]? {
		var results = [T]()
		for r in 0..<rows {
			if let view = viewAt(row: r, column: column) {
				results.append(view)
			}
		}
		
		return results.isEmpty ? nil : results
	}
	
	public func rows(at index: Int) -> StackFrameLayout<UIView>? {
		guard index > -1, index < stackLayout.frameLayouts.count, let frameLayout = stackLayout.frameLayouts[index] as? StackFrameLayout else { return nil }
		return frameLayout
	}
	
	public func frameLayout(row: Int, column: Int) -> FrameLayout<UIView>? {
		guard row > -1, row < stackLayout.frameLayouts.count else { return nil }
		guard let rowLayout = stackLayout.frameLayouts[row] as? StackFrameLayout else { return nil }
		return rowLayout.frameLayout(at: column)
	}
	
	public func allFrameLayouts() -> [FrameLayout<UIView>] {
		return stackLayout.frameLayouts.compactMap { $0 as? StackFrameLayout }.flatMap { $0.frameLayouts }
	}
	
	public func lastFrameLayout(containsView: Bool = false) -> FrameLayout<UIView>? {
		guard let lastRows = lastRowLayout else { return nil }
		
		if containsView {
			return lastRows.frameLayouts.last(where: { $0.targetView != nil })
		}
		else {
			return lastRows.frameLayouts.last
		}
	}
	
	// MARK: -
	
	fileprivate func newRow() -> StackFrameLayout<UIView> {
		let layout = StackFrameLayout(axis: .horizontal, distribution: .equal)
		layout.numberOfFrameLayouts = columns
		layout.spacing = horizontalSpacing
		layout.debug = debug
		
		if fixedRowHeight > 0 {
			layout.fixedSize = CGSize(width: 0, height: fixedRowHeight)
		}
		else {
			layout.minSize = CGSize(width: 0, height: minRowHeight)
			layout.maxSize = CGSize(width: 0, height: maxRowHeight)
		}
		
		layout.frameLayouts.forEach {
			if fixedColumnWidth > 0 {
				$0.fixedSize = CGSize(width: fixedColumnWidth, height: $0.fixedSize.height)
			}
			else {
				$0.minSize = CGSize(width: minColumnWidth, height: $0.minSize.height)
				$0.maxSize = CGSize(width: maxColumnWidth, height: $0.maxSize.height)
			}
		}
		
		return layout
	}
	
	@discardableResult
	open func addRow() -> StackFrameLayout<UIView> {
		let layout = newRow()
		stackLayout.add(layout)
		setNeedsLayout()
		return layout
	}
	
	@discardableResult
	open func insertRow(at index: Int) -> StackFrameLayout<UIView> {
		let layout = newRow()
		stackLayout.insert(layout, at: index)
		setNeedsLayout()
		return layout
	}
	
	open func removeRow(at index: Int) {
		stackLayout.removeFrameLayout(at: index)
		setNeedsLayout()
	}
	
	open func removeLastRow() {
		guard stackLayout.frameLayouts.count > 0 else { return }
		stackLayout.removeFrameLayout(at: stackLayout.frameLayouts.count - 1)
		setNeedsLayout()
	}
	
	// MARK: -
	
	open func addColumn() {
		stackLayout.frameLayouts.forEach { (layout) in
			if let rowLayout = layout as? StackFrameLayout<UIView> {
				let row = rowLayout.add()
				row.debug = debug
				
				if fixedColumnWidth > 0 {
					row.fixedSize = CGSize(width: fixedColumnWidth, height: fixedRowHeight)
				}
				else {
					row.minSize = CGSize(width: minColumnWidth, height: minRowHeight)
					row.maxSize = CGSize(width: maxColumnWidth, height: maxRowHeight)
				}
			}
		}
		setNeedsLayout()
	}
	
	open func insertColumn(at index: Int) {
		stackLayout.frameLayouts.forEach { (layout) in
			if let rowLayout = layout as? StackFrameLayout<UIView> {
				let row = rowLayout.insert(nil, at: index)
				row.debug = debug
				
				if fixedColumnWidth > 0 {
					row.fixedSize = CGSize(width: fixedColumnWidth, height: fixedRowHeight)
				}
				else {
					row.minSize = CGSize(width: minColumnWidth, height: minRowHeight)
					row.maxSize = CGSize(width: maxColumnWidth, height: maxRowHeight)
				}
			}
		}
		setNeedsLayout()
	}
	
	open func removeColumn(at index: Int) {
		stackLayout.frameLayouts.forEach { (layout) in
			if let rowLayout = layout as? StackFrameLayout<UIView> {
				rowLayout.removeFrameLayout(at: index)
			}
		}
		setNeedsLayout()
	}
	
	open func removeLastColumn() {
		stackLayout.frameLayouts.forEach { (layout) in
			if let rowLayout = layout as? StackFrameLayout<UIView> {
				rowLayout.removeFrameLayout(at: rowLayout.frameLayouts.count - 1)
			}
		}
		setNeedsLayout()
	}
	
	open func removeAllCells() {
		stackLayout.removeAll()
	}
	
	// MARK: -
	
	func arrangeViews(autoColumns: Bool = true) {
		guard viewCount > 0 else { return }
		
		var numberOfRows = stackLayout.frameLayouts.count
		if isAutoSize {
			if axis == .horizontal, columns > 0 {
				let fitRows = max(Int(ceil(Double(viewCount) / Double(columns))), 1)
				if fitRows != rows {
					rows = fitRows
					numberOfRows = fitRows
				}
			}
			else if axis == .vertical, rows > 0 {
				let fitColumn = max(Int(ceil(Double(viewCount) / Double(rows))), 1)
				if fitColumn != columns {
					columns = fitColumn
				}
			}
		}
		
		var i: Int = 0
		
		if axis == .horizontal {
			if autoColumns, maxColumnWidth > 0 {
				var viewSize = stackLayout.bounds.size
				if viewSize == .zero { viewSize = bounds.size }
				let fitColumns = max(Int(viewSize.width / maxColumnWidth), max(initColumns, 1))
				if columns != fitColumns {
					columns = fitColumns
					arrangeViews(autoColumns: false)
					return
				}
			}
			
			for r in 0..<numberOfRows {
				guard let rowLayout = stackLayout.frameLayouts[r] as? StackFrameLayout else { continue }
				for c in 0..<rowLayout.frameLayouts.count {
					frameLayout(row: r, column: c)?.targetView = views[i]
					i += 1
					if i == viewCount { break }
				}
				if i == viewCount { break }
			}
		}
		else {
			for c in 0..<columns {
				for r in 0..<numberOfRows {
					frameLayout(row: r, column: c)?.targetView = views[i]
					i += 1
					if i == viewCount { break }
				}
				if i == viewCount { break }
			}
		}
		
		setNeedsLayout()
		layoutIfNeeded()
	}
	
	// MARK: -
	
	fileprivate var lastSize: CGSize = .zero
	open override func layoutSubviews() {
		super.layoutSubviews()
		
		if maxColumnWidth > 0, lastSize != bounds.size {
			lastSize = bounds.size
			arrangeViews()
		}
		
		if stackLayout.frame != bounds {
			stackLayout.frame = bounds
		}
	}
	
	open override func sizeThatFits(_ size: CGSize) -> CGSize {
		return stackLayout.sizeThatFits(size)
	}
	
}

import XCTest
import UIKit
@testable import FrameLayoutKit

@MainActor
final class FrameLayoutKitTests: XCTestCase {
    func testLayoutOptionsAreSendableValues() {
        func requireSendable<T: Sendable>(_ value: T) {}
        requireSendable(NKLayoutAxis.horizontal)
        requireSendable(NKLayoutDistribution.split(ratio: [0.25, 0.75]))
    }

    func testFlowLayoutTracksAddedAndRemovedViews() {
        let layout = FlowFrameLayout()
        let first = UIView()
        let second = UIView()

        layout.add(first)
        layout.add(second)
        XCTAssertEqual(layout.views.count, 2)

        layout.removeLast()
        XCTAssertEqual(layout.views.count, 1)
        XCTAssertTrue(layout.views.first === first)
    }

    func testOutOfBoundsLookupReturnsNil() {
        let layout = FlowFrameLayout()
        XCTAssertNil(layout.viewAt(row: 0, column: 0))
        XCTAssertNil(layout.stacks(at: -1))
    }
}

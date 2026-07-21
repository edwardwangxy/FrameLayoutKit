# Swift 6 major-version migration

FrameLayoutKit now uses Swift tools 6.0 and Swift language mode 6 and supports iOS 13 and tvOS 13. Xcode 16.4 or newer is required.

UIKit view and layout behavior remains main-thread-bound. `NKLayoutAxis` and `NKLayoutDistribution` are explicit Sendable value options so they can cross task boundaries before being applied to a main-actor layout. Mutable layout objects themselves are not declared Sendable.

The test target covers layout calculations, boundary sizes, and transfer of immutable layout options. Treat the compiler and isolation contract as a major release.

The Swift 6 migration is released as version 8.0.0.

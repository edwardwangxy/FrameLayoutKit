# FrameLayoutKit

[![Platform](https://img.shields.io/cocoapods/p/FrameLayoutKit.svg?style=flat)](http://cocoapods.org/pods/FrameLayoutKit)
[![Language](http://img.shields.io/badge/language-Swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![Version](https://img.shields.io/cocoapods/v/FrameLayoutKit.svg?style=flat-square)](http://cocoapods.org/pods/FrameLayoutKit)
[![SwiftPM Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/cocoapods/l/FrameLayoutKit.svg?style=flat-square)](http://cocoapods.org/pods/FrameLayoutKit)

![image](images/banner.jpg)

A super fast and easy-to-use layout library for iOS. FrameLayoutKit supports complex layouts, including chaining and nesting layout with simple and intuitive operand syntax.

It simplifies the UI creation process, resulting in cleaner and more maintainable code.


## Why?

Say NO to autolayout constraint nightmare:

<table>
<tr><td> Autolayout </td> <td> FrameLayoutKit </td></tr>
<tr>
<td>
<img alt="No" src="images/no_constraint.png">
</td>
<td>
<img alt="Yes!!!" src="images/frameLayoutSyntax.png">
</td>
</tr>
</table>


# Installation

FrameLayoutKit is available through `Swift Package Manager` (Recommended) and [CocoaPods](http://cocoapods.org):

Regardless, make sure to import the project wherever you may use it:

```swift
import FrameLayoutKit
```

### Cocoapods:
FrameLayoutKit can be installed as a [CocoaPod](https://cocoapods.org/). To install, include this in your Podfile.

```ruby
pod "FrameLayoutKit"
```


### Swift Package Manager
[Swift Package Manager](https://swift.org/package-manager/) is recommended to install FrameLayoutKit.

 1. Click `File`
 2. `Add Packages...`
 3. Specify the git URL for FrameLayoutKit.

```swift
https://github.com/kennic/FrameLayoutKit.git
```

# Example
Some examples of how FrameLayoutKit works:

<table>
<tr><td> Source </td> <td> Result </td></tr>
<tr>
<td>
	
```swift
let frameLayout = HStackLayout()
frameLayout + VStackLayout {
   ($0 + earthImageView).alignment = (.top, .center)
   ($0 + 0).flexible() // add a flexible space
   ($0 + rocketImageView).alignment = (.center, .center)
}
frameLayout + VStackLayout {
   $0 + [nameLabel, dateLabel] // add an array of views
   $0 + 10 // add a space with a minimum of 10 pixels
   $0 + messageLabel // add a single view
}.spacing(5.0)

frameLayout
   .spacing(15)
   .padding(top: 15, left: 15, bottom: 15, right: 15)
   .debug(true) // show dashed lines to visualize the layout
```
</td>
<td>
<img alt="result 1" src="images/helloWorld.png">
</td>
</tr>
</table>

<table>
<tr><td> Source </td> <td> Result </td></tr>
<tr>
<td>

```swift
let frameLayoyt = VStackLayout()
(frameLayout + imageView).flexible()
frameLayout + VStackLayout {
 $0 + titleLabel
 $0 + ratingLabel
}
		
frameLayout
 .padding(top: 12, left: 12, bottom: 12, right: 12)
 .distribution(.bottom)
 .spacing(5)
```
</td>
<td>
<img alt="result 1" src="images/example_1.png">
</td>
</tr>
</table>

<table>
<tr><td> Source </td> <td> Result </td></tr>
<tr>
<td>

```swift
let posterSize = CGSize(width: 100, height: 150)
let frameLayout = ZStackLayout()
frameLayout + backdropImageView
frameLayout + VStackLayout {
 $0 + HStackLayout {
  ($0 + posterImageView).fixedSize(posterSize)
    $0 + VStackLayout {
      $0 + titleLabel
      $0 + subtitleLabel
    }.padding(bottom: 5).flexible().distribution(.bottom)
  }.spacing(12).padding(top: 0, left: 12, bottom: 12, right: 12)
}.distribution(.bottom)
```
</td>
<td>
<img alt="result 2" src="images/example_2.png">
</td>
</tr>
</table>

Two types of code syntax:

<table>
<tr><td>Regular syntax</td> <td>Chained syntax</td></tr>
<tr>
<td>

```swift
frameLayout.distribution = .center
frameLayout.spacing = 16
frameLayout.isFlexible = true
```
</td>
<td>
	
```swift
frameLayout
  .distribution(.center)
  .spacing(16)
  .flexible()
```
</td>
</tr>
</table>

# Benchmark
FrameLayoutKit is one of the fastest layout libraries.
![Benchmark Results](images/bechmark.png "Benchmark results")

See: [Layout libraries benchmark's project](https://github.com/layoutBox/LayoutFrameworkBenchmark)

# Todo

- [x] Swift Package Manager
- [x] CocoaPods support
- [x] Objective-C version (Deprecated - Not recommended)
- [x] Swift version
- [x] Examples
- [ ] Documents

# Author

Nam Kennic, namkennic@me.com

# License

FrameLayoutKit is available under the MIT license. See the LICENSE file for more info.

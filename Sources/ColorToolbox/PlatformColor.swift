//
//  PlatformColor.swift
//  ColorToolbox
//
//  Created by Ramon Torres on 7/2/23.
//

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

#if canImport(UIKit)
/// Alias of UIColor.
public typealias PlatformColor = UIColor
#elseif canImport(AppKit)
/// Alias of NSColor.
public typealias PlatformColor = NSColor
#endif

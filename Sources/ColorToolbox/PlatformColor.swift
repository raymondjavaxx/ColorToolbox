//
//  PlatformColor.swift
//  ColorToolbox
//
//  Created by Ramon Torres on 7/2/23.
//

#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

#if canImport(UIKit)
/// Alias of UIColor.
public typealias PlatformColor = UIColor
#else
/// Alias of NSColor.
public typealias PlatformColor = NSColor
#endif

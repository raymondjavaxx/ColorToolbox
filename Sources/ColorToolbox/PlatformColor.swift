//
//  PlatformColor.swift
//  ColorToolbox
//
//  Copyright (c) 2023 Ramon Torres
//
//  This file is part of ColorToolbox which is released under the MIT license.
//  See the LICENSE file in the root directory of this source tree for full details.
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

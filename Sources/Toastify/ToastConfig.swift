//
//  ToastConfig.swift
//
//
//  Created by will Suo on 2023/10/29.
//

import Cocoa

public struct ToastConfig {
    public enum Level {
        case tips
        case success
        case warning
        case error
        
        func messageColor() -> NSColor {
            switch self {
            case .tips, .success: return NSColor.textColor
            case .warning: return NSColor.systemYellow.withSystemEffect(.deepPressed)
            case .error: return NSColor.systemRed.withSystemEffect(.deepPressed)
            }
        }
        
        func backgroundColor() -> NSColor {
            switch self {
            case .tips, .success: return NSColor(deviceRed: 239.0 / 255.0, green: 239.0 / 255.0, blue: 239.0 / 255.0, alpha: 1)
            case .warning: return NSColor(deviceRed: 255.0 / 255.0, green: 235.0 / 255.0, blue: 191.0 / 255.0, alpha: 1)
            case .error: return NSColor(deviceRed: 255.0 / 255.0, green: 220.0 / 255.0, blue: 217.0 / 255.0, alpha: 1)
            }
        }
        
        func image() -> NSImage? {
            switch self {
            case .tips: return NSImage(systemSymbolName: "lightbulb.min", accessibilityDescription: "Tips")
            case .success: return NSImage(systemSymbolName: "checkmark", accessibilityDescription: "Success")
            case .warning: return NSImage(systemSymbolName: "exclamationmark.triangle", accessibilityDescription: "Warning")
            case .error: return NSImage(systemSymbolName: "xmark.diamond", accessibilityDescription: "Error")
            }
        }
    }
    
    public var level: Level
    public var duration: TimeInterval
    
    public static var `default` = {
        return ToastConfig(level: .tips, duration: 2)
    }
    
    public init(level: Level = .tips, duration: TimeInterval = 2) {
        self.level = level
        self.duration = duration
    }
}

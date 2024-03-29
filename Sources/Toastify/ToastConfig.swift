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
            case .tips, .success: return NSColor(resource: .tipsMessage)
            case .warning: return NSColor(resource: .waringMessage)
            case .error: return NSColor(resource: .errorMessage)
            }
        }
        
        func backgroundColor() -> NSColor {
            switch self {
            case .tips, .success: return NSColor(resource: .tipsBackground)
            case .warning: return NSColor(resource: .waringBackground)
            case .error: return NSColor.init(resource: .errorBackground)
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

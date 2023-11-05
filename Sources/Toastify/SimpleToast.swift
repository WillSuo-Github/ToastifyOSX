//
//  ToastConfig.swift
//
//
//  Created by will Suo on 2023/10/29.
//

import Cocoa
import SnapKit

public enum Toast {
    static var toastView: ToastView?
    
    public static func show(message: String, config: ToastConfig = .default(), on window: NSWindow) {
        guard let contentView = window.contentView else { return }
        removeAllToastView(in: contentView)
        
        let toastView = ToastView(config: config, message: message)
        self.toastView = toastView
        contentView.addSubview(toastView)
        makeToastViewConstraints(toastView: toastView, contentView: contentView, isShowing: false)
        contentView.layoutSubtreeIfNeeded()
        
        NSAnimationContext.runAnimationGroup { context in
            context.allowsImplicitAnimation = true
            context.duration = 0.25
            context.timingFunction = .init(name: .easeInEaseOut)
            makeToastViewConstraints(toastView: toastView, contentView: contentView, isShowing: true)
            contentView.layoutSubtreeIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + config.duration) {
            toastView.removeFromSuperview()
        }
    }
    
    private static func removeAllToastView(in contentView: NSView) {
        contentView.subviews.forEach { subview in
            if let toastView = subview as? ToastView {
                toastView.removeFromSuperview()
            }
        }
    }
    
    private static func makeToastViewConstraints(toastView: ToastView, contentView: NSView, isShowing: Bool) {
        toastView.animator().alphaValue = isShowing ? 1 : 0
        toastView.snp.remakeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(isShowing ? 20 : 0)
            make.left.greaterThanOrEqualToSuperview().inset(20).priority(.low)
            make.right.lessThanOrEqualToSuperview().inset(20).priority(.low)
            make.width.greaterThanOrEqualTo(300)
        }
    }
}

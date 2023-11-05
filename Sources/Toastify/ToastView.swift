//
//  ToastView.swift
//
//
//  Created by will Suo on 2023/10/29.
//

import Cocoa
import SnapKit

public class ToastView: NSView {
    private let config: ToastConfig
    private let message: String
    
    private lazy var messageLabel: NSTextField = {
        let result = NSTextField(labelWithString: message)
        result.lineBreakMode = .byTruncatingTail
        result.textColor = config.level.messageColor()
        result.setContentCompressionResistancePriority(NSLayoutConstraint.Priority(1), for: .horizontal)
        return result
    }()
    
    private lazy var imageView: NSImageView = {
        let result = NSImageView()
        result.image = config.level.image()?
            .withSymbolConfiguration(.init(scale: .medium))?
            .withSymbolConfiguration(.init(paletteColors: [config.level.messageColor()]))
        result.setContentHuggingPriority(.required, for: .horizontal)
        result.setContentHuggingPriority(.required, for: .vertical)
        return result
    }()
    
    public init(config: ToastConfig, message: String) {
        self.config = config
        self.message = message
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI
extension ToastView {
    private func setupUI() {
        wantsLayer = true
        layer?.cornerRadius = 5
        layer?.masksToBounds = true
        setContentHuggingPriority(.defaultLow, for: .horizontal)
        setupSubviews()
    }
    
    public override func updateLayer() {
        super.updateLayer()
        layer?.backgroundColor = config.level.backgroundColor().cgColor
    }
    
    private func setupSubviews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageView.snp.right).offset(8)
            make.right.equalToSuperview().inset(20)
            make.top.bottom.equalToSuperview().inset(8)
        }
    }
}

#Preview {
    ToastView(config: ToastConfig(level: .error, duration: 2), message: "Hello World!")
}

//
//  ClearscoreView.swift
//  clearscoreProject
//
//  Created by Valencia Magagane on 2021/11/23.
//

import Foundation
import UIKit

class ClearScoreView: UIView {
    
    private var radius: CGFloat { (bounds.height - lineWidth) / 2 }
    private let baseLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()
    public var progress: CGFloat = 0.00 {
        didSet {
            layoutSubviews()
            animateCircle(duration: 0.5, delay: 0)
        }
    }
    
    private let lineWidth: CGFloat = 4.0

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    func setup() {
        setupLayer()
        animateCircle(duration: 1, delay: 0.5)
    }
    
    func setupLayer() {
        for layer in [baseLayer, progressLayer] {
            layer.fillColor = UIColor.clear.cgColor
            layer.lineWidth = lineWidth
            layer.lineCap = .round
        }
        baseLayer.strokeColor = UIColor.white.cgColor
        baseLayer.strokeEnd = 1.0

        progressLayer.strokeColor = UIColor.green.cgColor
        progressLayer.strokeEnd = 0.0

        layer.addSublayer(baseLayer)
        layer.addSublayer(progressLayer)
    }

    public func animateCircle(duration: TimeInterval, delay: TimeInterval) {
        progressLayer.removeAnimation(forKey: "circleAnimation")
        progressLayer.strokeEnd = 0
        addAnimation(duration: duration, delay: delay)
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        baseLayer.frame = bounds
        progressLayer.frame = bounds

        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let basePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: (3 * .pi)/2, endAngle: .pi, clockwise: true)
        
        let progressPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .initialAngle, endAngle: .endAngle(progress: progress), clockwise: false)
        baseLayer.path = basePath.cgPath
        progressLayer.path = progressPath.cgPath
    }
    
    func addAnimation(duration: TimeInterval, delay: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.beginTime = CACurrentMediaTime() + delay
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "circleAnimation")
    }
}

private extension CGFloat {
    static var initialAngle: CGFloat = .pi
    static func endAngle(progress: CGFloat) -> CGFloat {
        (-3 * .pi/2) * progress + .initialAngle
    }
}

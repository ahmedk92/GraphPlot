//
//  CAShapeLayerGraphView.swift
//  GraphPlot
//
//  Created by Ahmed Khalaf on 1/3/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

class CAShapeLayerGraphView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    enum Color {
        case purple, green
    }
    
    func add(point: CGPoint, to color: Color) {
        switch color {
        case .purple:
            purplePath = pathByAppendings(point: point, to: purplePath)
            animate(layer: purpleLayer)
        case .green:
            greenPath = pathByAppendings(point: point, to: greenPath)
            animate(layer: greenLayer)
        }
    }
    
    private func animate(layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "path")
        animation.duration = 0.5
        layer.add(animation, forKey: "pathAnimation")
    }
    
    private func pathByAppendings(point: CGPoint, to path: UIBezierPath?) -> UIBezierPath {
        if let path = path {
            path.addLine(to: point)
            return path
        } else {
            let path = UIBezierPath()
            path.move(to: point)
            return path
        }
    }
    
    private func makeShapeLayer(with color: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = color.cgColor
        layer.lineWidth = 2
        return layer
    }
    
    private lazy var purpleLayer: CAShapeLayer = self.makeShapeLayer(with: .purple)
    private lazy var greenLayer: CAShapeLayer = self.makeShapeLayer(with: .green)
    
    private var purplePath: UIBezierPath? {
        didSet {
            purpleLayer.path = purplePath?.cgPath
        }
    }
    private var greenPath: UIBezierPath? {
        didSet {
            greenLayer.path = greenPath?.cgPath
        }
    }
    
    private func commonInit() {
        layer.addSublayer(purpleLayer)
        layer.addSublayer(greenLayer)
    }
    
    // MARK: Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [purpleLayer, greenLayer].forEach {
            $0.frame = layer.bounds
        }
    }
}

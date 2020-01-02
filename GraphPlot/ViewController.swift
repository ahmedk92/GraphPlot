//
//  ViewController.swift
//  GraphPlot
//
//  Created by Ahmed Khalaf on 1/3/20.
//  Copyright © 2020 com.ahmedkhalaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var graphView: CAShapeLayerGraphView!
    
    private var y: CGFloat = 0

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (_) in
            guard let self = self else { return }
            
            self.graphView.add(point: CGPoint(x: CGFloat.random(in: 0...25), y: self.y), to: .purple)
            self.graphView.add(point: CGPoint(x: CGFloat.random(in: 0...25), y: self.y), to: .green)
            
            self.y += 10
        }
    }


}


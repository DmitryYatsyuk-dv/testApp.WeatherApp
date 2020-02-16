 //
//  ParticlesView.swift
//  WeatherApp
//
//  Created by Lucky on 17/02/2020.
//  Copyright © 2020 DmitriyYatsyuk. All rights reserved.
//

import UIKit
import SpriteKit
 
class ParticlesView: SKView {

    override func didMoveToSuperview() {
        
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        
        // Set particlesView.background is clear
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        
        // Place particles on our stage
        if let particles = SKEmitterNode(fileNamed: "ParticleScene.sks") {
            particles.position = CGPoint(x: self.frame.size.width / 2,
                                         y: self.frame.size.height)
            // Set limits
            particles.particlePositionRange = CGVector(dx: self.bounds.size.width,
                                                       dy: 0)
            scene.addChild(particles)
        }
    }
}

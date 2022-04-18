//
//  ViewController.swift
//  ARDicee
//
//  Created by Ashwini Rao on 12/04/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere = SCNSphere(radius: 0.15)
        
        let material = SCNMaterial() //add a material to the cube
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpeg")
        sphere.materials = [material]
        
        let node = SCNNode()  //mention postion of object in 3D space and place that object in that position
        node.position = SCNVector3(0.0, 0.1, -0.5)
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node) //add node to the sceneview
        
        sceneView.autoenablesDefaultLighting = true //to give 3D look
        
//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}

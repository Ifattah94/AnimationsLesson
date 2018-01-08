//
//  ViewController.swift
//  animations
//
//  Created by C4Q on 1/8/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var originalPosition: CGRect = .zero
    var originalAngle: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        originalPosition = squareView.frame
        
    }
    

    @IBOutlet weak var squareView: UIView!
    
    @IBOutlet weak var animateButton: UIButton!
    
    func rotate() {
         let newAngle = self.originalAngle + CGFloat.pi
        
        UIView.animate(withDuration: 3.0) {
            self.squareView.transform = CGAffineTransform.init(rotationAngle: newAngle)//rotates the view
            self.originalAngle = newAngle
        }
    }
    
    func reiazjazz() { //changing the view color and size
        var finalPosition = CGRect()
        if squareView.frame == originalPosition {
            finalPosition = view.safeAreaLayoutGuide.layoutFrame
        } else {
            finalPosition = originalPosition
        }
        
        UIView.animate(withDuration: 2.0, animations: {
                //let newAngle = self.originalAngle + CGFloat.pi
                self.squareView.frame = finalPosition
                
                if self.squareView.backgroundColor != .orange {
                    self.squareView.backgroundColor = .orange
                    self.squareView.frame = finalPosition
                    
                }
                else {
                    self.squareView.backgroundColor = .cyan
                    self.squareView.frame = self.originalPosition
                }
        })
    }
    
    
    @IBAction func animateButtonPressed(_ sender: UIButton) {
        animateButton.isEnabled = false
        
            //completion handler below runs after animation
            reiazjazz()
//            rotate()
            self.animateButton.isEnabled = true
            print("completion success")
        }
        
        
    }



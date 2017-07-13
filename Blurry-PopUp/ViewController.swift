//
//  ViewController.swift
//  Blurry-PopUp
//
//  Created by Sain-R Edwards Jr. on 7/13/17.
//  Copyright © 2017 Sain-R Edwards Jr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // IBOutlet for pop window
    @IBOutlet var addItemView: UIView!
    
    // IBOutlet for blurred visual effect
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    
    // Property to be able to remove or add the visual effect later on
    var effect: UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Giving the View Controller access to control
         the blurred effect. */
        effect = visualEffectView.effect
        
        /* Removing the blurred effect screen once the
         app loads. */
        visualEffectView.effect = nil
        
        // Giving the 'addItemView' rounded corners
        addItemView.layer.cornerRadius = 5
    }
    
    func animateIn() {
        // Brings the 'addItemView' to the front of the view
        self.view.addSubview(addItemView)
        
        // Makes the 'addItemView' the center of the view
        addItemView.center = self.view.center
        
        /* Makes the 'addItemView' larger by multiplying its
         current size by 1.3 */
        addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        
        // Makes the 'addItemView' invisible
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.addItemView.alpha = 0
            
            self.visualEffectView.effect = nil
        }) { (success: Bool) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        animateIn()
    }
    
    @IBAction func dismissPopUp(_ sender: Any) {
        animateOut()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


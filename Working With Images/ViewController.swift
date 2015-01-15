//
//  ViewController.swift
//  Working With Images
//
//  Created by Yosemite on 1/15/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageName:[String] = ["Two@3x", "Three@3x", "Ten@3x", "Queen@3x", "King@3x"]
    
    var count = 0
    
    var frameLocAndSize:[CGFloat] = []

    var timer = NSTimer()
    
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func updateButtonPressed(sender: UIButton) {
        let newImage = UIImage(named: imageName[count])
        image.image = newImage
        ++count
        if count == imageName.count {
            count = 0
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Update image with timer to simulation animation
        timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: "updateImage", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateImage() {
        let newImage = UIImage(named: imageName[count])
        image.image = newImage
        ++count
        if count == imageName.count {
            count = 0
        }
    }
    
    
    // +---    Methods to create animation effect ---+
    // +---------------------------------------------+
    override func viewDidLayoutSubviews() {
        // Step1.0 Fly in effect 
        //         - moving the image out of the view intially
        image.center = CGPointMake(image.center.x + 400, image.center.y - 200)
        // Step1.1 Grandually show up 
        //         - set initial transparency of the image (1=opaq, 0=transparent)
        image.alpha = 0
        // Step1.2 Grandually increase size
        //         - set initial frame size of the view to 0
        frameLocAndSize.append(image.frame.origin.x)
        frameLocAndSize.append(image.frame.origin.y)
        frameLocAndSize.append(image.frame.size.width)
        frameLocAndSize.append(image.frame.size.height)
        image.frame = CGRectMake(frameLocAndSize[0], frameLocAndSize[1], 0, 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        // Define animation duration and finish position
        UIView.animateWithDuration(5, animations: { () -> Void in
            // Step2.0 Fly in effect
            //         - define the finish point of animation
            self.image.center = CGPointMake(self.image.center.x - 400, self.image.center.y + 200)
            // Step2.1 Gradually show up
            //         - define the finish transparency
            self.image.alpha = 1
            // Step2.2 Gradually increase size
            //         - set the finish frame size
            self.image.frame = CGRectMake(self.frameLocAndSize[0] - 400, self.frameLocAndSize[1] + 200, self.frameLocAndSize[2], self.frameLocAndSize[3])
        })
    }
}


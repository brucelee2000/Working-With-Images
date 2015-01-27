# Working-With-Images
Animating views with its elements (label/button/image)
------------------------------------------------------
* **Step1. Set initial position/transparency for the element.**

  "Fly in" means the initial position is out of current view border
  
        // preparation in ViewDidLayoutSubviews to animate view show up
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

        ...

        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 400, resultLabel.center.y)
        resetButtonLabel.alpha = 0
        
* **Step2. Set finished position/transparency for the element.**

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

        ...

        // Add finishi point for text animation to fly in
        UIView.animateWithDuration(2, animations: { () -> Void in
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 400, self.resultLabel.center.y)
        })
            
        // Add finishi point for button animation to fade in
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.resetButtonLabel.alpha = 1
        })

//
//  ViewController.swift
//  Example
//
//  Created by Michael Schwartz on 11/23/15.
//  Copyright (c) 2015 Michael Schwartz. All rights reserved.
//


import UIKit


func Alert(message: String, title: String? = nil) {
    if var topController = UIApplication.sharedApplication().keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
        }
        // topController should now be your topmost view controller
        let alertView = UIAlertController(title: title != nil ? title : "Alert", message: message, preferredStyle: .Alert);
        let OKAction = UIAlertAction(title: "OK", style: .Default) {
            (action: UIAlertAction!) in
        }
        alertView.addAction(OKAction);
        topController.presentViewController(alertView, animated: true, completion: nil)
    }
}

class ViewController: UIViewController {

    func buttonPressed(sender: UIButton!) {
        Alert(String(format: "Button '%@' was pressed", sender.currentTitle!))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        var top:CGFloat = 50.0;

        for i in 1 ... 5 {
            let button = UIButton();
            button.setTitle(String(format: "Add %i", i), forState: .Normal)
            button.setTitleColor(UIColor.blueColor(), forState: .Normal)
            // set up the button's bounds so we can get it's width and height
            button.sizeToFit()
            let bounds = button.bounds
            // position the button so it is centered horizontally
            button.frame = CGRectMake(screenSize.width/2-bounds.width/2, top, bounds.size.width, bounds.size.height)
            button.addTarget(self, action: "buttonPressed:", forControlEvents: .TouchUpInside)
            self.view.addSubview(button)
            top += bounds.height
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

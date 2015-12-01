//
//  ViewController.swift
//  closureButtonSample
//
//  Created by 山口智生 on 2015/12/01.
//  Copyright © 2015年 ha1f. All rights reserved.
//

import UIKit

class ClosureButton: UIButton {
    
    private var touchUpMethod: ((ClosureButton) -> Void)?
    
    func dispatchOnTouchUpInside(closure: (ClosureButton) -> Void) {
        self.touchUpMethod = closure
        self.addTarget(self, action: "onTouchUpInside:", forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func onTouchUpInside(button: ClosureButton!) {
        touchUpMethod?(button)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button = ClosureButton(frame: CGRectMake(0, 0, 100, 40))
        button.layer.position = self.view.center
        button.backgroundColor = UIColor.blackColor()
        button.dispatchOnTouchUpInside() { button in
            print("touch")
        }
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


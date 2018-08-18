//
//  IBSwitch.swift
//  IBSwitch
//
//  Created by VladGohn on 8/18/18.
//  Copyright © 2018 VladGohn. All rights reserved.
//

import Cocoa

@IBDesignable public class IBSwitch: NSControl {
    
    public var core = CALayer()
    public var knob = CALayer()
    
    public var isChecked: Bool = false
    
    let colorStroke = NSColor.gray
    let strokeWidth: CGFloat = 2.0
    var mySize: CGFloat!
    
    //IBInspectable
    @IBInspectable var checked: Bool = false {
        didSet { isChecked = checked;  moveKnob() }
    }
    
    @IBInspectable var fillColor: NSColor = NSColor.green {
        didSet { moveKnob() }
    }
    
    //Inits
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        coreSetup()
    }
    
    override public init(frame: NSRect) {
        super.init(frame: frame)
        coreSetup()
    }
    
    internal func setup() {
        isEnabled = true
        coreSetup()
    }
    
    internal func coreSetup() {
        self.wantsLayer = true
        self.layer! = core
        mySize = core.frame.height
        
        core.backgroundColor = NSColor.clear.cgColor
        core.borderColor  = colorStroke.cgColor
        core.cornerRadius = mySize * 0.5
        core.borderWidth  = strokeWidth
        
        knob.backgroundColor = NSColor.white.cgColor
        knob.borderColor  = colorStroke.cgColor
        knob.cornerRadius = mySize * 0.5
        knob.borderWidth  = strokeWidth
        
        self.needsDisplay = true
        knob.frame.size = CGSize(width: mySize, height: mySize)
        core.addSublayer(knob)
    }
    
    func moveKnob() {
        if !isChecked {
            knob.frame.origin = CGPoint(x: 0, y: 0)
            core.backgroundColor = NSColor.clear.cgColor
        } else {
            knob.frame.origin = CGPoint(x: core.frame.width - mySize, y: 0)
            core.backgroundColor = fillColor.cgColor
        }
    }
    
    //FirstResponder
    override public var acceptsFirstResponder: Bool {
        get { return true }
    }

    override public func acceptsFirstMouse(for theEvent: NSEvent!) -> Bool { return true }
    
    //Click
    override public func mouseUp(with theEvent: NSEvent) {
        super.mouseDown(with: theEvent)
        isChecked = !isChecked
        
        NSApp.sendAction(action!, to: target, from: self)
        moveKnob()
    }


}


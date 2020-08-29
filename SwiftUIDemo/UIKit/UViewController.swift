//
//  ViewController.swift
//  SwiftUIDemo
//
//  Created by subash on 8/29/20.
//  Copyright © 2020 symbolicTrace. All rights reserved.
//

import UIKit
import SwiftUI

class UViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


//Conforming to UIViewControllerRepresentable
struct UViewControllerRepresentation: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UViewController {
        UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "uviewcontroller") as! UViewController
    }
    
    func updateUIViewController(_ uiViewController: UViewController, context: Context) {
        
    }
    
    
}

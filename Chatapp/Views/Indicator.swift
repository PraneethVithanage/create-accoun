//
//  Indicator.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI


struct Indicator:UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
        
        let indicator = UIActivityIndicatorView(style:.large)
        indicator.startAnimating()
        return indicator
    }
    
    func updateUIView(_ uiView:UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
    
     }
    }


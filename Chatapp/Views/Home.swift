//
//  Home.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct Home : View {
    var body : some View {
        VStack{
            Text("Welcome\(UserDefaults.standard.value(forKey: "UserName")as! String)")
            
            Button(action:{
                try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name:NSNotification.Name("statusChanage"),object:nil)
            }){
                Text("Logout")
                
               
           }
        }
    }
}




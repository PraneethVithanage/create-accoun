//
//  ContentView.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/8/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore


struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ??
    false
    var body: some View {
        VStack{
          if status{
               
                Home()
            }
            else{
                NavigationView{
                 FirstPage()
            }
            }
            
           
        }.onAppear{
            NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChanage"), object: nil, queue: .main){
                (_)in
                
                let status = UserDefaults.standard.value(forKey: "status") as? Bool ??
                false
                
                self.status = status
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


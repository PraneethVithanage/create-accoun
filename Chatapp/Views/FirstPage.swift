//
//  FirstPage.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct FirstPage : View {
     @State var ccode = ""
     @State var no = ""
     @State var show = false
     @State var msg = ""
     @State var alert = false
     @State var ID = ""
    var body :some View {
        VStack(spacing: 20) {
            Image("logo")
            
            Text ("Verify Your Number").font(.largeTitle).fontWeight(.heavy)
            
            
            Text ("Please Enter Your Number To Verify Your Account").font(.body).foregroundColor(.gray).padding(.top,12)
            HStack{
                 
                 TextField("+1",text: $ccode)
                     .frame(width:45)
                     .padding()
                     .background(Color("Color"))
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                     
                     
                
                 TextField("Number",text: $no)
                     .padding()
                     .background(Color("Color"))
                     .clipShape(RoundedRectangle(cornerRadius: 10))
                
                  }.padding(.top ,15)
            NavigationLink(destination:SecondPage(show:$show, ID:$ID) ,isActive: $show){
                Button(action:{
                    Auth.auth().settings?.isAppVerificationDisabledForTesting = true; PhoneAuthProvider.provider().verifyPhoneNumber("+"+self.ccode+self.no, uiDelegate:nil){
                        (ID,err)in
                        if err != nil{
                            self.msg = (err?.localizedDescription)!
                            self.alert.toggle()
                            return
                            
                        }
                        
                        self.ID = ID!
                        self.show.toggle()
                    }
                }){
                                         Text("Send").frame(width:UIScreen.main.bounds.width - 30 ,height:50)
                                     }.foregroundColor(.white)
                                         .background(Color.orange)
                                         .cornerRadius(10)
            }
            
          
                          .navigationBarTitle("")
                          .navigationBarHidden(true)
                          .navigationBarBackButtonHidden(true)


            
            
        }.padding()
        
            .alert(isPresented: $alert){
                Alert(title: Text("Error"),message: Text(self.msg),dismissButton:.default(Text("OK")))
        }
    }
}



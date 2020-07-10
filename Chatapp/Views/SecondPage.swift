//
//  SecondPage.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

struct SecondPage : View {
     @State var code = ""
     @Binding var show :Bool
     @Binding var ID :String
     @State var msg = ""
     @State var alert = false
     @State var creation = false
     @State var loading = false
       
        
    var body :some View {
        
        ZStack(alignment:.topLeading) {
            GeometryReader{_ in
                VStack(spacing: 20) {
                           Image("logo")
                           
                           Text ("Verification Code").font(.largeTitle).fontWeight(.heavy)
                           
                           
                           Text ("Please Enter the Verification Code").font(.body).foregroundColor(.gray).padding(.top,12)
                       
                                
                    TextField("code",text: self.$code)
                                    .padding()
                                    .background(Color("Color"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.top ,15)
                                    
                    if self.loading{
                        HStack{
                            Spacer()
                            Indicator()
                            Spacer()
                        }
                    }
                    else{
                        
                          Button(action:{
                              self.loading.toggle()
                            
 
                            let credential =
                            PhoneAuthProvider.provider().credential(withVerificationID: self.ID, verificationCode: self.code)
                            
                            Auth.auth().signIn(with: credential) { (res,err)in
                                if err != nil{
                                    self.msg = (err?.localizedDescription)!
                                    self.alert.toggle()
                                    self.loading.toggle()
                                    return
                                    
                                }
                              
                                
                                checkUser{(exists,user)in
                                    if exists{
                                    UserDefaults.standard.set(true, forKey: "status")
                                    UserDefaults.standard.set(user, forKey: "UserName")
                                NotificationCenter.default.post(name:NSNotification.Name("statusChanage"),object:nil)

                                    }
                                    else{
                                        self.loading.toggle()
                                        self.creation.toggle()
                                        
                                    }
                                }
                            }
                            
                          }){
                                         Text("Verify").frame(width:UIScreen.main.bounds.width - 30 ,height:50)
                                     }.foregroundColor(.white)
                                         .background(Color.orange)
                                         .cornerRadius(10)
                    }

                }
            }
            
            Button(action:{
                
                self.show.toggle()
            }){
                Image(systemName: "chevron.left").font(.title)
            }.foregroundColor(.orange)
            
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)

        .alert(isPresented: $alert) {
            Alert(title: Text("Error"), message: Text(self.msg),dismissButton:.default(Text("OK")))
        }
        .sheet(isPresented: self.$creation){
            AccountCreation(show: self.$creation)
        }
    }
}


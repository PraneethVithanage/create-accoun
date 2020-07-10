//
//  CheckUser.swift
//  Chatapp
//
//  Created by praneeth vithanage on 7/10/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore

func checkUser(completion: @escaping (Bool,String)->Void){
    
    let db = Firestore.firestore()
    
    db.collection("users").getDocuments {(snap,err)in
        if err != nil{
            print((err?.localizedDescription))
            return
        }
        for i in snap!.documents{
            
            if i.documentID == Auth.auth().currentUser?.uid{
                completion(true,i.get("name")as!String)
                return
            }
        }
        
        completion(false,"")
    }
}



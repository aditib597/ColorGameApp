//
//  leaderboardView.swift
//  colorgameapp
//
//  Created by P Kris on 7/23/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct leaderboardView: View {
   
    var db = Firestore.firestore()
    @State var leaderboard = ["leaderboard"]
   
    var body: some View {
        List(leaderboard, id:\.self) {Text($0) }
            .onAppear(perform: getData)
    }
    func getData() {
        db.collection("leaderboard").order(by: "score", descending: true).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("There was an error printing the documents.", err)
            } else {
                for document in querySnapshot!.documents{
                    let name = document.get("name") as! String
                    let score = document.get("score") as! Int
                    self.leaderboard.append("\(name ) : \(String (score))")
                    
                }
            }
            
        }
    }
}

struct leaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        leaderboardView()
    }
}

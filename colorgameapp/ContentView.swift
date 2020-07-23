//
//  ContentView.swift
//  colorgameapp
//
//  Created by Aditi on 7/20/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct ContentView: View {
    @State var score = 0
    @State var timeLeft = 15
    @State var text = "Start"
    @State var color = Color.green
    @State var dictionaryColors = [Color.red : "Red", Color.orange: "Orange", Color.yellow : "Yellow", Color.green : "Green", Color.blue : "Blue", Color.purple : "Purple", Color.gray : "Gray", Color.black : "Black"]
    @State var colorList = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Gray", "Black"]
    @State var colorString = "green"
    @State var buttonDisabled = false
    @State var player = "Tom"
    
    var db = Firestore.firestore()
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                    NavigationLink (destination: InstructionsView()){
                        Text("Instructions").font(.system(size: 20, weight: .bold, design: .rounded))
                        Image(systemName: "info.circle").font(.system(size: 20))
                        }.foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                        
                        NavigationLink (destination: leaderboardView()){
                            Text("Leaderboard").font(.system(size: 20, weight: .bold, design: .rounded))
                            Image(systemName: "info.circle").font(.system(size: 20))}.foregroundColor(Color.white).padding().background(Color.blue).cornerRadius(20)
                    }//Hstack
                    Spacer()
                    Text("Score: \(score)"  ).font(.system(size: 40, weight: .light, design: .rounded)).foregroundColor(Color.red)
                   
                    Text("Time:  \(timeLeft)").font(.system(size: 40, weight: .light, design: .rounded)).foregroundColor(Color.red)
                    
                Spacer()
                    
                    Button(action: {self.startGame()}) {
                        Text(text).font(.system(size: 70, weight: .bold, design: .rounded)).foregroundColor(.pink)
                                   }
                    Spacer()
                    
                   
                   
                    
                    VStack (spacing: 20){
                        
                    HStack (spacing: 20){
            
                        Button(action: {self.checkButtonPress(colorButtonPress: "Red")}) {
                            Text("Red")
                                .foregroundColor(Color.white)
                                
                        } .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                        .cornerRadius(20)
                            .disabled(buttonDisabled)
                        
                        Button(action: {self.checkButtonPress(colorButtonPress: "Blue")}) {
                            Text("Blue")
                                .foregroundColor(Color.white)
                        }  .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(20)
                            .disabled(buttonDisabled)
                                
                       
                    }//Hstack1
                        
                    HStack (spacing: 20){
                        
                        Button(action: {self.checkButtonPress(colorButtonPress: "Orange")}) {
                        Text("Orange")
                        .foregroundColor(Color.white)}
                        .padding()
                        .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(20)
                            .disabled(buttonDisabled)
                        Button(action: {self.checkButtonPress(colorButtonPress: "Purple")}) {
                            Text("Purple")
                        .foregroundColor(Color.white)
                            }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                    }//hstack2
                        
                    HStack (spacing: 20){
                        
                        Button(action: {self.checkButtonPress(colorButtonPress: "Yellow")}) {
                        Text("Yellow")
                        .foregroundColor(Color.white)}
                        .padding()
                        .frame(maxWidth: .infinity)
                            .background(Color.yellow)
                            .cornerRadius(20)
                            .disabled(buttonDisabled)
                        
                        Button(action: {self.checkButtonPress(colorButtonPress: "Gray")}) {
                            Text("Gray")
                        .foregroundColor(Color.white)
                            }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(20)
                        .disabled(buttonDisabled)
                        
                    }
                        
                    HStack (spacing: 20){
                        
                        Button(action: {self.checkButtonPress(colorButtonPress: "Green")}) {
                        Text("Green")
                        .foregroundColor(Color.white)}
                        .padding()
                        .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(20)
                        Button(action: {self.checkButtonPress(colorButtonPress: "Black")}) {
                            Text("Black")
                        .foregroundColor(Color.white)
                            }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.black)
                        .cornerRadius(20)
                        
                        }
                        
                    }.padding(.horizontal, 20)
                        .navigationBarTitle("Welcome to the Color Game!", displayMode: .inline)
                }
        }

      
    }
    func startGame() {
              if timeLeft == 15 {
                 countDown()
                putInNewColor()
              }
        if timeLeft == 0 {
            timeLeft = 15
            score = 0
            text = "Start"
            buttonDisabled = false
        }
          }
          func countDown() {
              if timeLeft > 0 {
                  let seconds = 1.0
                  DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                      self.timeLeft = self.timeLeft - 1
                      self.countDown()
                  }
              } else {
                text = "Start Over"
                buttonDisabled = true
                self.checkScoreAndUpload()
              }
        }
    func checkScoreAndUpload() {
        let docRef = db.collection("leaderboard").document(player)
        docRef.getDocument { (document, error) in if let document = document, document.exists {
            if var highScore = document.get("score") as? Int {
                print("userhighscore", highScore)
                if self.score > highScore {
                    self.uploadToFirebase()
                    }
                }
        } else {
            print("Document does not exist.")
            self.uploadToFirebase()
            }
        }
    }
    
    func uploadToFirebase() {
        db.collection("leaderboard").document(player).setData([
            "name" : player,
            "score" : score
        ]) { err in
            if let err = err {
                print("Error writing the document")
                print(err)
            } else {
                print("Document successfully written! It worked!")
            }
        }
    }
    func putInNewColor() {
        color = dictionaryColors.keys.randomElement()!
        colorString = dictionaryColors[color]!
        if let index = colorList.firstIndex(of: colorString){
            colorList.remove(at: index)
            text = colorList.randomElement()!
            colorList.append(colorString)
            print("color string", colorString)
            print("text", text)
        }
    }
    func checkButtonPress(colorButtonPress : String) {
        if colorButtonPress == colorString {
            print("upping score")
            score = score + 1
            self.putInNewColor()
        }
    }
    func disable() {
        if timeLeft == 0 {
            buttonDisabled = true
        } else {
            buttonDisabled = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

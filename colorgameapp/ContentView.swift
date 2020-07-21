//
//  ContentView.swift
//  colorgameapp
//
//  Created by Aditi on 7/20/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var timeLeft = 15
    @State var text = "Start"
    @State var color = Color.green
    @State var dictionaryColors = [Color.red : "Red", Color.orange: "Orange", Color.yellow : "Yellow", Color.green : "Green", Color.blue : "Blue", Color.purple : "Purple", Color.pink : "Pink", Color.black : "Black"]
    @State var colorList = ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink", "Black"]
    @State var colorString = "green"
    @State var buttonDisabled = false
    var body: some View {
        VStack {
           Spacer()
            Text("Welcome to the Color Game!").font(.system(size: 25, weight: .bold, design: .rounded))
            Spacer()
            Text("Score: \(score)"  ).font(.system(size: 40, weight: .light, design: .rounded)).foregroundColor(Color.red)
           
            Text("Time:  \(timeLeft)").font(.system(size: 40, weight: .light, design: .rounded)).foregroundColor(Color.red)
            
        Spacer()
            
            Button(action: {self.startGame()}) {
                Text(text).font(.system(size: 70, weight: .bold, design: .rounded)).foregroundColor(color)
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
                        
               
            }
                
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
                
            }
                
            HStack (spacing: 20){
                
                Button(action: {self.checkButtonPress(colorButtonPress: "Yellow")}) {
                Text("Yellow")
                .foregroundColor(Color.white)}
                .padding()
                .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(20)
                    .disabled(buttonDisabled)
                
                Button(action: {self.checkButtonPress(colorButtonPress: "Pink")}) {
                    Text("Pink")
                .foregroundColor(Color.white)
                    }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.pink)
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

//
//  ContentView.swift
//  colorgameapp
//
//  Created by P Kris on 7/20/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("Welcome to the Color Game!").font(.system(size: 25, weight: .bold, design: .rounded))
            Text("Score: 0").font(.system(size: 25, weight: .light, design: .rounded)).foregroundColor(Color.red)
           
            Text("Time: 15").font(.system(size: 25, weight: .light, design: .rounded)).foregroundColor(Color.red)
        
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Text("START").font(.system(size: 50, weight: .bold, design: .rounded))
                           }
            
            VStack (spacing: 20){
            HStack (spacing: 20){
    
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Red")
                        .foregroundColor(Color.white)
                        
                } .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                .cornerRadius(20)

                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Blue")
                        .foregroundColor(Color.white)
                }  .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(20)
               
            }
            HStack (spacing: 20){
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Orange")
                .foregroundColor(Color.white)}
                .padding()
                .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(20)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Purple")
                .foregroundColor(Color.white)
                    }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .cornerRadius(20)
                
            }
            HStack (spacing: 20){
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Yellow")
                .foregroundColor(Color.white)}
                .padding()
                .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(20)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Pink")
                .foregroundColor(Color.white)
                    }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.pink)
                .cornerRadius(20)
                
            }
            HStack (spacing: 20){
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Green")
                .foregroundColor(Color.white)}
                .padding()
                .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(20)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

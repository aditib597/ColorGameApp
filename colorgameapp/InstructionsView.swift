//
//  InstructionsView.swift
//  colorgameapp
//
//  Created by P Kris on 7/22/20.
//  Copyright © 2020 Aditi. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
        Text("You have 15 seconds to get the most points possible!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            Text("Click on the button with the color of the text not the button of the text itself")
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding()
            Image("example").resizable().aspectRatio(contentMode : .fit).padding()
            Text("For example, this would be blue")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            Image("example2").resizable().aspectRatio(contentMode : .fit).padding()
            Text("And this would be orange.")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center).padding()
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}

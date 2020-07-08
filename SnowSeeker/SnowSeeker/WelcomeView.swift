//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by RichK on 6/27/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker!")
                .font(.largeTitle)
            
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show this")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

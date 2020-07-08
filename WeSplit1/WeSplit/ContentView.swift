//
//  ContentView.swift
//  WeSplit
//
//  Created by RichK on 4/7/20.
//  Copyright © 2020 Rich Kummer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermoine", "Ron"]
    @State private var selectedStudent = "Harry"
    //@State private var name = ""
    
    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0..<students.count) {
                Text(self.students[$0])
            }
            //TextField("Enter your name", text: $name)
            //Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

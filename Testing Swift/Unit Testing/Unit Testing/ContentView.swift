//
//  ContentView.swift
//  Unit Testing
//
//  Created by Miguel Herrero on 11/06/2019.
//  Copyright © 2019 Miguel Herrero. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

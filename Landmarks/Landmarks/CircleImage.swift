//
//  CircleImage.swift
//  Landmarks
//
//  Created by Miguel Herrero Baena on 18/06/2019.
//  Copyright © 2019 Miguel Herrero Baena. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    var body: some View {
        Image("turtlerock")
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif

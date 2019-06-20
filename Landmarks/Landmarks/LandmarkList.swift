//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Miguel Herrero on 19/06/2019.
//  Copyright © 2019 Miguel Herrero Baena. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Favorites only")
            }

            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList()
                .environmentObject(UserData())
        }
    }
}
#endif

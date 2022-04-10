//
//  Home.swift
//  TaskApp
//
//  Created by mac on 10/04/22.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        Button(action: {homeData.isNewData.toggle()}, label: {
            Text("Button")
        })
            .sheet(isPresented: $homeData.isNewData, content: {
                NewDataView(homeData: homeData)
            })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

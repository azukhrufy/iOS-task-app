//
//  DateButton.swift
//  TaskApp
//
//  Created by mac on 11/04/22.
//

import SwiftUI

struct DateButton: View {
    
    var title: String
    @ObservedObject var homeData: HomeViewModel
    
    var body: some View {
        Button(action: {homeData.updateDate(value: title)}, label: {
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(homeData.checkDate() == title ? .white : .gray)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                    homeData.checkDate() == title ?
                    LinearGradient(gradient: .init(colors: [Color.purple, Color.blue]), startPoint: .leading, endPoint: .trailing)
                    : LinearGradient(gradient: .init(colors: [.white]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
        })
    }
}

//struct DateButton_Previews: PreviewProvider {
//    static var previews: some View {
//        DateButton()
//    }
//}

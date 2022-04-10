//
//  ContentView.swift
//  TaskApp
//
//  Created by mac on 10/04/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - Properties
    
    init(){
        UITextView.appearance().backgroundColor = .clear
        
    }

    
    //MARK: - Body
    var body: some View {
       Home()
    }
}

//MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

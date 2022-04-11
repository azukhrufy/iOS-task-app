//
//  Home.swift
//  TaskApp
//
//  Created by mac on 10/04/22.
//

import SwiftUI
import CoreData

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    //Fetching Data
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date", ascending: true)], animation: .spring()) var results: FetchedResults<Task>
    
    @Environment(\.managedObjectContext) var context
    
    //MARK: - BODY
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
            VStack{
                
                HStack{
                    Text("Task")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Spacer(minLength: 0)
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                if results.isEmpty{
                    
                    Spacer()
                    
                    Text("No Task!")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.heavy)
                    
                    Spacer()
                }else{
                    ScrollView(.vertical, showsIndicators: false, content: {
                            
                        LazyVStack(alignment: .leading, spacing: 20){
                            
                            ForEach(results){ task in
                                VStack(alignment: .leading, spacing: 5, content: {
                                    Text(task.content ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text(task.date ?? Date(), style: .date)
                                        .fontWeight(.bold)
                                    
                                })//:VStack
                                    .foregroundColor(.black)
                                    .contextMenu{
                                        Button(action: {homeData.editItem(item: task)}, label: {
                                            Text("Edit")
                                        })
                                        
                                        Button(action: {
                                            context.delete(task)
                                            try! context.save()
                                        }, label: {
                                            Text("Delete")
                                        })
                                    }
                            }
                        }//:Lazy VStack
                        .padding()
                        
                    })//:ScrollView
                    
                }//: Handle isEmpty Result
                
            }//:VStack
            
            //Add Button...
            
            Button(action: {
                homeData.isNewData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        LinearGradient(gradient: .init(colors: [Color.purple,Color.blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .clipShape(Circle())
            })
                .padding(.trailing, 15)
                .padding(.bottom, 15)
            
        })//:ZStack
            .ignoresSafeArea(.all,edges: .top)
            .background(Color.black.opacity(0.06).ignoresSafeArea(.all,edges: .all))
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

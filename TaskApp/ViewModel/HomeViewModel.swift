//
//  HomeViewModel.swift
//  TaskApp
//
//  Created by mac on 10/04/22.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject{
    @Published var content = ""
    @Published var date = Date()
    
    
    @Published var isNewData = false
    
    //Checkin and Updating Date
    
    let calender = Calendar.current
    func checkDate()->String{
        
        if calender.isDateInToday(date){
            return "Today"
        }
        else if calender.isDateInTomorrow(date){
            return "Tomorrow"
        }
        else{
            return "Other Day"
        }
    }
    
    func updateDate(value:String){
        if value == "Today"{
            date = Date()
        }else if value == "Tomorrow"{
            date = calender.date(byAdding: .day, value: 1, to: Date())!
        }else{
            //do something
        }
    }
    
    func writeData(context: NSManagedObjectContext){
        let newTask = Task(context: context)
        newTask.date = date
        newTask.content = content
        
        //saving data
        
        do{
            try context.save()
            //success = closing view
            isNewData.toggle()
        }catch{
            print(error.localizedDescription)
        }
    }
}

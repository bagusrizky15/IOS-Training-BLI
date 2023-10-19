//
//  KaryawanViewModel.swift
//  1. First Project
//
//  Created by BBPDEV on 19/10/23.
//

import Foundation
import UIKit
import CoreData

class KaryawanViewModel: NSObject {
    private(set) var karyawanData: [KaryawanModel] = [] {
        didSet {
            self.bindDataToVC()
        }
    }
    
    var bindDataToVC: () -> () = {}
    
    func createData(id:Int, name:String, salary:Int){
        let karyawanModel = KaryawanModel(id: id, name: name, salary: salary)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "KaryawanEntity", in: managedContext)
        let insert = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        
        insert.setValue(karyawanModel.id, forKey: "id")
        insert.setValue(karyawanModel.name, forKey: "name")
        insert.setValue(karyawanModel.salary, forKey: "salary")
        
        do {
            try managedContext.save()
        } catch let err {
            print("Error ", err)
        }
        
        fetch()
    }
    
    func fetch() -> [KaryawanModel] {
        
        var karyawans: [KaryawanModel] = []
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return karyawans}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "KaryawanEntity")
        do {
            let result = try managedContext.fetch(fetchRequest) as! [NSManagedObject]
            
            result.forEach{ karyawan in
                
                karyawans.append(KaryawanModel(
                    id: karyawan.value(forKey: "id") as! Int,
                    name: karyawan.value(forKey: "name") as! String,
                    salary: karyawan.value(forKey: "salary") as! Int)
                )
            }
        } catch let err {
            print("Error : ", err)
        }
        
        return karyawans
    }
    
}

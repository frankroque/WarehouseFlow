//
//  ViewModel.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import Foundation
import Firebase

class ViewModel: ObservableObject{
    @Published var actions = [CrudOperations]()
    
    let docData:[String: Any] = [
        "Product Name": String.self,
        "Product Amount": String.self
    ]
    
    func getData(){
        let db = Firestore.firestore()
        db.collection("Add Product").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot{
                    DispatchQueue.main.async{
                        self.actions = snapshot.documents.map{ docs in
                            return CrudOperations(id: docs.documentID,
                                                  productName: docs["Product Name"] as? String ?? "",
                                                  productAmount: docs["Product Amount"] as? String ?? "",
                                                  productType: docs["Product Type"] as? String ?? "")
                            
                        }
                    }
                }
            }else{
                print("Could not read data...")
            }
        }
    }
    
    func addData(documentName: String,productName: String, productAmount: String, productType: String){
        let db = Firestore.firestore()
        db.collection("Add Product").document(documentName).setData(["Product Name": productName, "Product Amount": productAmount, "Product Type": productType]){ error in
            if error == nil{
                print("Data was added")
            }else{
                print("There was a problem adding the data")
            }
        }
    }
    
    func addDocument(documentName: String){
        let db = Firestore.firestore()
        db.collection("Add Product").document(documentName).setData(["name": documentName]){ error in
            if error == nil{
                print("Data was added")
            }else{
                print("There was a problem adding the data")
            }
        }
    }
    
    func deleteData(deleteItem: CrudOperations){
        let db = Firestore.firestore()
        db.collection("Add Product").document(deleteItem.id).delete { error in
            if error == nil{
                DispatchQueue.main.async{
                    self.actions.removeAll{todo in
                        return todo.id == deleteItem.id
                    }
                }
            }
        }
    }
    
    func updateData(documentName: String,productName:String, productAmount:String){
        let db = Firestore.firestore()
        db.collection("Add Product").document(documentName).setData(["Product Name": productName, "Product Amount":productAmount], merge: true) {error in
            if error == nil{
                print("Success updating data")
            }else{
                print("Something went wrong.")
            }
            
        }
    }
    
}

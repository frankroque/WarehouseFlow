//
//  ModifyScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase

struct ModifyScreenView: View {
    @State private var model = ViewModel()
    
    @State var documentName = ""
    @State var productName = ""
    @State var productAmount = ""
    
    var body: some View {
        VStack{
            Text("This is the Modify Screen!!")
            
            List(model.actions){item in
                Text(item.productName)
                Text(item.productAmount)
            }
            Spacer()
            
            TextField("Product Name", text: $productName)
                .padding()
            TextField("Product Amount", text: $productAmount)
                .padding()
            
            
            
                
            Button(action: {
                model.updateData(documentName: documentName, productName: productName, productAmount: productAmount)
                productName = ""
                productAmount = ""
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
        
            
        }
        
    }
    
    
    init(){
        model.getData()
    }
    
}

struct ModifyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyScreenView()
    }
}

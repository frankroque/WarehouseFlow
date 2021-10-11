//
//  AddScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase

struct AddScreenView: View {
    @ObservedObject var model = ViewModel()
    
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    @State var placeHolderNames = ["Product Name", "Product Amount", "Product Type"]
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    var body: some View {
        VStack{
            Text("Enter Product Information").font(.largeTitle).padding()
            
            ProductFields(placeHolder: placeHolderNames[0], information: productName)
            ProductFields(placeHolder: placeHolderNames[1], information: productName)
            ProductFields(placeHolder: placeHolderNames[2], information: productName)
            
            Button(action: {
                model.addData(productName: productName, productAmount: productAmount, productType: productType)
                
                productName = ""
                productAmount = ""
                productType = ""
            }, label: {
                Text("Add Item")
                    .font(.largeTitle)
                    .foregroundColor(teal)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                })
            
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(teal)
        //.edgesIgnoringSafeArea(.all)
        .padding()
    }

   // init(){
       // model.getData()
    //}

}

struct ProductFields: View{
    @State var placeHolder: String
    @State var information: String
    var body: some View{
        VStack{
            Section{
                TextField(placeHolder, text: $information)
                    .padding()
                    .border(Color.white)
                    .font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
    }
}

struct AddScreenView_Previews: PreviewProvider {
    static var previews: some View {
        AddScreenView()
            .preferredColorScheme(.dark)
        AddScreenView()
            .preferredColorScheme(.light)
    }
}

//
//  AddScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase

struct AddScreenView: View {
    @ObservedObject var modelAdd = ViewModel()
    
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    @State var placeHolderNames = ["Product Name", "Product Amount", "Product Type"]
    @State private var showingAlert = false
    
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    var body: some View {
        VStack{
            Text("Enter Product Information").font(.largeTitle).multilineTextAlignment(.center).padding()
            VStack(spacing: 5){
                /*ProductFields(placeHolder: placeHolderNames[0], information: productName)
                 ProductFields(placeHolder: placeHolderNames[1], information: productAmount)
                 ProductFields(placeHolder: placeHolderNames[2], information: productType)**/
                
                TextField("Product Name", text: $productName)
                    .padding()
                    .border(Color.white)
                    .font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Product Amount(Units)", text: $productAmount)
                    .padding()
                    .border(Color.white)
                    //.font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                TextField("Product Type", text: $productType)
                    .padding()
                    .border(Color.white)
                    .font(.largeTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                Button(action: {
                    modelAdd.addData(productName: productName, productAmount: productAmount, productType: productType)
                    
                    productName = ""
                    productAmount = ""
                    productType = ""
                    showingAlert = true
                }, label: {
                    Text("Add Item")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(teal)
                }).alert(isPresented: $showingAlert){
                    Alert(title: Text("Item Added!"))
                }
                
                Divider()
                NavigationLink(destination: ShowData()){
                    Text("Show Data")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .border(Color.black)
                        .background(teal)
                }
            }
        }
        .padding()
    }
    init(){
        modelAdd.getData()
    }

}
//This was supposed to be the model for the textfield inputs but firebase did not read the input, but will leave in here for now see if i can figure it out later.
struct ProductFields: View{
    @State var placeHolder: String
    @State var information: String
    var body: some View{
        
        TextField(placeHolder, text: $information)
            .padding()
            .border(Color.white)
            .font(.largeTitle)
            .textFieldStyle(RoundedBorderTextFieldStyle())
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

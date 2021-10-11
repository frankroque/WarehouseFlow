//
//  DeleteScreenView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase

struct DeleteScreenView: View{
    @ObservedObject var modelDelete = ViewModel()
    
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    var body: some View {
        VStack{
            Text("Click Red Circle to delete Item")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            HStack{
                Text("Product Name").bold()
                    .padding()
                    .frame(width:100, height: 100)
                Text("Product Amount").bold()
                    .padding()
                    .frame(width: 100, height: 100)
                Text("Product Type").bold()
                    .padding()
                    .frame(width: 100, height: 100)
            }
            
            List(modelDelete.actions){item in
                HStack{
                    Text(item.productName)
                        .padding()
                        .frame(width:125, height: 100)
                    Text(item.productAmount)
                        .padding()
                        .frame(width: 80, height: 100)
                    Text(item.productType)
                        .padding()
                        .frame(width: 125, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Button(action: {
                        modelDelete.deleteData(deleteItem: item)
                    }, label: {
                        Image(systemName: "minus.circle")
                            .padding(.trailing)
                            .accentColor(.red)
                            
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
        }
        
    }
    
    init(){
        modelDelete.getData()
    }
}

struct DeleteScreenView_Previews: PreviewProvider {
    static var previews: some View {
        DeleteScreenView()
    }
}

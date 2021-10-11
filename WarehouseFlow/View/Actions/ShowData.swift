//
//  ShowData.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI
import Firebase
struct ShowData: View {
    @ObservedObject var model = ViewModel()
    @State var productName = ""
    @State var productAmount = ""
    @State var productType = ""
    
    var body: some View {
        VStack{
            Text("Showing Product in Warehouse")
                .bold()
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            HStack{
                Text("Product Name")
                    .bold()
                    .underline()
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(width: 150, height: 100)

                Text("Product Amount")
                    .bold()
                    .underline()
                    .padding()
                    .multilineTextAlignment(.center)
                    .frame(width: 100, height: 100)

                Text("Product Type")
                    .bold()
                    .underline()
                    .padding()
                    .multilineTextAlignment(.trailing)
                    .frame(width: 150, height: 100)

            }
            List(model.actions){item in
                
                HStack{
                    VStack{
                        Text("\(item.productName) - ")
                            .multilineTextAlignment(.leading)
                            .padding()
                            .frame(width: 150, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                HStack{
                    VStack{
                        Text("- \(item.productAmount) -")
                            .multilineTextAlignment(.center)
                            .padding()
                            .frame(width: 90, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                HStack{
                    VStack{
                        Text(" - \(item.productType)")
                            .multilineTextAlignment(.trailing)
                            .padding()
                            .frame(width: 150, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                    }
                    
                }
                
            }
            .padding(.vertical)
            .background(Color.blue, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        
    }
    init (){
        model.getData()
    }
    
}

struct ShowData_Previews: PreviewProvider {
    static var previews: some View {
        ShowData()
    }
}

//
//  SelectAction.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/6/21.
//

import SwiftUI

struct SelectAction: View {
    @State var delete = ""
    @State var actionArray = ["Add Product", "Delete Product", "Modify Product", "Show Data"]
    
    var body: some View {
        VStack{
            Text("Select Action")
                .bold()
                .font(.largeTitle)
        
            NavigationLink(destination: AddScreenView()){
                actionsSelection(action: actionArray[0])
            }
            NavigationLink(destination: DeleteScreenView()){
                actionsSelection(action: actionArray[1])
            }
            NavigationLink(destination: ModifyScreenView()){
                actionsSelection(action: actionArray[2])
            }
            NavigationLink(destination: ShowData()){
                actionsSelection(action: actionArray[3])
            }
                
            
        }
    }
}

struct actionsSelection: View{
    @State var action: String
    var body: some View{
        VStack{
            Section{
                Text(action)
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: 200, height: 50)
                    .border(Color.black)
                    .background(Color.blue)
                    
            }
        }
    }
}

struct SelectAction_Previews: PreviewProvider {
    static var previews: some View {
        SelectAction()
    }
}

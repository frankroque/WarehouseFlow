//
//  ContentView.swift
//  WarehouseFlow
//
//  Created by Franky Roq on 10/5/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModel()
    
    @State var username = ""
    @State var password = ""
    @State var selection: Int? = nil
    let teal = Color(red: 49/255, green: 163/255, blue: 159/255)
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Enter Username and Password")
                    .bold()
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                TextField("Enter Username", text: $username)
                    .padding()
                
                TextField("Enter Password", text: $password)
                    .padding()
                
                Divider()
                
                NavigationLink(destination: SelectAction()){
                    Text("Login")
                        .foregroundColor(Color.black)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                       
                }
                .frame(width: 200, height: 50)
                .padding()
                .font(.largeTitle)
                .background(Color.blue)
                .cornerRadius(20)
            }
            .navigationBarTitle("WarehouseFlow")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

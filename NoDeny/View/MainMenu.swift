//
//  MainMenu.swift
//  NoDeny
//
//  Created by Евгений Подъячев on 19.04.2023.
//

import SwiftUI

struct MainMenu: View {
    
    @State private var AuthViewShow = false
    
    var body: some View {
        TabView{
            
            ProfileView()
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                        Text("Профиль")
                    }
                }
           UslugiView()
                .tabItem {
                    VStack{
                        Image(systemName: "scroll")
                        Text("Услуги")
                    }
                }
            SeansyView()
                .tabItem {
                    VStack{
                        Image(systemName: "dial.low")
                        Text("Сеансы")
                    }
                }
            
            PaysView()
                .tabItem {
                    VStack{
                        Image(systemName: "rublesign.square")
                        Text("Платежи")
                    }
                }
        
             AuthView()
                .tabItem {
                    VStack{
                        Image(systemName: "gear")
                        Text("Настройки")
                        //AuthViewShow.toggle()
                          //  .fullScreenCover(isPresented: $AuthViewShow) { AuthView() }
                    }
                }//.fullScreenCover(isPresented: $AuthViewShow) { AuthView() }
                

        }
       
        
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}

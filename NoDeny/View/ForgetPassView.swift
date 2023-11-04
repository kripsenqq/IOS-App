//
//  ForgetPassView.swift
//  NoDeny
//
//  Created by kripsenqq on 07.10.2023.
//

import SwiftUI


struct ForgetPassView: View {
    
    @State private var username: String = defaults.string(forKey: "Ulogin") ?? ""          // zenyp
    @State private var userpassword: String = defaults.string(forKey: "Upassword") ?? ""   // tcssys
    @State private var userurl: String = defaults.string(forKey: "UapiUrlAuth") ?? ""      // https://lk.gipercom.net
    
    var body: some View {
        
        VStack(spacing: 2) {
            Text("Восстановление пароля")
                .padding()
                .padding(.horizontal,15)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))//рамка
                .cornerRadius(30) //скругление углов
                .foregroundColor(Color("darkbrown"))
                .padding(.top, 120)
                .padding(.bottom, 70)
            
            VStack(alignment: .leading) {
                Text("Введите почту или логин")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
                TextField("email или Логин", text: $username)
                    .disableAutocorrection(true)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .foregroundColor(Color("darkbrown"))
                    .cornerRadius(12)
                    .padding(8)
                    .shadow(radius: 7)
                
                
                Button {
                    print("Восстановить")
                } label: {
                    Text("Восстановить")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"),Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(12)
                        .padding(.horizontal, 20)
                        .padding(.top, 10)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkbrown"))
                        .shadow(radius: 6)
                    
                }
                
            }.shadow(radius: 12)
                .padding(18)
                .background(Color("whiteAlpha"))
                .cornerRadius(24)
                .padding(20)

        Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("peakpx").ignoresSafeArea())
        
    }
}

#Preview {
    ForgetPassView()
}

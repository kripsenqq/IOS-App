//
//  RegistrationView.swift
//  NoDeny
//
//  Created by kripsenqq on 22.09.2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var isAuth = true
    @State private var showingAlert = false
    @State private var username: String = defaults.string(forKey: "Ulogin") ?? ""          // zenyp
    @State private var userpassword: String = defaults.string(forKey: "Upassword") ?? ""   // tcssys
    @State private var userurl: String = defaults.string(forKey: "UapiUrlAuth") ?? ""      // https://lk.gipercom.net
    @State private var MainMenuShow = false
    @State private var isPasswordVisible = false
    @State private var isPasswordVisibleTwo = false
    @State private var password: String = defaults.string(forKey: "Upassword") ?? ""
    @State private var confirmPassword: String = ""

    
    var body: some View {
        
        VStack(spacing: 2) {
            Text("Регистрация")
                .padding()
                .padding(.horizontal,30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))//рамка
                .cornerRadius(30) //скругление углов
                .foregroundColor(Color("darkbrown"))
        
            
            VStack{
                HStack {
                    Label("", systemImage: "person")
                        .font(.title)
                        .foregroundColor(Color("darkorange"))
                        .frame(width: 45, height: 45)
                        .scaledToFit()
                    TextField("Придумайте логин", text: $username)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .foregroundColor(Color("darkbrown"))
                        .cornerRadius(12)
                        .padding(8)
                        .padding(.vertical, 6)
                        .shadow(radius: 7)
                }
                HStack {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .frame(width: 45, height: 45)
                            .font(.title)
                            .foregroundColor(Color("darkorange"))
                            .scaledToFit()
                            .imageScale(.small)
                    }
                    if isPasswordVisible {
                        TextField("Придумайте пароль", text: $userpassword)
                            .autocapitalization(.none)
                            .foregroundColor(Color.black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(8)
                            .padding(.vertical, 6)
                            .shadow(radius: 7)
                    } else {
                        SecureField("Придумайте пароль", text: $userpassword)
                            .autocapitalization(.none)
                            .foregroundColor(Color.black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(8)
                            .padding(.vertical, 6)
                            .shadow(radius: 7)
                    }
                }
                HStack {
                    Button(action: {
                        isPasswordVisibleTwo.toggle()
                    }) {
                        Image(systemName: isPasswordVisibleTwo ? "eye.fill" : "eye.slash.fill")
                            .frame(width: 45, height: 45)
                            .font(.title)
                            .foregroundColor(Color("darkorange"))
                            .scaledToFit()
                            .imageScale(.small)
                    }
                    if isPasswordVisibleTwo {
                        TextField("Повторите пароль", text: $confirmPassword)
                            .autocapitalization(.none)
                            .foregroundColor(Color.black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(8)
                            .padding(.vertical, 6)
                            .shadow(radius: 7)
                    } else {
                        SecureField("Повторите пароль", text: $confirmPassword)
                            .autocapitalization(.none)
                            .foregroundColor(Color.black)
                            .disableAutocorrection(true)
                            .padding()
                            .background(Color("whiteAlpha"))
                            .cornerRadius(12)
                            .padding(8)
                            .padding(.vertical, 6)
                            .shadow(radius: 7)
                    }
                }
                Button {
                    print("Регистрация")
                } label: {
                    Text("Зарегистрироваться")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"),Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(Color("darkbrown"))
                        .shadow(radius: 6)
                    
                }
                
            }.shadow(radius: 7)
                .padding(10)
                .background(Color("whiteAlpha"))
                .cornerRadius(24)
                .padding(40)
                .shadow(radius: 12)
                .padding(.bottom, 15)
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Image("peakpx").ignoresSafeArea())
        }
        
    
    struct RegistrationView_Previews: PreviewProvider {
        static var previews: some View {
            RegistrationView()
        }
    }
}
#Preview {
    RegistrationView()
}

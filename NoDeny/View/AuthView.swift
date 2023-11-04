//
//  ContentView.swift
//  NoDeny
//
//  Created by Евгений Подъячев on 19.04.2023.
//

import SwiftUI
var defaults = UserDefaults.standard

struct AuthView: View {
    
@State private var isAuth = true
@State private var showingAlert = false
@State private var username: String = defaults.string(forKey: "Ulogin") ?? ""          // zenyp
@State private var userpassword: String = defaults.string(forKey: "Upassword") ?? ""   // tcssys
@State private var userurl: String = defaults.string(forKey: "UapiUrlAuth") ?? ""      // https://lk.gipercom.net
@State private var MainMenuShow = false
@State private var isForgetPass = false
@State private var isRegistr = false
@State private var isPasswordVisible = false
//    @State private var username = "zenyp" //defaults.string(forKey: "Ulogin")!
//    @State private var userpassword = "tcssys" //defaults.string(forKey: "Upassword")!
//    @State private var userurl = "https://lk.gipercom.net" //defaults.string(forKey: "UapiUrlAuth")!


var body: some View {
    
    NavigationStack{

    VStack(spacing: 2) {
        Text("Авторизация")
            .padding()
            .padding(.horizontal,30)
            .font(.title2.bold())
            .background(Color("whiteAlpha"))
            .cornerRadius(30)
            .foregroundColor(Color("darkbrown"))
            .shadow(radius: 7)
        
        VStack {
            HStack {
                Label("", systemImage: "person")
                    .font(.title)
                    .foregroundColor(Color("darkorange"))
                TextField("Введите логин", text: $username)
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
                        .frame(width: 40, height: 45)
                        .font(.title)
                        .foregroundColor(Color("darkorange"))
                        .scaledToFit()
                        .imageScale(.small)
                        .offset(x: -3)
                }
                if isPasswordVisible {
                    TextField("Введите пароль", text: $userpassword)
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
                    SecureField("Введите пароль", text: $userpassword)
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
                Label("", systemImage: "network")
                    .font(.title)
                    .foregroundColor(Color("darkorange"))
                
                TextField("URL https://", text: $userurl)
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
            
            Button {
                print("Вход")
                login = username
                password = userpassword
                apiUrlAuth = userurl
                billUrl = userurl + "/cgi-bin/noapi.pl?_uu=" + username + "&_pp=" + userpassword         //https://lk.gipercom.net/cgi-bin/noapi.pl?_uu=zenyp&_pp=tcssys
                
                if username == "" || userpassword == "" || userurl == "" {              //      <--- Проверка на пустые строки
                    var alert: Alert {
                        Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))}
                    return
                    
                }else{
                    
                }
                
                Task{
                    let res_error = try await NetworkServiceWithAsync.shared.ReadError()
                    print(res_error.errCod)
                    print(res_error.error)
                }
                
                Task{
                    let res_ok = try await NetworkServiceWithAsync.shared.ReadOk()
                    print(res_ok.result)
                    print(res_ok.ses)
                    if(res_ok.result == "auth ok"){
//                        let rууууу_ok = try await NetworkServiceWithAsync.shared.ReadNoData()
                        MainMenuShow.toggle()}
                    else {
                        var alert: Alert {
                            Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))}
                    }
                }
                
            } label: {
                Text("Войти")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LinearGradient(colors: [Color("yellow"),Color("orange")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(12)
                    .padding(8)
                    .padding(.horizontal, 12)
                    .font(.title3.bold())
                    .foregroundColor(Color("darkbrown"))
                    .shadow(radius: 6)
                
            }
            
            HStack{
                Button(action: {
                    print("Registration")
                }) {
                    NavigationLink(destination: RegistrationView()) {
                        Text("Зарегистрироваться")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(4)
                            .background(LinearGradient(colors: [Color("clear"), Color("clear")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .padding(.horizontal, 12)
                            .font(.title3.bold())
                            .foregroundColor(Color("darkbrown"))
                            .shadow(radius: 6)
                    }
                }
            }
            
            Divider()
            
            HStack {
                Button {
                    print("Forget")
                }label: {
                    NavigationLink(destination: ForgetPassView()){
                        Text("Забыли пароль?")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [Color("clear"),Color("clear")], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(12)
                            .padding(5)
                            .padding(.horizontal, 12)
                            .font(.title3.bold())
                            .foregroundColor(Color("darkbrown"))
                            .shadow(radius: 6)
                    }
                }
            }
            
        }
        
        //  .background(colorScheme == .dark ? Color.black : Color.white)
        .padding(10)
        .background(Color("whiteAlpha"))
        .cornerRadius(24)
        .padding(40)
        .shadow(radius: 12)
        
        // .background(colorScheme == .dark ? Color.black : Color.white)
        
        
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image("peakpx").ignoresSafeArea())
    
        .fullScreenCover(isPresented: $MainMenuShow) {
            MainMenu()
            
        }  .shadow(radius: 7)
    }
}

    struct AuthView_Previews: PreviewProvider {
        static var previews: some View {
            AuthView()
        }
    }
}
#Preview {
    RegistrationView()
}

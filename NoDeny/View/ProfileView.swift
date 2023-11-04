//
//  ProfileView.swift
//  NoDeny
//
//  Created by Евгений Подъячев on 21.04.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
       
        
        VStack(alignment: .center , spacing: 20) {
            HStack(spacing: 18){
                Image("user")
                    .resizable()
                    .frame(width: 120, height: 120)
               
                VStack(alignment: .leading, spacing: 12) {
                    Text("Подъячев Евгений")
                        .bold()
                    Text("+79788369996")
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                Text("Адрес подключения:")
                    .bold()
                Text("Россия, Московская область, г. Нижний Уренгой, ул, Юных Юннатов, д. 35, кв. 18")
            }
            
            //таблица с данными
            List{
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
                Text("информация")
            }.listStyle(.plain)
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
      //  Task{
      //      let res_okk = try await NetworkServiceWithAsync.shared.ReadOk()
       //     print(res_okk.result)
          //  print(res_okk.ses)
        
       // }
    }
}

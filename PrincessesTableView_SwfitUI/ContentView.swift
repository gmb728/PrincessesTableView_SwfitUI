//
//  ContentView.swift
//  PrincessesTableView_SwfitUI
//
//  Created by Chang Sophia on 10/4/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import SwiftUI

struct FirstView: View {
   var body: some View {
     NavigationView {
        VStack {
        NavigationLink(destination: ListView()) {
      Image("all")
        .renderingMode(.original)
        .resizable()
        .scaledToFit()
        .navigationBarTitle("Best Disney Princess")
    .frame(width: 400, height: 600)
    }
                
   }
}
    
                  
    }
}

// RoleRow for TableViewCell
struct RoleRow: View {
    var roles: Role
    var body: some View {
        HStack {
            Image(roles.name)
            .resizable()
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipped()
            VStack(alignment: .leading) {
            Text(roles.name)
           
            
            }
            Spacer() //長成螢幕寬度
      
        }
           
    }
}
//利用previewLayout調整preview的尺寸
struct RoleRow_Previews: PreviewProvider {
    static var previews: some View {
        RoleRow(roles: roles[0])
            .previewLayout(.fixed(width:300, height:70))
    }
}

//公主List列表
struct ListView: View {
     
    var body: some View {
        List(0..<roles.count) { (index) in
            NavigationLink(destination: DetailView(roles: roles[index])){
                RoleRow(roles: roles[index])
            }
            .navigationBarTitle("Princess List")
           .background(Image("texture").opacity(0.3))
           
            }

    .listRowInsets(EdgeInsets(top: 30, leading: 0, bottom: 30, trailing: 30))
    //指定上下左右距離
}
}
    //公主Detail檔案
struct DetailView: View {
       var roles: Role //儲存公主資料
        var body: some View {
              NavigationLink(destination: ContentView()){
            VStack {
                Image(roles.name)
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFill()
                   
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 400)//Image 的寬度等於螢幕寬度
                .clipped()
                Text(roles.name)
                Text(roles.weapon)
                Text(roles.official)
                Text(roles.number)
                Text(roles.movie)
                Text(roles.pet)
                .padding()
                  
              
            }
               .cornerRadius(30)
        }
.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing).opacity(0.4))
            .cornerRadius(30)
          }
    
   
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(roles: roles[0])
         
    }
    
}
    
//選擇一位
struct ContentView: View {
    var body: some View {
       
            VStack {
                NavigationLink(destination: BestPrincessView()) {
                Text("Disney Best Princess?")
                      .accentColor(.blue)
                 
                }
                Image("castle")
                   .renderingMode(.original)
                   .resizable()
                   .scaledToFit()
                   .frame(width: 200, height: 200)
            }
        
        
        

    }
    }
struct BestPrincessView: View {
   var body: some View {
      Image("Shank")
        .resizable()
         .scaledToFit()
         .navigationBarTitle("Shank")
        
   }
  
}
  

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



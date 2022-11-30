//
//  LoginView.swift
//  essen
//
//  Created by Ian Nalyanya on 30/11/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var remember : Bool = false
    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                Text("Welcome Back!").font(.system(size: 36, weight: Font.Weight.bold)).padding( .vertical, 8)
                
                Text("Get started using your account").font(.system(size: 16)).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.938))
            
            }
           
            
            
            Group{
                Text("Email*").font(.system(size: 20, weight: Font.Weight.medium))
                HStack {
                    Image(systemName: "envelope.fill")
                   
                    TextField("Enter your email", text: $email)
                }.padding(24).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.938)).cornerRadius(8)
            }
            
            
            Group{
                Text("Password*").font(.system(size: 20, weight: Font.Weight.medium))
                HStack {
                    Image(systemName: "lock")
                   
                    SecureField("Password", text: $password)
                }.padding(24).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.938)).cornerRadius(8)
            }
            
        
                Toggle(isOn: $remember) {
                    Text("Remeber me")
                }
                
            VStack {
                Button(action: {}, label:{ Text("Login").foregroundColor(.white).font(.system(size: 16, weight: Font.Weight.bold))
                    
                }).padding(24).frame(maxWidth: .infinity).background(.black).cornerRadius(9)
                
                Text("Don't have an account? Sign Up")
            }.padding(.top, 64)

          
        }.padding(8)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

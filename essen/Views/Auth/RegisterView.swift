//
//  RegisterView.swift
//  essen
//
//  Created by Ian Nalyanya on 30/11/2022.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var remember : Bool = false

    var body: some View {
        VStack(alignment: .leading){
            
            Group {
                Text("Create your account!").font(.system(size: 36, weight: Font.Weight.bold)).padding( .vertical, 8)
                
                Text("Get started using your account").font(.system(size: 16)).foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.938))
            
            }
           
            
            Group{
                Text("Username*").font(.system(size: 20, weight: Font.Weight.medium))
                HStack {
                    Image(systemName: "person.fill")
                   
                    TextField("Enter your username", text: $email)
                }.padding(24).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.938)).cornerRadius(8)
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
            
        
             
                
            VStack {
                Button(action: {}, label:{ Text("Register").foregroundColor(.white).font(.system(size: 16, weight: Font.Weight.bold))
                    
                }).padding(24).frame(maxWidth: .infinity).background(.black).cornerRadius(9)
                
                Text("Already have an account? Login")
            }.padding(.top, 64)

          
        }.padding(8)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

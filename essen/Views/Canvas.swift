//
//  Canvas.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct Canvas<Content : View> : View {
    let content: Content
    @EnvironmentObject var AuthState: AuthState
    @EnvironmentObject var EssenState: EssenState
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

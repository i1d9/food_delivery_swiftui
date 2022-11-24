//
//  MapCard.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

struct MapCard<Content: View>: View {
    
    @EnvironmentObject var business : EssenState
    
    
    let cardWidth: CGFloat
    let cardHeight: CGFloat

    var _id: Int
    var content: Content

    @inlinable public init(
        _id: Int,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        cardHeight: CGFloat,
        @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2)
        self.cardHeight = cardHeight
        self._id = _id
    }
    
    
    
    var body: some View {
        content
            .frame(width: cardWidth, height: _id == business.current.id ? cardHeight : cardHeight - 60, alignment: .center)
    }
}


//
//  Carousel.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI

import MapKit

struct Carousel<MapCards : View> : View {
    let items: MapCards
    let numberOfItems: CGFloat //= 8
    let spacing: CGFloat //= 16
    let widthOfHiddenCards: CGFloat //= 32
    let totalSpacing: CGFloat
    let cardWidth: CGFloat
    
    @GestureState var isDetectingLongPress = false
    
    @EnvironmentObject var mapSwipeController: MapSwipeController
        
    @EnvironmentObject var essenState: EssenState
        
    @inlinable public init(
        numberOfItems: CGFloat,
        spacing: CGFloat,
        widthOfHiddenCards: CGFloat,
        @ViewBuilder _ items: () -> MapCards) {
        
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.widthOfHiddenCards = widthOfHiddenCards
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2)
        
    }
    
    var body: some View {
        
        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = widthOfHiddenCards + spacing
        let totalMovement = cardWidth + spacing

        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(mapSwipeController.businessIndex))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(mapSwipeController.businessIndex) + 1)

        var calcOffset = Float(activeOffset)

        if (calcOffset != Float(nextOffset)) {
            calcOffset = Float(activeOffset) + mapSwipeController.screenDrag
        }
        
        return HStack(alignment: .center, spacing: spacing) {
            items
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
            self.mapSwipeController.screenDrag = Float(currentState.translation.width)

        }.onEnded { value in
            self.mapSwipeController.screenDrag = 0

            if (value.translation.width < -50) {
                
                
                
                let businessIndex = self.mapSwipeController.businessIndex + 1
                let business = self.essenState.businesses[businessIndex]
                
                self.mapSwipeController.businessIndex = businessIndex
                self.essenState.current = business
                
                self.essenState.region = MKCoordinateRegion(center: business.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01628962146283497, longitudeDelta: 0.01592863624435381))
                print(business.coordinate)
                
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }

            if (value.translation.width > 50) {
                
                
                let businessIndex = self.mapSwipeController.businessIndex - 1
                let business = self.essenState.businesses[businessIndex]
                
                self.mapSwipeController.businessIndex = businessIndex
                self.essenState.current = business
                
                print(business.coordinate)
                
                
                self.essenState.region = MKCoordinateRegion(center: business.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01628962146283497, longitudeDelta: 0.01592863624435381))
                
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        })
    }
}

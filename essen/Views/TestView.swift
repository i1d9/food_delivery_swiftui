//
//  TestView.swift
//  essen
//
//  Created by Ian Nalyanya on 24/11/2022.
//

import SwiftUI


struct TestView: View {
    
    
    
    private let colors: [Color] = [.red, .green, .blue]
  
     @State private var names: [String] = ["Red", "Green", "Blue"]
    @State  var scrollOffset: CGFloat
    @State  var dragOffset: CGFloat
    @State var currentColor: Int = 0
      
      var items: Int = 3
      var itemWidth: CGFloat  = UIScreen.main.bounds.size.width - 10
      var itemSpacing: CGFloat = 30

    init() {
         
           // Calculate Total Content Width
           let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
           let screenWidth = UIScreen.main.bounds.width
           
           // Set Initial Offset to first Item
           let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
           
           self._scrollOffset = State(initialValue: initialOffset)
           self._dragOffset = State(initialValue: 0)
       }
  
    var body: some View {
      
        VStack {
            Text(names[currentColor])
            HStack(alignment: .center, spacing: 30){
                
                ForEach(colors, id: \.self){ color in
                    
                    color.frame(width: itemWidth, height: 100)
                }
            }.offset(x: scrollOffset + dragOffset, y: 0)
                .gesture(DragGesture()
                    .onChanged({ event in
                        dragOffset = event.translation.width
                    })
                    .onEnded({ event in
                        
                        
                        
                
                        names = names.reversed()
                        
                        
                        // Scroll to where user dragged
                        scrollOffset += event.translation.width
                        dragOffset = 0
                        
                        // Now calculate which item to snap to
                        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
                        let screenWidth = UIScreen.main.bounds.width
                        
                        // Center position of current offset
                        let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                        
                        // Calculate which item we are closest to using the defined size
                        var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                      
                        
                        // Should we stay at current index or are we closer to the next item...
                        if index.remainder(dividingBy: 1) > 0.5 {
                            index += 1
                            

                        } else {
                            index = CGFloat(Int(index))
                            currentColor = Int(index)
                            

                          
                        }
                        
                        // Protect from scrolling out of bounds
                        index = min(index, CGFloat(items) - 1)
                        index = max(index, 0)
                        
                     
                        
                        
                        // Set final offset (snapping to item)
                        let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                        
                        // Animate snapping
                        withAnimation {
                            scrollOffset = newOffset
                        }
                        
                    })
            )
        }
    }
}





struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}

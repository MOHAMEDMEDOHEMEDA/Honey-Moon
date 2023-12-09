//
//  ContentView.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 29/11/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - properties
    
    @State var showAlert : Bool = false
    @State var showGuide : Bool = false
    @State var showInfo : Bool = false
    @GestureState private var dragState = DragState.inactive
    
    @State private var dragAreaThreshold : CGFloat = 65.0
    @State private var lastCardIndex : Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom

// MARK: - CardView
    
    @State var cardViews: [CardView] = {
      var views = [CardView]()
      for index in 0..<2 {
        views.append(CardView(honeyMoon: honeyMoonData[index]))
      }
      return views
    }()
    
    
    // MARK: - move the cards
    private func moveCards(){
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let honeyMoon = honeyMoonData[lastCardIndex % honeyMoonData.count]
        let newCardView = CardView(honeyMoon: honeyMoon)
        cardViews.append(newCardView)
    }
    
    // MARK: - top Cards
    
     func isTopCard(cardView: CardView) -> Bool{
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else {
            return false
        }
       return index == 0
    }

    
    // MARK: - drag states
    enum DragState {
      case inactive
      case pressing
      case dragging(translation: CGSize)
      
      var translation: CGSize {
        switch self {
        case .inactive, .pressing:
          return .zero
        case .dragging(let translation):
          return translation
        }
      }
      
      var isDragging: Bool {
        switch self {
        case .dragging:
          return true
        case .pressing, .inactive:
          return false
        }
      }
      
      var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
          return true
        case .inactive:
          return false
        }
      }
    }
    
    var body: some View {
        

   
        VStack {
            // MARK: - Header
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity( dragState.isDragging ? 0.0 : 1.0)
                .animation(.default,value: dragState.isDragging)
            Spacer()
            // MARK: - Cards
            ZStack{
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack{
                                
                                // xmark sympol
                            Image(systemName: "xmark.circle")
                                    .modifier(SympolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // heart sympol
                                Image(systemName: "heart.circle")
                                    .modifier(SympolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            
                                
                        }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,y: isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(self.dragState.translation.width/12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120),value: dragState.isDragging)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating($dragState, body: { value, state, transaction in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                    
                                case .second(true, let drag):
                                    if let drag = drag {
                                        state = .dragging(translation: drag.translation)
                                    }
                                    
                                default:
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true,let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -dragAreaThreshold{
                                        self.cardRemovalTransition = AnyTransition.leadingBottom
                                    }
                                    if drag.translation.width > dragAreaThreshold{
                                        self.cardRemovalTransition = AnyTransition.trailingBottom
                                    }
                                    
                                })
                                .onEnded({ (value) in
                                    
                                    guard case .second(true,let drag?) = value else {
                                        return
                                    }
                                    if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                        PlaySound(sound: "sound-rise", type: "mp3")

                                        self.moveCards()
                                    }
                                    
                                })
                                 
                        ).transition(self.cardRemovalTransition)
                        
                     
                }
            }
            .padding(.horizontal)
            
            Spacer()
            // MARK: - Footer
            FooterView(showBookingAlert: $showAlert)
                .opacity( dragState.isDragging ? 0.0 : 1.0)
                .animation(.default,value: dragState.isDragging)
            }
        .alert(isPresented: $showAlert){
            Alert(title: Text("success"), message: Text("wishing a lovely and precious times together for the amazing couple ."), dismissButton: .default(Text("Happy Honeymoon!")))
        }
      
    }
}

#Preview {
    ContentView()
}

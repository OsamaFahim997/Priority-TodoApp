//
//  NoItemView.swift
//  Priority
//
//  Created by Osama Fahim on 2/2/25.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person, I think you should click the button and add a bunch of item to your todo list.")
                    .padding(.bottom, 20)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(height: 60)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .background(animate ? Color.red : Color.blue).cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                        color: animate ? Color.red.opacity(0.5) : Color.blue.opacity(0.5),
                        radius: animate ? 20 : 30,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: {
                addAnimation()
            })
        }
        .frame(width: 400)
        .frame(maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard animate == false else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    NoItemView()
}

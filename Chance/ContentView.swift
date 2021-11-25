//
//  ContentView.swift
//  Chance
//
//  Created by Sabina Huseynova on 25.11.21.
//

import SwiftUI

struct ContentView: View {
    @State var hex1: Double = 0
    @State var hex2: Double = 0
    @State var hex3: Double = 0
    @State var recText: [String] = ["1", "2", "3", "4", "5", "6"]
    @State var arr1: [Double]?
    @State var arr2: [Double]?
    @State var arr3: [Double]?
    @State var visibility: Double?

    var body: some View {

        VStack(spacing: 300){
            Spacer()
            HStack {
                ZStack {
                    ForEach(0..<recText.count) {
                        Rectangle()
                            .fill( .black)
                            .opacity(0.8)
                            .border(Color.purple, width: 3)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: .purple, radius: 10)
//                            .zIndex(1)
                            .overlay(
                                Text(recText[$0])
                                    .foregroundColor(.white)
                                    .frame(width: 64, height: 64, alignment: .center)
                                    .font(.largeTitle)
                                    .shadow(color: .white, radius: 30)
                                
                            )
                            .rotation3DEffect(.degrees(Double(arr1?[$0] ?? 0)), axis: (x: 1, y: 0, z: 0), anchor: UnitPoint.center, anchorZ: 80, perspective: 0)
                    }
                }
                Spacer()
                ZStack {
                    ForEach(0..<recText.count) {
                        Rectangle()
                            .fill( .black)
                            .opacity(0.8)
                            .border(Color.purple, width: 3)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: .purple, radius: 10)
//                            .zIndex(1)
                            .overlay(
                                Text(recText[$0])
                                    .foregroundColor(.white)
                                    .frame(width: 64, height: 64, alignment: .center)
                                    .font(.largeTitle)
                                    .shadow(color: .white, radius: 30)
                                
                            )
                            .rotation3DEffect(.degrees(Double(arr2?[$0] ?? 0)), axis: (x: 1, y: 0, z: 0), anchor: UnitPoint.center, anchorZ: 80, perspective: 0)
                    }
                }
                Spacer()
                ZStack {
                    ForEach(0..<recText.count) {
                        Rectangle()
                            .fill( .black)
                            .opacity(0.8)
                            .border(Color.purple, width: 3)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: .purple, radius: 10)
                            .onAppear{
                                visibility = 2
                            }
                            .onDisappear{
                                visibility = 0

                            }
                            .opacity(visibility ?? 1)
                            .overlay(
                                Text(recText[$0])
                                    .foregroundColor(.white)
                                    .shadow(color: .white, radius: 10)
                                    .frame(width: 64, height: 64, alignment: .center)
                                    .font(.largeTitle)

                            )
                            .rotation3DEffect(.degrees(Double(arr3?[$0] ?? 0)), axis: (x: 1, y: 0, z: 0), anchor: UnitPoint.center, anchorZ: 80, perspective: 0)
//                            .zIndex(visibility ?? 1)

                    }
                }.layoutPriority(visibility ?? 1)
            }

            Button(action: {
                withAnimation(.interpolatingSpring(stiffness: 7, damping: 3)) {
                    generateCount()
                }
            }) {
                Text("CHANCE")
                    .fontWeight(.regular)
                    .font(.title2)
                    .shadow(radius: 30)

            }
            .frame(minWidth: 0, maxWidth: 100 )
            .padding()
            .foregroundColor(.white)
            .background(.black)
            .border(Color.mint, width: 5)
            .shadow(radius: 30)
            .cornerRadius(10)
            
            Spacer()
        }
        .padding()
        .background(Color.black)
    }
    func generateCount() {
        hex1 = round(Double.random(in: 0..<1) * 6)
        hex2 = round(Double.random(in: 0..<1) * 6)
        hex3 = round(Double.random(in: 0..<1) * 6)
        
        let degArr = [0, -60, -120, -180, -240, -300]
        arr1 = degArr.map{ item in
            Double(item) - hex1 * 60}
        arr2 = degArr.map{ item in
            Double(item) - hex2 * 60}
        arr3 = degArr.map{ item in
            Double(item) - hex3 * 60}
    
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

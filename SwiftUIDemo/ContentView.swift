//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by subash on 8/28/20.
//  Copyright © 2020 symbolicTrace. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    @State var showAlert = false
    
    func computeScore() -> Int {
        let rDiff = rGuess -  rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt((rDiff * rDiff + gDiff * gDiff
            + bDiff * bDiff) / 3.0)
          return lround((1.0 - diff) * 100.0)
    }
    
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    self.showAlert ? Text( "R: \(Int(rGuess * 255.0))"
                        + "G: \(Int(gGuess * 255.0))"
                        + "B: \(Int(bGuess * 255.0))"
                        ) : Text("Match this Color").fontWeight(.semibold)
                }
                
                //Guess Color View
                VStack {
                    ZStack(alignment: .center) {
                        Color(red: rGuess, green: gGuess, blue: bGuess)
                        Text("60").padding(.all,6).background(Color.white.foregroundColor(.black)).mask(Circle())
                    }
                    Text( "R: \(Int(rGuess * 255.0))"
                        + "G: \(Int(gGuess * 255.0))"
                        + "B: \(Int(bGuess * 255.0))"
                    ).fontWeight(.ultraLight)
                }
            }
            Button(action: { self.showAlert = true }) {
                Text("Hit Me!")
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"),message: Text(String(computeScore())))
            }.padding()
            //Slider
            VStack{
                ColorSlider(value: $rGuess, textColor: .red)
                ColorSlider(value: $gGuess, textColor: .green)
                ColorSlider(value: $bGuess, textColor: .blue)
            }.padding(.horizontal)
        }.font(Font.subheadline.lowercaseSmallCaps().weight(.light))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

struct ColorSlider: View {
    @Binding var value: Double
    var textColor: Color
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value).background(textColor).cornerRadius(10)
            Text("255").foregroundColor(textColor)
        }
    }
}

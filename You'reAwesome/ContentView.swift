//
//  ContentView.swift
//  You'reAwesome
//
//  Created by Student1 on 2/10/25.
//

import SwiftUI

    struct ContentView: View {
        @State private var message = ""
        @State private var imageName = ""
        @State private var lastMessageNumber = -1 // lastMessageNumber will never be -1
        @State private var lastImageNumber = -1
        
        var body: some View {
            
            VStack{
                Text(message)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .frame(height: 100)
                
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(radius: 30)
                    .animation(.easeInOut(duration: 0.15), value: message)
              
                Spacer()
                
                
                Button("Show Message"){
                    let messages = ["You Are Awesome!",
                                    "You Are Great",
                                    "You Are Fantastic!",
                                    "Fabulous? That's You!",
                                    "You Make Me Smile!",
                                    "When the Genius Bar Needs Help, They Call You"]
                    
                    // generate a random messageNumber to use as an index
                    // if messageNumber == lastMessageNumber {
                    //    keep generating a new random messageNumber
                    //    until you get a messageNumber != lastMessageNumber
                    // set messageString to message[messageNumber]
                    // update the lastMessageNumber with messageNumber
                    
                    var messageNumber : Int
                    repeat {
                        messageNumber = Int.random(in: 0...messages.count-1)
                    }while messageNumber == lastMessageNumber
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    var imageNumber = Int.random(in: 0...9)
                    while imageNumber == lastImageNumber {
                        imageNumber = Int.random(in: 0...9)
                    }
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                }
                .buttonStyle(.borderedProminent)
                .font(.title2)
       
                }
                .padding()
            }
        }
        
        #Preview {
            ContentView()
        }

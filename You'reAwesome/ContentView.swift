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
        @State private var imageNumber = 0
        @State private var messageNumber = 0
        
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
                    
                    message = messages[messageNumber]
                    messageNumber += 1
                    if messageNumber == messages.count {
                        messageNumber = 0
                    }
                    
                    imageName = "image\(imageNumber)"
                    imageNumber += 1
                    
                    if imageNumber > 9{
                        imageNumber = 0
                    }
                    
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

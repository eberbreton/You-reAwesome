//
//  ContentView.swift
//  You'reAwesome
//
//  Created by Student1 on 2/10/25.
//

import SwiftUI
import AVFAudio

    struct ContentView: View {
        @State private var message = ""
        @State private var imageName = ""
        @State private var lastMessageNumber = -1 // lastMessageNumber will never be -1
        @State private var lastImageNumber = -1
        @State private var lastSoundNumber = -1
        @State private var audioPlayer :AVAudioPlayer!
        let numberOfImages = 10 // images labeled image0 - image9
        let numberOfSounds = 6 // sounds labled sound0 - sound5
        
        var body: some View {
            
            VStack{
                Text(message)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .frame(height: 100)
                    .animation(.easeInOut(duration: 0.15), value: message)
               
                Spacer()
                
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

                    var messageNumber : Int
                    repeat {
                        messageNumber = Int.random(in: 0...messages.count-1)
                    }while messageNumber == lastMessageNumber
                    message = messages[messageNumber]
                    lastMessageNumber = messageNumber
                    
                    var imageNumber : Int
                    repeat {
                        imageNumber = Int.random(in: 0...(numberOfImages-1))
                    } while imageNumber == lastImageNumber
                    imageName = "image\(imageNumber)"
                    lastImageNumber = imageNumber
                    
                    var soundNubmer : Int
                    repeat {
                        soundNubmer = Int.random(in: 0...(numberOfSounds-1))
                    } while soundNubmer == lastSoundNumber
                    lastSoundNumber = soundNubmer
                    let soundName = "sound\(soundNubmer)"
                    
                    guard let soundFile = NSDataAsset(name: soundName) else {
                        print("😡 Could not read file named\(soundName)")
                        return
                    }
                    do {
                        audioPlayer = try AVAudioPlayer(data: soundFile.data)
                        audioPlayer.play()
                    }catch{
                        print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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

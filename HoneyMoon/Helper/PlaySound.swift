//
//  PlaySound.swift
//  HoneyMoon
//
//  Created by Mohamed Magdy on 09/12/2023.
//

import AVFoundation

var audioPlayer : AVAudioPlayer?

func PlaySound(sound: String , type : String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
            
        }
        catch{
            print("Error: could not find and play sound of this path")
        }
    }
        
}

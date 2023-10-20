//
//  insultComebackSystem.swift
//  BattleBot
//
//  Created by Leo Bogeun Kim on 9/10/23.
//

import SwiftUI

struct insultComebackSystem
//this struct generates random insults and displays them
{
      var insultArray = [
            "you're stupid",
            "you clueless idiot",
            "haha can you stop selling?",
            "you're making me feel retarded being with you",
            "you just suck don't you",
            "Brain-dead dolt",
            "Feeble-minded moron",
            "Ignorant simpleton",
            "Idiotic buffoon",
            "Stupid dunce",
            "Blockheaded twit",
            "Ignorant oaf",
            "Dull-witted dimwit",
            "Foolish nitwit",
            "Lamebrain dweeb",
            "Mindless dork",
            "Absurd numskull",
            "Empty-headed ninny",
            "Clumsy oaf",
            "Daft chump",
            "Doltish blockhead",
            "Inept dummy",
            "Dorky numbskull",
            "Empty-headed goof",
            "Foolish dweeb",
            "Gormless dimwit",
            "Numbskull ninny",
            "Dullard dolt",
            "Absurd goof",
            "Dunderheaded chump",
            "Clumsy dimwit",
            "Dull-witted oaf",
            "Half-witted numbskull",
            "Ridiculous dweeb",
            "Brain-dead dunce",
            "Lamebrain imbecile",
            "Empty-headed twit",
            "Daft chump",
            "Doltish blockhead",
            "Inept dork",
            "Absurd goof",
            "Gormless dimwit",
            "Foolish ninny",
            "Nonsensical oaf",
            "Absurd buffoon",
            "Dunderheaded dweeb",
            "Clumsy twit",
            "Absurd dunce",
            "Lamebrain chump",
            "Mindless dolt",
            "Numbskull nincompoop",
            "Ridiculous dimwit"
        ]
     // This function takes in a number that will be dynamically updated and return a text based on what that number is.
      mutating func insultDisplay(counter: Int) -> some View
      {
            var insultDisplayer: Text
            if counter < 1
            {
                  insultDisplayer = Text(insultArray[Int.random(in: 0...49)]).font(Font.custom("Courier New Bold", size: 25)).foregroundColor(.yellow)
            }
            else
            {
                  insultDisplayer = Text("I'll INSULT YOU AGAIN IN \(counter)").font(Font.custom("Courier New Bold", size: 25)).foregroundColor(.teal)
            }
            return insultDisplayer
      }
}




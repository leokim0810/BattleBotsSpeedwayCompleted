//
//  ContentView.swift
//  BattleBot
//
//  Created by Leo Kim on 2023/10/08.
//

import SwiftUI

struct ContentView: View
{
    
    //@State was used to update the UI each time a change is made
    let buttonMaking = buttons()
    @State var insultDisplay = insultComebackSystem()
    @State var Counter: Int = 0
    @State var comeback: String = ""
    @State var ammoStatus: Bool = false
    
    //this function will be called when I press enter on a keyboard
    func dismissKeyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        //this bit counts how many words the user typed in.
        Counter = comeback.count
        //since Counter will be dynamically updated it will eventually reach 0 so I used a if statement.
        if Counter > 0
        {
            //This bit makes a counter which will update Counter each time and also make ammoStatus equal true so that the buttons get activated again.
            ammoStatus = true
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
            { timer in
                Counter -= 1
                
                if Counter < 0
                {
                    //invalidates the timer so that it doesn't keep running in the background also disables the buttons.
                    timer.invalidate()
                    ammoStatus = false
                }
            }
            
        }
        
    }
    var body: some View
    {
        //this is the UI design
        ZStack
        {
            Image("backgroundImage").resizable().aspectRatio(contentMode: .fill)
            VStack
            {
                Spacer()
                Spacer()
                //this is the textfield that takes in user input
                TextField("TYPE YOUR RESPONSE TO INSULTS", text: $comeback, onCommit: {
                    self.dismissKeyboard()
                    Counter = comeback.count
                }).multilineTextAlignment(.center).background(Color.yellow).foregroundColor(.teal).padding(10).font(Font.custom("Courier New Bold", size: 20)).opacity(0.75).disabled(Counter > 1).onTapGesture {comeback = ""}
                //for the textfield I made sure to disable the textfield when the timer is not over and also mae sure to reset the textfield if the user taps it.
                Spacer()
                //these are the buttons that will send bluetooth signals
                buttonMaking.buttonDesign(buttonName: "ForwardButtonImage", ammo: ammoStatus)
                HStack
                {
                    buttonMaking.buttonDesign(buttonName: "LeftButtonImage", ammo: ammoStatus)
                    buttonMaking.buttonDesign(buttonName: "AttackButtonImage", ammo: ammoStatus)
                    buttonMaking.buttonDesign(buttonName: "RightButtonImage", ammo: ammoStatus)
                    }
                    
                buttonMaking.buttonDesign(buttonName: "BackwardButtonImage", ammo: ammoStatus)
                Spacer()
                //displays insults
                insultDisplay.insultDisplay(counter: Counter).multilineTextAlignment(.center)
                Spacer()
                Spacer()
            }
                
        }
            
    }
}
    
struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}


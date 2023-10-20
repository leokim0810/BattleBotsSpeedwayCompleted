//
//  button.swift
//  BattleBot
//
//  Created by Leo Bogeun Kim on 9/10/23.
//

import SwiftUI

struct buttons
{
    //this struct makes a button that will have bluetooth inside it
    var bluetoothViewModel = bluetoothConnection()
    //the function takes in the name of the button I want to output and also whether or not there is ammo. The ammo will be dynamically updated as well.
    func buttonDesign(buttonName: String, ammo: Bool) -> some View
    {
        return Button(action:
        {
            if ammo == true
            {
                //encodes the buttonName of the button that was pressed so that we can send it via bluetooth
                let dataToSend = "\(buttonName)".data(using: .utf8)
                // Call the method from BluetoothConnection to send data
                bluetoothViewModel.sendData(data: dataToSend ?? Data())
            }
            else
            {
                print("LOLNoAmmo")
            }
        })  {
                Image("\(buttonName)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
            }
    }
}
    
    


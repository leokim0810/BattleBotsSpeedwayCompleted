//
//  bluetoothConnection.swift
//  BattleBot
//
//  Created by Leo Bogeun Kim on 13/10/23.
//
import SwiftUI
import CoreBluetooth
//we need this if we want to work with bluetooth
//I made a large part of this class following a tutorial and edited the code to suit me.(https://www.youtube.com/watch?v=n-f0BwxKSD0)

//handles bluetooth also had to make this a class rather than a struct because it has to inherit.
class bluetoothConnection:NSObject, ObservableObject
{
    //also all the variables below is a instance of a class/struct which was imported using coreblutooth
    var characteristic: CBCharacteristic?
    var centralManager: CBCentralManager?
    var peripherals: CBPeripheral?
    @Published var peripheralName: [String] = []
    
    override init()
    {
        //sets everything up also gets the initializer of the superclass
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    //this function is used to send data
    func sendData(data: Data) {
        guard let peripheral = self.peripherals, let characteristic = self.characteristic else {
            print("Peripheral or characteristic not available")
            return
        }
        
        peripheral.writeValue(data, for: characteristic, type: .withoutResponse)
    }
}
    extension bluetoothConnection: CBCentralManagerDelegate
    {
        //so this finds the characteristic so that I can send data to it it is used in the send data function.
        func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?)
        {
            if let characteristics = service.characteristics
            {
                for characteristic in characteristics
                {
                    // Check if the characteristic UUID matches the one you are looking for
                    if characteristic.uuid == CBUUID(string: "YOUR_CHARACTERISTIC_UUID_HERE")
                    {
                        self.characteristic = characteristic
                    }
                }
            }
        }
        func centralManagerDidUpdateState(_ central: CBCentralManager)
        {
            if central.state == .poweredOn
            {
                //checks if bluetooth is poweredon
                self.centralManager?.scanForPeripherals(withServices: nil)
            }
        }
        func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber)
        {
            self.peripherals = peripheral
        }
    }

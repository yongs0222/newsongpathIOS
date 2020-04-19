//
//  getID.swift
//  
//
//  Created by Cherish Park on 4/19/20.
//

import Foundation
import UIKit

class getID{
    /// Creates a new unique user identifier or retrieves the last one created
        func getUUID() -> String? {
            
            // create a keychain helper instance
            let keychain = KeychainAccess()
            
            // this is the key we'll use to store the uuid in the keychain
            let uuidKey = "com.myorg.myappid.unique_uuid"
            
            // check if we already have a uuid stored, if so return it
            if let uuid = try? keychain.queryKeychainData(itemKey: uuidKey), uuid != nil {
                return uuid
            }
            
            // generate a new id
            guard let newId = UIDevice.current.identifierForVendor?.uuidString else {
                return nil
            }
            
            // store new identifier in keychain
            try? keychain.addKeychainData(itemKey: uuidKey, itemValue: newId)
            
            // return new id
            return newId
    }
}

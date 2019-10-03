//
//  ContentView.swift
//  HowToUseObservedObjectToManageStateFromExternalObjects
//
//  Created by ramil on 03/10/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import Combine
import SwiftUI

class UserAuthentication: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    var username = "" {
        willSet {
            objectWillChange.send()
        }
    }
}

class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @ObservedObject var settings = UserAuthentication()

    var body: some View {
        VStack {
            TextField("Username", text: $settings.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Text("Your username is: \(settings.username)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

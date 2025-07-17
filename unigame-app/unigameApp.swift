//
//  unigameApp.swift
//  unigame-app
//
//  Created by Josh Auerbach on 6/27/25.
//

import SwiftUI

@main
struct unigameApp: App {
    @State var chosenGame: Game? = nil
    var body: some Scene {
        WindowGroup {
            Group {
                if let chosenGame {
                    gameView(chosenGame)
                } else {
                    ChoosingView()
                }
            }
        }
    }
}

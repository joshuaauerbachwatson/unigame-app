//
//  GameChoice.swift
//  unigame-app
//
//  Created by Josh Auerbach on 7/16/25.
//

import SwiftUI
import unigame
import AuerbachLook

//
// Supported games
//
import tictactoe

enum Game: String, Identifiable, Hashable {
    case TicTacToe
    case AnyCards
    case Test
    // Add as needed
    
    var id: String {
        rawValue
    }
    var name: String {
        rawValue
    }
}

fileprivate let games = [
    Game.TicTacToe,
    Game.AnyCards,
    // Add here as well
]

#if DEBUG
let GameTable = games + [Game.Test]
#else
let GameTable = games
#endif

// Model variables (lazy stored variables, initialized at most once, on demand)
var tictactoeModel: UnigameModel<TicTacToeHandle> = {
     TicTacToeHandle.makeModel()
}()
// Add here as well

//
// Make the appropriate GameView and model for a choice
//
@ViewBuilder
func gameView(_ game: Game) -> some View {
    switch game {
    case .TicTacToe:
        ContentView<TicTacToeHandle>().environment(tictactoeModel)
    case .Test:
        Logger.logFatalError("UnigameTest project not yet converted")
    case .AnyCards:
        Logger.logFatalError("AnyCards project not yet converted")
    // Add clauses as needed
    }
}

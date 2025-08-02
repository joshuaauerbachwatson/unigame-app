/**
 * Copyright (c) 2021-present, Joshua Auerbach
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI
import unigame
import AuerbachLook

//
// Supported games
//
import tictactoe
import UnigameTest
import anyCards

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

//
// Make the appropriate GameView and model for a choice
//
@ViewBuilder
func gameView(_ game: Game, _ terminator: @escaping ()->Void) -> some View {
    switch game {
    case .TicTacToe:
        ContentView<TicTacToeHandle>()
            .environment(TicTacToeHandle.model)
            .environment(\.endGame, terminator)
    case .Test:
        ContentView<TestGameHandle>()
            .environment(TestGameHandle.model)
            .environment(\.endGame, terminator)
    case .AnyCards:
        ContentView<AnyCardsGameHandle>()
            .environment(AnyCardsGameHandle.model)
            .environment(\.endGame, terminator)
    // Add clauses as needed
    }
}

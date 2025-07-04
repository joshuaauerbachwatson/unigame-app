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
import tictactoe
import AuerbachLook

/* Define the games that are supported. */
enum Game: String, Identifiable, Hashable {
    case TicTacToe, AnyCards, Test
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
]
#if DEBUG
let GameTable = games + [Game.Test]
#else
let GameTable = games
#endif

// Game choosing view, overlays with the standard unigame ContentView specialized to the chosen game
struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(GameTable) { game in
                NavigationLink(game.name, value: game)
            }
            .navigationDestination(for: Game.self) { game in
                switch game {
                case .TicTacToe:
                    unigame.ContentView<TicTacToeHandle>()
                        .environment(TicTacToeHandle.makeModel())
                case .AnyCards:
                    Logger.logFatalError("No support yet for \(Game.AnyCards.name)")
                case .Test:
                    Logger.logFatalError("No support yet for \(Game.Test.name)")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

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

// Game choosing view.  Precedes and delegates to the standard unigame  ContentView specialized
// to the chosen game
struct ChoosingView: View {
    @State var app: unigameApp?
    var body: some View {
        VStack {
            List(GameTable) { game in
                Button(game.name) {
                    app?.chosenGame = game
                }
            }
        }
        .padding()
    }
}

#Preview {
    ChoosingView()
}

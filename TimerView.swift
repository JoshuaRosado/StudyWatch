//
//  TimerView.swift
//  StudySpace
//
//  Created by Joshua Rosado Olivencia on 4/2/25.
//

import SwiftUI

struct TimerView: View {
    @State var timeRemaining: Int
    @State var introViewVisible: Binding<Bool>
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        // Displaying timeRemaining
        Text(timeRemaining, format: .number)
            // receiving timer
            .onReceive(timer) { _ in
                // As long "timer" runs and "timeRemaining" is greater than 0
                if timeRemaining > 0 {
                    // subtract 1 from timeRemaining
                    timeRemaining -= 1
                }
                    // when timeRemaining reaches 0
                else if timeRemaining == 0 {
                    withAnimation{
                        // stop timer
                        timer.upstream.connect().cancel()
                        // make introView invisible
                        introViewVisible.wrappedValue = false
                    }
                }
            }
        // Hide the timeRemaining( We do not need it visible )
            .opacity(0)
        
    }
}

#Preview {
    TimerView(timeRemaining: 5, introViewVisible: .constant(true))
}

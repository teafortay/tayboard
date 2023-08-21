//
//  Haptics.swift
//  Dvorak-Right-Handed
//
//  Created by Taylor Shaw on 8/20/23.
//  Copyright © 2023 Taylor Shaw. All rights reserved.
//

import CoreHaptics

class HapticManager {
  let engine: CHHapticEngine

  init?() {
    let hapticCapability = CHHapticEngine.capabilitiesForHardware()
    guard hapticCapability.supportsHaptics else {
      return nil
    }
      
      do {
          engine = try CHHapticEngine()
      } catch let error {
          fatalError("Engine Creation Error: \(error)")
      }
  }
}

extension HapticManager {
    private func tapPattern() throws -> CHHapticPattern {
        let tap = CHHapticEvent(
            eventType: .hapticTransient,
            parameters: [
            CHHapticEventParameter(parameterID: .hapticIntensity, value: 1.0),
            CHHapticEventParameter(parameterID: .hapticSharpness, value: 1.0)
          ],
            relativeTime: 0.0,
            duration: 1.0)
        
        return try CHHapticPattern(events: [tap], parameters: [])
    }
    
    func playTapHaptic() {
      do {
        let pattern = try tapPattern()
        try engine.start()
        let player = try engine.makePlayer(with: pattern)
        try player.start(atTime: CHHapticTimeImmediate)
        engine.notifyWhenPlayersFinished { _ in
          return .stopEngine
        }
      } catch {
        print("Failed to play haptic: \(error)")
      }
    }
}

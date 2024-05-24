//
//  CircleProgress.swift
//  NASA
//
//  Created by MacBook Pro on 24/05/24.
//

import SwiftUI

struct CircleProgress: View {
    var currentProgress : Bool
    
    var body : some View {
        Circle()
            .fill(currentProgress ? .mint : .gray)
            .frame(height: 10)
    }
}

#Preview {
    CircleProgress(currentProgress: true)
}

//
//  ScoreCardView.swift
//  WidgetAppGroup
//
//  Created by Ashlee Muscroft on 21/06/2021.
//

import SwiftUI

struct ScoreCardView: View {
    @Environment(\.widgetFamily) private var widgetFamily
    @State var match: Match
    
    var defaultView: some View {
        HStack(alignment: .center){
            Text(match.team1.name)
                .frame(maxWidth: 100)
            HStack(alignment: .center, spacing: 4, content: {
                Text(match.team1.flag?.rawValue ?? "")
                Text( "\(match.team1Score) - \(match.team1Score)")
                Text(match.team2.flag?.rawValue ?? "")
            }).fixedSize(horizontal: true, vertical: true)
            Text(match.team2.name)
                .frame(maxWidth: 100)
        }
    }
    
    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            Text(match.team1.fifaName)
            Text( "\(match.team1Score) - \(match.team1Score)")
            Text(match.team2.fifaName)
        case .systemMedium,
            .systemLarge:
            defaultView
        default:
            defaultView
        }
    }
}

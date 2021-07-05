//
//  Predictions.swift
//  Predictions
//
//  Created by Ashlee Muscroft on 21/06/2021.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct PredictionsEntryView : View {
    @Environment(\.widgetFamily) private var widgetFamily
    var entry: Provider.Entry
    let match = Match(team1: Team(name: "Czech Republic",fifaName: "CZE", flag: FifaFlags.CZE), team2: Team(name: "England", fifaName: "ENG", flag: FifaFlags.ENG), team1Score: 0, team2Score: 0)
    
    var matchRow: some View {
        HStack {
            ScoreCardView(match: match)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.modifier(bodyFontModifier())
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
 
    var gradient = AngularGradient(gradient: Gradient(colors: Color.euroColors1), center: .center, angle: .degrees(0))
    var lin = LinearGradient(gradient: Gradient(colors: Color.euroColors1), startPoint: .topLeading, endPoint: .bottomTrailing)
    var body: some View {
        ZStack {
            Color("WidgetBackground")
                .edgesIgnoringSafeArea(.all)
            
            Image("pitch")
                .resizable()
                .scaledToFit()
                .opacity(0.4)
            
            VStack(alignment: .center, spacing: 0){
                // use a geometryReader to use a precentage of the geometry height and width to pin the Super6 logo to the top by calculating position
                GeometryReader() { geometry in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    Image("super6-logo")
                        .resizable()
                        .scaledToFit()
                        .position(x: width * 0.5,y: height * 0.08)
                        .frame(width: 60, alignment: .center)
                }.frame(maxHeight: 100)
                .padding(.top,8)
                //GeometryReader takes all available space use a spacer to push logo up from center
                Spacer()
                // or position(x:y) with magic numbers here instead of GR
            }
            VStack {
                matchRow
                matchRow
                matchRow
                matchRow
                matchRow
                matchRow
            }
            .background(
                Color.black.opacity(0.2)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15.0)
                    .strokeBorder(gradient, lineWidth: 2,antialiased: true)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 15.0)
                //roundes the background shape,
            )
            .padding(calculatePadding())
            
        }
    }
    
    func calculatePadding() -> EdgeInsets{
        if widgetFamily == .systemLarge {
            return EdgeInsets(top: 36, leading: 24, bottom: 24, trailing: 24)
        } else {
            return EdgeInsets(top: 26, leading: 16, bottom: 16, trailing: 16)
        }
        //        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

@main
struct Predictions: Widget {
    let kind: String = "Predictions"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            PredictionsEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Predictions_Previews: PreviewProvider {
    static var previews: some View {
        PredictionsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        PredictionsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        PredictionsEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

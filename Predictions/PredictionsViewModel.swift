//
//  PredictionsViewModel.swift
//  editPredictions
//
//  Created by Kieran Hall on 18/06/2021.
//
//

import Foundation

struct PredictionsViewModel {
    var matches: [Match]
}

struct Match: Hashable {
    var team1: Team
    var team2: Team
    var team1Score: Int
    var team2Score: Int
}

struct Team: Hashable, Equatable {
    var name: String
    var fifaName: String
    var flag: FifaFlags?
    var imageURL: URL?
}

enum FifaFlags: String, CaseIterable{
    case AUT = "🇦🇹"
    case BEL = "🇧🇪"
    case CRO = "🇭🇷"
    case CZE = "🇨🇿"
    case DEN = "🇩🇰"
    case ENG = "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
    case FIN = "🇫🇮"
    case FRA = "🇫🇷"
    case GER = "🇩🇪"
    case HUN = "🇭🇺"
    case ITA = "🇮🇹"
    case NED = "🇳🇱"
    case MKD = "🇲🇰"
    case POL = "🇵🇱"
    case POR = "🇵🇹"
    case RUS = "🇷🇺"
    case SCO = "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
    case SVK = "🇸🇰"
    case SPA = "🇪🇸"
    case SWE = "🇸🇪"
    case SUI = "🇨🇭"
    case TUR = "🇹🇷"
    case UKR = "🇺🇦"
    case WAL = "🏴󠁧󠁢󠁷󠁬󠁳󠁿"
}

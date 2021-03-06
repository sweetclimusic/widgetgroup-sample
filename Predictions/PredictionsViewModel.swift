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
    case AUT = "đŚđš"
    case BEL = "đ§đŞ"
    case CRO = "đ­đˇ"
    case CZE = "đ¨đż"
    case DEN = "đŠđ°"
    case ENG = "đ´ó §ó ˘ó Ľó Žó §ó ż"
    case FIN = "đŤđŽ"
    case FRA = "đŤđˇ"
    case GER = "đŠđŞ"
    case HUN = "đ­đş"
    case ITA = "đŽđš"
    case NED = "đłđą"
    case MKD = "đ˛đ°"
    case POL = "đľđą"
    case POR = "đľđš"
    case RUS = "đˇđş"
    case SCO = "đ´ó §ó ˘ó łó Łó ´ó ż"
    case SVK = "đ¸đ°"
    case SPA = "đŞđ¸"
    case SWE = "đ¸đŞ"
    case SUI = "đ¨đ­"
    case TUR = "đšđˇ"
    case UKR = "đşđŚ"
    case WAL = "đ´ó §ó ˘ó ˇó Źó łó ż"
}

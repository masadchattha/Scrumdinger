//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 25/01/2023.
//

import Foundation

struct DailyScrum: Identifiable, Codable {
    var id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map{ Attendee(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
    
//    init(id: UUID = UUID(), title: String = "", attendees: [String] = [], lengthInMinutes: Int = 5, theme: Theme = .seafoam, meetingsHistory: [Date] = []) {
//        self.id = id
//        self.title = title
//        self.attendees = attendees.map{ Attendee(name: $0) }
//        self.lengthInMinutes = lengthInMinutes
//        self.theme = theme
//        self.meetingsHistory = meetingsHistory
//    }
}

extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}

// MARK: - Extension - Sample Data

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}

extension DailyScrum {
    static var sampleData1: [DailyScrum] {
        [
            DailyScrum(title: "Scrum Meeting 1", attendees: ["John","Mike","Amy"], lengthInMinutes: 30, theme: .yellow),
            DailyScrum(title: "Scrum Meeting 2", attendees: ["Jane","Bob","Emily"], lengthInMinutes: 45, theme: .orange),
            DailyScrum(title: "Scrum Meeting 3", attendees: ["Luke","Leia","Han"], lengthInMinutes: 60, theme: .poppy)
        ]
    }
}

//
//  DiaryPageRepository.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 11/04/25.
//

import Foundation
import SwiftData

class DiaryPageRepository {
    
    private let context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func createDiaryPage(title: String, content: String, mood: Mood, color: PageColor) -> DiaryPage {
        let diaryPage = DiaryPage(title: title, content: content, mood: mood, color: color)
        context.insert(diaryPage)
        saveContext()
        return diaryPage
    }
    
    func fetchAllDiaryPages() -> [DiaryPage] {
        let fetchRequest = FetchDescriptor<DiaryPage>()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Error fetching DiaryPages: \(error)")
            return []
        }
    }
    
    func fetchDiaryPage(by id: UUID) -> DiaryPage? {
        let fetchRequest = FetchDescriptor<DiaryPage>(predicate: #Predicate { $0.id == id })
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Error fetching DiaryPage by id: \(error)")
            return nil
        }
    }
    
    func updateDiaryPage(_ diaryPage: DiaryPage, title: String? = nil, content: String? = nil, mood: Mood? = nil, color: PageColor? = nil) {
        if let title = title {
            diaryPage.title = title
        }
        if let content = content {
            diaryPage.content = content
        }
        if let mood = mood {
            diaryPage.mood = mood
        }
        if let color = color {
            diaryPage.color = color
        }
        saveContext()
    }
    
    func deleteDiaryPage(_ diaryPage: DiaryPage) {
        context.delete(diaryPage)
        saveContext()
    }
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
}

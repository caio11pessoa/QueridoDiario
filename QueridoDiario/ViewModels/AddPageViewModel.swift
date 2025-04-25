//
//  AddPageViewModel.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 22/04/25.
//

import SwiftUI
import SwiftData

class PageViewModel: ObservableObject {
    @Published var id: UUID? = nil
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var mood: Mood = .empty
    @Published var color: PageColor = .purple

    private var repository: DiaryPageRepository?

    static let shared = PageViewModel()
   
    private init() {}
    
    func resetValues() {
        self.id = nil
        self.title = ""
        self.content = ""
        self.mood = Mood.empty
        self.color = PageColor.purple
    }
    
    func setValues(title: String, content: String, mood: Mood, color: PageColor) {
        self.id = id
        self.title = title
        self.content = content
        self.mood = mood
        self.color = color
    }
    
    func setValues(page: DiaryPage) {
        self.id = page.id
        self.title = page.title
        self.content = page.content
        self.mood = page.mood
        self.color = page.color
    }
   
    func initialize(context: ModelContext) {
       self.repository = DiaryPageRepository(context: context)
    }
   
    func getDiaryPage(by id: UUID) -> DiaryPage? {
        guard let repository = repository else {
            print("Repository is not initialized.")
            return nil
        }
        return repository.fetchDiaryPage(by: id)
    }
    
    func saveDiaryPage() {
        guard let repository = repository, !title.isEmpty, !content.isEmpty else {
                    print("Title and content cannot be empty or repository is not initialized.")
                    return
                }
    
        let _ = repository.createDiaryPage(title: title, content: content, mood: mood, color: color)
    }
    
    func deleteDiaryPage(by id: UUID) {
        guard let repository = repository else {
            print("Repository is not initialized.")
            return
        }
        if let page = repository.fetchDiaryPage(by: id) {
            repository.deleteDiaryPage(page)
        }
    }
}

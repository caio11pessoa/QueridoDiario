//
//  AddPageViewModel.swift
//  QueridoDiario
//
//  Created by Lais Godinho on 22/04/25.
//

import SwiftUI
import SwiftData

class AddPageViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var mood: Mood = .empty
    @Published var color: PageColor = .purple

    private var repository: DiaryPageRepository?

    static let shared = AddPageViewModel()
   
    private init() {}
   
    func initialize(context: ModelContext) {
       self.repository = DiaryPageRepository(context: context)
    }
   

    func saveDiaryPage() {
        guard let repository = repository, !title.isEmpty, !content.isEmpty else {
                    print("Title and content cannot be empty or repository is not initialized.")
                    return
                }
    
        let _ = repository.createDiaryPage(title: title, content: content, mood: mood, color: color)
    }
}

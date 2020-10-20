//
//  HotNewsViewModel.swift
//  Fast News
//
//  Copyright © 2019 Lucas Moreton. All rights reserved.
//

import Foundation
import UIKit

struct HotNewsViewModel {
    
    //MARK: - Properties
    
    var id: String
    var author: String
    var createdAt: String
    var title: String
    var comments: String
    var score: String
    var url: String
    var imageURL: String
    
    init(hotNews: HotNews) {
        id = hotNews.id ?? ""
        author = hotNews.authorFullname ?? ""
        createdAt = hotNews.created?.createdAt ?? ""
        title = hotNews.title ?? ""
        comments = hotNews.numComments?.toString ?? ""
        score = hotNews.score?.toString ?? ""
        url = hotNews.url ?? ""
        imageURL = hotNews.preview?.images?.first?.source?.url?.htmlDecoded ?? ""
    }
}

extension HotNewsViewModel: TypeProtocol {
    var type: Type { return .hotNews }
}

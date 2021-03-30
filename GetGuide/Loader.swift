//
//  Loader.swift
//  GetGuide
//
//  Created by Владислав Капицын on 30.03.2021.
//

import Foundation

class Loader {
    
    private var loadGuides: [Guide] = []
    
    func load() -> [Guide] {
        return [
            Guide(
                id: 0,
                contact: "ivan@mail.ru",
                rait: 4.78,
                firstName: "Иван",
                lastName: "Иванов",
                avatar: "https://miro.medium.com/max/720/1*W35QUSvGpcLuxPo3SRTH4w.png",
                comment:"Расскажу о Москве",
                place: "м. Арбат"
            ),
            Guide(
                id: 1,
                contact: "petrov@gmail.com",
                rait: 4.99,
                firstName: "Пётр",
                lastName: "Петров",
                avatar: "https://www.alliancerehabmed.com/wp-content/uploads/icon-avatar-default.png",
                comment:"Покажу нетуристический город",
                place: "м. Чистые пруды"
            ),
            Guide(
                id: 2,
                contact: "sergey@yandex.ru",
                rait: 3.8,
                firstName: "Сергей",
                lastName: "Сергеев",
                avatar: "https://us.123rf.com/450wm/stockgiu/stockgiu1802/stockgiu180208975/95900028-stock-vector-line-avatar-man-head-with-default-face-vector-illustration.jpg",
                comment:"Историк по образованию",
                place: "м. Лубянка"
            )
        ]
    }
    
    
    func getGuide(guideId: Int) -> Guide  {
        var data: [Guide] = []
        data = self.load()
        var _guide: Guide = data[0]
        
        for guide in data  {
            if (guide.id == guideId) {
                _guide = guide
                break
            }
        }
        
        return _guide
    }
}

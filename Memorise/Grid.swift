//
//  Grid.swift
//  Memorise
//
//  Created by 0507 on 29/05/2020.
//  Copyright © 2020 0507spc. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView  // ItemView is the returning factor
    
    // Init to avoid having to provide the identifier when calling this
    // escaping allows you to escape from the init without setting (i.e. get called later)
    init(_ items:  [Item], viewForItem: @escaping (Item) -> ItemView) {
        // This self allows you to differentiate local var to global ones
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        //let index = self.index(of: item)
        let index = items.firstIndex(matching: item)
        
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}


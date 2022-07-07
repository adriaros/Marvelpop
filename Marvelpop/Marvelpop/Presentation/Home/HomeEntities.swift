//
//  HomeEntities.swift
//  Marvelpop
//
//  Created by Adrià Ros on 6/7/22.
//

struct HomeTableViewPaginationManager {
    
    private(set) var limit = 0
    private(set) var offset = 0
    private(set) var count = 0
    private(set) var total = 0
    
    var nextOffset: Int {
        offset + count
    }
    
    var isPaginationAvailable: Bool {
        total == 0 ? true : offset + count < total
    }
    
    init(limit: Int = 100, offset: Int = 0) {
        self.limit = limit
        self.offset = offset
    }
    
    mutating func update(pagination: Pagination?) {
        offset = pagination?.offset ?? 0
        count = pagination?.count ?? 0
        total = pagination?.total ?? 0
        limit = pagination?.limit ?? 0
    }
    
    mutating func reset() {
        offset = 0
        count = 0
        total = 0
    }
}

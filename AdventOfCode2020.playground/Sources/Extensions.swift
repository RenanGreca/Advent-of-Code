import Foundation

public extension String {
    
    func index(atOffset offset:String.IndexDistance) -> String.Index {
        return index(offset >= 0 ? self.startIndex : self.endIndex, offsetBy: offset)
    }
    
    subscript(atOffset offset:String.IndexDistance) -> Character {
        return self[self.index(atOffset: offset)]
    }
    
    subscript(withinOffsets offsetRange:Range<String.IndexDistance>) -> Substring {
        return self[fromOffset: offsetRange.lowerBound, toOffset: offsetRange.upperBound]
    }
    
    subscript(fromOffset lowerOffset:String.IndexDistance, toOffset upperOffset:String.IndexDistance) -> Substring {
        let indexes = (
            lower: self.index(atOffset: lowerOffset),
            upper: self.index(atOffset: upperOffset)
        )
        return self[indexes.lower ..< indexes.upper]
    }
    
    subscript(withinOffsets offsetRange:ClosedRange<String.IndexDistance>) -> Substring {
        return self[fromOffset: offsetRange.lowerBound, throughOffset: offsetRange.upperBound]
    }
    
    subscript(fromOffset lowerOffset:String.IndexDistance, throughOffset upperOffset:String.IndexDistance) -> Substring {
        let indexes = (
            lower: self.index(atOffset: lowerOffset),
            upper: self.index(atOffset: upperOffset)
        )
        return self[indexes.lower ... indexes.upper]
    }
}

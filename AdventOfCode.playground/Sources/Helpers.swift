import Foundation

public class Helpers {
    
    public class func filePath(filename:String) -> String {
        return NSBundle.mainBundle().pathForResource(filename, ofType: "txt")!
    }

    public class func readContents(filename:String) -> String {
        let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
        
        // get the contentData
        let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
        
        // get the string
        return NSString(data: contentData!, encoding: NSUTF8StringEncoding) as! String
    }
    
}

public func readContents(filename:String) -> String {
    let filePath = NSBundle.mainBundle().pathForResource(filename, ofType: "txt")
    
    // get the contentData
    let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    
    // get the string
    return NSString(data: contentData!, encoding: NSUTF8StringEncoding) as! String
}

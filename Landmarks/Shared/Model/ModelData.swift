import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    //Get a data file
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    //Put the file into a constant value
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)" )
    }
    
    //Return the decoded data
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

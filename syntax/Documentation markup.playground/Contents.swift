/**
 Call this function to grok some globs.

 - Author: Miguel Herrero
 - Throws: LoadError.networkFailed, LoadError.writeFailed
 - Precondition: inputArray.count > 0
 - Complexity: O(1)
 - Returns: A string containing a date formatted as RFC-822
 - Parameters:
   - album: The name of a Taylor Swift album
   - track: The track number to load
   - bar: Consectetur adipisicing elit
 */
func myGreatFunction(album: String, track: Int, bar: String) {
    // do stuff
}




/// 🚲 A two-wheeled, human-powered mode of transportation.
class Bicycle {
    /**
     Frame and construction style.
     
     - Road: For streets or trails.
     - Touring: For long journeys.
     - Cruiser: For casual trips around town.
     - Hybrid: For general-purpose transportation.
     */
    enum Style {
        case Road, Touring, Cruiser, Hybrid
    }
    
    /**
     Mechanism for converting pedal power into motion.
     
     - Fixed: A single, fixed gear.
     - Freewheel: A variable-speed, disengageable gear.
     */
    enum Gearing {
        case Fixed
        case Freewheel(speeds: Int)
    }
    
    /**
     Hardware used for steering.
     
     - Riser: A casual handlebar.
     - Café: An upright handlebar.
     - Drop: A classic handlebar.
     - Bullhorn: A powerful handlebar.
     */
    enum Handlebar {
        case Riser, Café, Drop, Bullhorn
    }
    
    /// The style of the bicycle.
    let style: Style
    
    /// The gearing of the bicycle.
    let gearing: Gearing
    
    /// The handlebar of the bicycle.
    let handlebar: Handlebar
    
    /// The size of the frame, in centimeters.
    let frameSize: Int
    
    /// The number of trips travelled by the bicycle.
    private(set) var numberOfTrips: Int
    
    /// The total distance travelled by the bicycle, in meters.
    private(set) var distanceTravelled: Double
    
    /**
     Initializes a new bicycle with the provided parts and specifications.
     
     - Parameters:
       - style: The style of the bicycle
       - gearing: The gearing of the bicycle
       - handlebar: The handlebar of the bicycle
       - frameSize: The frame size of the bicycle, in centimeters
     
     - Returns: A beautiful, brand-new bicycle, custom built
     just for you.
     */
    init(style: Style, gearing: Gearing, handlebar: Handlebar, frameSize centimeters: Int) {
        self.style = style
        self.gearing = gearing
        self.handlebar = handlebar
        self.frameSize = centimeters
        
        self.numberOfTrips = 0
        self.distanceTravelled = 0
    }
    
    /**
     Take a bike out for a spin.
     
     - Parameter meters: The distance to travel in meters.
     */
    func travel(distance meters: Double) {
        if meters > 0 {
            distanceTravelled += meters
            numberOfTrips += 1
        }
    }
}
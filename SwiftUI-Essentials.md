SwiftUI Essentials

060121
Creating and Combining Views 

SwiftUI app life cycle has a structure that conforms to the App protocol
The structure's body property returns one or more scencs, which in turn provide content for display
The @main attribute identifies the app's entry point 

Body property
*only returns a single view 

View files declare two structures by default
*First structure: conforms to the View protocol and describes the view's content and layoout
*Second structure: declares a preview for that view

Customizing views
*can customize a view's display by changing code or using the inspector
*depending on the type of view you inspect it shows different attributes
*Modifiers also let you customize your view, which returns a new view

Combining views using stacks
*you can combine and embed multiple views in stacks, which group views together horizontally, verticall, or back-to-front

Spacer
*expands to make its containing view use all of the space of its parent view, instead of defining itself
*For example, a Spacer() inside HStack will affect the HStack, not the other views that the HStack contains

Image view
*clipShape(Circle): Circle type is a shape that you can use as a mask or as a view by giving the circle a stroke or fill

Views from other frameworks
*import statement required to use other frameworks

@State attribute
*allow us to modify values inside a struct, which would normally not be allowed because structs are value types
*By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface


060321
Building Lists and Navigation

Codable conformance
*makes it easier to load data into a structure from a data file

Types
*Image type: SwiftUI has to be imported
*a nested type(Coordinates) can be created as a structure 
*CLLocationCoordinate2D type: import CoreLocation is required and is useful for interacting with MapKit framework

Create an Array

ModelData
load(_: ) method 
*it is to fetch data with a given name from the app's main bundle
*relies on the return type's conformance to the Codable protocol
*(_:) is used to define that the parameter is not named

guard-let vs if-let
*guard-let requires early return and else statement
*variables in if-let exists only inside the block

060821
Customizing the Row Preview

Preview Provider Protocol
*Xcode's canvas automatically recognizes and displays any type in the current editor that conforms to the Preview Provide Protocol
*A Preview Provider protocol returns one or more views, with options to configure the size and device

Group
*is a container for grouping view content
*Xcode renders the group's child views as seperate previews in the canvas

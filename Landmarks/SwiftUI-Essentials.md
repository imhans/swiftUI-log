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
*Even though the view you are seeing doesn’t use a property with the @EnvironmentObject attribute, a child of this view, does. So without the modifier, the preview fails.

guard-let vs if-let
*guard-let requires early return and else statement
*variables in if-let exists only inside the block

Preview Provider Protocol
*Xcode's canvas automatically recognizes and displays any type in the current editor that conforms to the Preview Provide Protocol
*A Preview Provider protocol returns one or more views, with options to configure the size and device

Group
*is a container for grouping view content
*Xcode renders the group's child views as seperate previews in the canvas

Dynamic Views > List/ForEach

List initializer
*Lists work with identifiable data. You can make your data identifiable in one of two ways
*By passing along with your data a key path to a property that uniquely identifies each element

UUID - short for "universally unique identifier"
*are long hexadecimal strings such as this one: 08B15DB4-2F02-4AB8-A965-67A9C90D8A44.

Navigation View
*.navigationTitle modifier
*NavigationLink() is a view that controls a navigation presentation
*Users click or tap a navigation link to present a view inside a Navigation View

.onAppear {} Returns: A view that triggers `action` when this view appears.

<Views Structure>
ContentView
    LandmarkList : List in NavigationView
    NavigationLink : LandmarkRow, destination is LandmarkDetail
            LandmarkDetail : has NavigationTitle, ScrollView, and all the details

061721
Handling User Input

Codeable protocol 
*it lets you enable to encode and decode custom data formats, such as JSON, to native Swift objects

State 
*is a value, or a set of values, that can change over time, and that affects a view’s behavior, content, or layout. 
*You use a property with the @State attribute to add state to a view.

Toggle View
*Use $ prefix to access a binding to a state variable, or one of its properties

Observable Object for Storage
*An observable object is a custom object for your data that can be bound to a view from storage in SwiftUI’s environment. 
*SwiftUI watches for any changes to observable objects that could affect a view, and displays the correct version of the view after a change.

environmentObject ( _ : ) modifier
@EnvironmentObject 
@ObservedObject
@StateObject
@State
*Use @State for very simple data like Int, Bool, or String. Think situations like whether a toggle is on or off, or whether a dialog is open or closed.
*Use the @State property wrapper to mark a value as state, declare the property as private, and give it a default value
*Use @StateObject to create any type that is more complex than what @State can handle. Ensure that the type conforms to ObservableObject, and has @Published wrappers on the properties you would like to cause the view to re-render, or you’d like to update from a view
*Always use @StateObject when you are instantiating a model
*Use @ObservedObject to allow a parent view to pass down to a child view an already created ObservableObject (via @StateObject)
*Use @EnvironmentObject to consume an ObservableObject that has already been created in a parent view and then attached via the view’s environmentObject() view modifier
*You use @EnvironmentObject attribute in views that are lower down in the view hierarchy to receive data from views that are higher up
*You apply this modifier so that views further down in the view hierarchy can read data objects passed down through the environment

$0 is a shortcut to mean "first argument" in a closure
$0 is the first parameter passed into the closure. $1 is the second parameter, etc

Binding
*controls the storage for a value, so you can pass data around to different views that need to read or write it

Optional
e.g. ) .firstIndex(where: { $0.id == landmark.id })!
*returns the first index in which the value ( landmark.id in this case ) matches in the array

063021

static var formatter = LengthFormatter()
*A formatter that provides localized descriptions of linear distances, such as length and height measurements

070721

animation(_:) modifier
*SwiftUI animates any changes to animatable properties of the view. A view’s color, opacity, rotation, size, and other properties are all animatable
*animation type : .easeInOut, spring(), ...

AnyTransition property ( extension )
*keeps your code clean as you expand the custom transition

071221

Category View
Difference between enumeration and struct ?

Dictionary
*A dictionary is a type of hash table, providing fast access to the entries it contains
*Each entry in the table is identified using its key, which is a hashable type such as a string or number
*You use that key to retrieve the corresponding value, which can be any object
*In other languages, similar data types are known as hashes or associated arrays

CategoryHome, CategoryRow, CategoryItem

072621

.toolbar and .sheet in NavigationView {}
*toolbar() modifier lets us place bar button items anywhere in the top or bottom space, but only when our view is embedded inside a NavigationView.
*sheets are used to present new views over existing ones, while still allowing users to drag down to dismiss the new view when they are ready.

@Environment view property(\.editMode)
*SwiftUI provides storage in the environment for values you can access using the @Environment property wrapper. Access the editMode value to read or write the edit scope.

editMode
*The mode of a view indicating whether the user can edit its content.

What’s the difference between a modal and non-modal view presentation?
*The main difference lies in the way you can interact with each screen. While a Non-Modal Screen allows users to simply go back to the parent screen, the Modal Screen requires users to complete an action before returning to the main window (“save” in our example) or cancel the current action.
*You present a view modally when you want to break out of your app’s normal flow.


UIPageViewController
*A view that represents a UIKit view controller.
*requires two functions: makeUIViewController(Context) and updateUIViewController(ViewController, Context) 

Coordinator Type 
*SwiftUI manages and provides as part of the representable view’s context.
*SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
*The coordinator is a good place to store these controllers, because the system initializes them only once, and before you need them to update the view controller.


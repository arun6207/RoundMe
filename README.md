# RoundMe
RoundMe for TribalScale
## Code
- Swift 4.2
- Minimum deployment target iOS 12.1
## Build Requirements
- XCode 10.1
## Project Structure
- 📁 ViewControllers
  - 📁 Views	: All custom views 
  - 📁 Controlles	: All ViewControllers of the project
- 📁 Models : All models
- 📁 Network : All Network related files
- 📁 Utility : All Global,extension files
##### Architectural pattern
- The project is done using MVC with some exceptions where network layer calls are directly called in viewcontrollers without
  any dataHandlers
 ##### Constraints
- It's not possible to debug using devices higher than iOS 12.1 (max version Xcode 10.1 supports)

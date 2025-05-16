# Ionic Rescript Binding

Use Ionic with Rescript.

## Getting started 

1. Install
```bash
npm i rescript-ionic
```

2. Add the following your `bs-dependencies` in `rescript.json`
```json
"bs-dependencies": [
    "@rescript/core",
    "@rescript/react",
    "rescript-ionic"
]
```

3. Open IonicRescript globally.  
You can do this by adding the following `bsc-flags` to your `rescript.json`
```json
{
  "bsc-flags": [
    "-open RescriptCore",
    "-open RescriptIonic"
  ]
}
```

4. At the beggining of each file were you use Ionic open the module
```rescript
open Ionic
```

And you are all set!

## Example with blank template

First create a new project using the Ionic CLI
```bash
ionic start myApp blank --type=react
```

Follow the Getting Started section and then create the following files

`App.res`
```rescript
open Ionic

@react.component
let make = () => {
  <IonApp>
    <Home></Home>
  </IonApp>
}
```

`Home.res`
```rescript
open Ionic

@react.component
let make = () => {
  <IonPage>
    <IonHeader translucent=true>
      <IonToolbar>
        <IonTitle>{"Home"->React.string}</IonTitle>
      </IonToolbar>
    </IonHeader>
    <IonContent>
      <IonText>{"Welcome to Rescript Ionic!"->React.string}</IonText>
      <IonButton>{"Click me"->React.string}</IonButton>
    </IonContent>
  </IonPage>
}
```

`Main.res`
```rescript
switch ReactDOM.querySelector("#root") {
| Some(container) =>
  container
  ->ReactDOM.Client.createRoot
  ->ReactDOM.Client.Root.render(
    <React.StrictMode>
      <App />
    </React.StrictMode>,
  )
| None => ()
}
```

Finally update your `index.html` to include the build file from Main.res
```html
<script type="module" src="/src/Main.res.mjs"></script>
```
## Current state
Most components have bindings, enough to build and run a working app. 
  
- [X] IonApp
- [X] Label
- [X] IonContent
- [X] IonHeader
- [X] IonTitle
- [X] IonToolbar
- [X] IonPage
- [X] IonText
- [X] Action Sheet
- [X] Alert
- [X] Accordion
- [X] Badge
- [X] Button
- [X] Buttons
- [X] Card
- [X] Checkbox
- [X] Chip
- [X] Date & Time Pickers
- [X] Floating Action Button
- [X] Icons
- [X] Grid
- [ ] Infinite Scroll
- [X] Input
- [ ] Item
    - ~IonItem~
    - IonItemDivider
    - IonItemGroup
    - IonItemSliding
    - IonItemOptions
    - IonItemOption
    - IonLabel
    - IonNote
- [X] List
- [X] Menu
- [ ] Modal
- [X] Media
- [ ] Navigation
- [X] Popover
- [X] Progress Indicators
- [X] Radio
- [X] Range
- [X] Refresher
- [X] RippleEffect
- [X] Searchbar
- [X] Reorder
- [X] Routing
- [X] Segment
- [X] Select
- [X] Tabs
- [X] Toast
- [ ] Toggle
- [ ] Toolbar
- [ ] IonIcon
- [ ] Animations


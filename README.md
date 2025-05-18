# Ionic Rescript Binding

Use Ionic with Rescript.

## Getting started 

Install
```bash
npm i rescript-ionic @rescript/react
```

Add the following your `bs-dependencies` in `rescript.json`
```json
"bs-dependencies": [
    "@rescript/core",
    "@rescript/react",
    "rescript-ionic"
]
```

Open IonicRescript globally.  
You can do this by adding the following `bsc-flags` to your `rescript.json`
```json
{
  "bsc-flags": [
    "-open RescriptCore",
    "-open RescriptIonic"
  ]
}
```

Add JSX to `rescript.json`
```json
"jsx": { "version": 4 },
```

4. At the beggining of each file were you use Ionic open the module
```rescript
open Ionic
```

And you are all set! Now you can start creating Rescript files inside your Ionic project

## Example with blank template

First create a new project using the Ionic CLI
```bash
ionic start myApp blank --type=react
```

Follow the Getting Started section and then create the following files

`App.res`
```rescript
open Ionic

%%raw(`
/* Core CSS required for Ionic components to work properly */
import '@ionic/react/css/core.css';
`)
setupIonicReact();

@react.component
let make = () => {
  <IonApp>
    <Home></Home>
  </IonApp>
}

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
  
Now open two terminals, in one run `npm run res:dev` and in the other `npm run dev`


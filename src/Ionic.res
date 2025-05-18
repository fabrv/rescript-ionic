/*
Bindings written by Fabrizzio Delcompare @fabrv.
Distributed under MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

type mode = [#ios | #md]
type predefinedColors = [
  | #primary
  | #secondary
  | #tertiary
  | #success
  | #warning
  | #danger
  | #light
  | #medium
  | #dark
]
type position = [
  | #fixed
  | #stacked
  | #floating
]

type justify = [#start | #end | #"space-between"]

type spinnerTypes = [#bubbles | #circles | #circular | #crescent | #dots | #lines | #"lines-small" | #"lines-sharp" | #"lines-sharp-small"]

module OverlayEventDetail = {
  type t
  @get external data: t => Dict.t<string> = "data"
  @get external role: t => string = "role"
}

module CustomEvent = {
  type t
  @get external detail: t => OverlayEventDetail.t = "detail"
  @get external target: t => {..} = "target"
}

type routerDirection = [#forward | #back | #root]

type compareFn = (string, string) => bool
@unboxed
type compareWith = String(string) | Fn(compareFn)

module IonApp = {
  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
  ) => React.element = "IonApp"
}

module IonIcon = {
  type size = [
    | #small
    | #large
  ]

  @react.component @module("@ionic/react")
  external make: (
    ~color: predefinedColors=?,
    ~flipRtl: bool=?,
    ~icon: string=?,
    ~ios: string=?,
    ~md: string=?,
    ~mode: mode=?,
    ~name: string=?,
    ~size: size=?,
    ~src: string=?,
    ~className: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
    ~slot: string=?,
  ) => React.element = "IonIcon"
}

module IonLabel = {
  @react.component @module("@ionic/react")
  external make: (
    ~color: predefinedColors=?,
    ~mode: mode=?,
    ~position: position=?,
    ~className: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~children: React.element,
  ) => React.element = "IonLabel"
}

module IonRouterOutlet = {
  @react.component @module("@ionic/react")
  external make: (
    ~mode: mode=?,
    ~animated: bool=?,
    ~basePath: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~ionPage: bool=?,
    ~children: React.element=?,
  ) => React.element = "IonRouterOutlet"
}

module NavigationHookOptions = {
  type t = private {}
  @get
  external redirect: t => string = "redirect"
}

@unboxed
type navigationHookCallbackResult =
| Boolean(bool)
| Sync(NavigationHookOptions.t)
| Async(promise<NavigationHookOptions.t>)

type navigationHookCallback = () => navigationHookCallbackResult

module IonRoute = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~beforeEnter: navigationHookCallback=?,
    ~beforeLeave: navigationHookCallback=?,
    ~component: string,
    ~componentProps: Js.t<'a>=?,
    ~onIonRouteDataChanged: CustomEvent.t => unit=?,
    ~url: string=?,
  ) => React.element = "IonRoute"
}

module IonRouteRedirect = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~from: string,
    ~onIonRouteRedirectChanged: CustomEvent.t => unit=?,
    ~to: string=?,
  ) => React.element = "IonRouteRedirect"
}

module IonRouter = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~onIonRouteDidChange: CustomEvent.t => unit=?,
    ~onIonRouteWillChange: CustomEvent.t => unit=?,
    ~root: string=?,
    ~useHash: bool=?,
  ) => React.element = "IonRouter"
}


module IonRouterLink = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~href: string=?,
    ~rel: string=?,
    ~routerDirection: routerDirection=?,
    ~target: string=?,
  ) => React.element = "IonRouterLink"
}

module IonTabBar = {
  type slot = [#bottom | #top]
  type customEvent = {tab: string}

  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~mode: mode=?,
    ~color: predefinedColors=?,
    ~selectedTab: string=?,
    ~translucent: bool=?,
    ~slot: slot=?,
    ~onIonTabsDidChange: customEvent => unit=?,
    ~onIonTabsWillChange: customEvent => unit=?,
    ~key: string=?,
  ) => React.element = "IonTabBar"
}

module IonTabs = {
  type customEvent = {tab: string}

  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~className: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~onIonTabsDidChange: customEvent => unit=?,
    ~onIonTabsWillChange: customEvent => unit=?,
  ) => React.element = "IonTabs"
}

module IonTabButton = {
  @react.component @module("@ionic/react")
  external make: (
    ~tab: string,
    ~href: string=?,
    ~children: React.element,
    ~className: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~mode: mode=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
    ~disabled: bool=?,
    ~selected: bool=?,
    ~onTouchEnd: ReactEvent.Touch.t => unit=?,
    ~onTouchMove: ReactEvent.Touch.t => unit=?,
    ~onPointerDown: ReactEvent.Pointer.t => unit=?,
  ) => React.element = "IonTabButton"
}

module IonReactRouter = {
  @react.component @module("@ionic/react-router")
  external make: (
    ~children: React.element,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~history: 'a=?,
    ~basename: string=?,
    ~forceRefresh: bool=?,
    ~getUserConfirmation: (string, bool => unit) => unit=?,
    ~keyLength: int=?,
  ) => React.element = "IonReactRouter"
}

module IonContent = {
  type slot = [
    | #after
    | #before
  ]

  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~fixedSlotPlacement: slot=?,
    ~forcedOverscroll: bool=?,
    ~fullscreen: bool=?,
    ~onIonScroll: 'a => unit=?,
    ~onIonScrollEnd: 'a => unit=?,
    ~onIonScrollStart: 'a => unit=?,
    ~scrollEvents: bool=?,
    ~scrollX: bool=?,
    ~scrollY: bool=?,
  ) => React.element = "IonContent"
}

module IonHeader = {
  type collapse = [
    | #condense
    | #fade
  ]

  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~collapse: collapse=?,
    ~mode: mode=?,
    ~translucent: bool=?,
  ) => React.element = "IonHeader"
}

module IonTitle = {
  type size = [
    | #large
    | #small
  ]

  @react.component @module("@ionic/react")
  external make: (
    ~children: React.element,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~color: predefinedColors=?,
    ~size: size=?,
  ) => React.element = "IonTitle"
}

module IonToolbar = {
  @react.component @module("@ionic/react")
  external make: (
    ~className: string=?,
    ~children: React.element,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
  ) => React.element = "IonToolbar"
}

module IonPage = {
  @react.component @module("@ionic/react")
  external make: (~children: React.element, ~ref: ReactDOM.domRef=?) => React.element = "IonPage"
}

type labelPlacement = [
  | #start
  | #end
  | #floating
  | #stacked
  | #fixed
]

module IonInput = {
  @react.component @module("@ionic/react")
  external make: (
    ~autocapitalize: string=?,
    ~autocomplete: string=?,
    ~autocorrect: [#on | #off]=?,
    ~autofocus: bool=?,
    ~clearInput: bool=?,
    ~clearInputIcon: string=?,
    ~clearOnEdit: bool=?,
    ~color: predefinedColors=?,
    ~counter: bool=?,
    ~counterFormatter: (int, int) => string=?,
    ~debounce: int=?,
    ~disabled: bool=?,
    ~enterkeyhint: [
      | #enter
      | #done
      | #go
      | #next
      | #previous
      | #search
      | #send
    ]=?,
    ~errorText: string=?,
    ~fill: [#outline | #solid]=?,
    ~helperText: string=?,
    ~inputmode: [
      | #none
      | #text
      | #tel
      | #url
      | #email
      | #numeric
      | #decimal
      | #search
    ]=?,
    ~label: string=?,
    ~labelPlacement: labelPlacement=?,
    ~max: string=?,
    ~maxlength: int=?,
    ~min: string=?,
    ~minlength: int=?,
    ~mode: [#ios | #md]=?,
    ~multiple: bool=?,
    ~name: string=?,
    ~onIonBlur: ReactEvent.Focus.t => unit=?,
    ~onIonChange: ReactEvent.Synthetic.t => unit=?,
    ~onIonFocus: ReactEvent.Focus.t => unit=?,
    ~onIonInput: ReactEvent.Synthetic.t => unit=?,
    ~pattern: string=?,
    ~placeholder: string=?,
    ~readonly: bool=?,
    ~required: bool=?,
    ~shape: [#round]=?,
    ~spellcheck: bool=?,
    ~step: string=?,
    @as("type") ~type_: string=?,
    ~value: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
  ) => React.element = "IonInput"
}

module IonButton = {
  type fill = [
    | #clear
    | #outline
    | #solid
    | #default
  ]

  type size = [
    | #small
    | #default
    | #large
  ]

  type type_ = [
    | #submit
    | #reset
    | #button
  ]

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~id: string=?,
    ~className: string=?,
    ~buttonType: string=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~download: string=?,
    ~expand: [#full | #block]=?,
    ~full: fill=?,
    ~fill: fill=?,
    ~form: string=?,
    ~href: string=?,
    ~mode: mode=?,
    ~rel: string=?,
    ~shape: [#round]=?,
    ~size: size=?,
    ~strong: bool=?,
    ~target: string=?,
    ~children: React.element=?,
    ~onClick: ReactEvent.Mouse.t => unit=?,
    @as("type") ~type_: type_=?,
  ) => React.element = "IonButton"
}

module IonText = {
  @react.component @module("@ionic/react")
  external make: (
    ~color: predefinedColors=?,
    ~mode: mode=?,
    ~children: React.element,
  ) => React.element = "IonText"
}

module IonSpinner = {
  @react.component @module("@ionic/react")
  external make: (
    ~color: predefinedColors=?,
    ~duration: int=?,
    ~name: spinnerTypes=?,
    ~paused: bool=?,
  ) => React.element = "IonSpinner"
}

module IonSearchbar = {
  type enterkeyhint = [#done | #enter | #go | #next | #previous | #search | #send]
  @react.component @module("@ionic/react")
  external make: (
    ~animated: bool=?,
    ~autocapitalize: bool=?,
    ~autocomplete: string=?,
    ~autocorrect: [#off | #on]=?,
    ~cancelButton: string=?,
    ~cancelButtonText: string=?,
    ~clearIcon: string=?,
    ~color: predefinedColors=?,
    ~debounce: int=?,
    ~disabled: bool=?,
    ~enterkeyhint: enterkeyhint=?,
    ~inputmode: [
      | #none
      | #text
      | #tel
      | #url
      | #email
      | #numeric
      | #decimal
      | #search
    ]=?,
    ~max: string=?,
    ~maxlength: int=?,
    ~min: string=?,
    ~minlength: int=?,
    ~mode: [#ios | #md]=?,
    ~multiple: bool=?,
    ~name: string=?,
    ~shapeIcon: string=?,
    ~showCancelButton: bool=?,
    ~showClearButton: bool=?,
    ~onIonBlur: ReactEvent.Focus.t => unit=?,
    ~onIonChange: ReactEvent.Synthetic.t => unit=?,
    ~onIonFocus: ReactEvent.Focus.t => unit=?,
    ~onIonInput: ReactEvent.Synthetic.t => unit=?,
    ~onIonCancel: ReactEvent.Synthetic.t => unit=?,
    ~onIonClear: ReactEvent.Synthetic.t => unit=?,
    ~pattern: string=?,
    ~placeholder: string=?,
    ~readonly: bool=?,
    ~required: bool=?,
    ~shape: [#round]=?,
    ~spellcheck: bool=?,
    ~step: string=?,
    @as("type") ~type_: string=?,
    ~value: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
  ) => React.element = "IonSearchbar"
}

module IonButtons = {
  @react.component @module("@ionic/react")
  external make: (
    ~slot: [#start | #end]=?,
    ~collapse: bool=?,
    ~children: React.element=?,
  ) => React.element = "IonButtons"
}

module IonBadge = {
  @react.component @module("@ionic/react")
  external make: (
    ~mode: mode=?,
    ~color: predefinedColors=?,
    ~slot: string=?,
    ~children: React.element=?,
  ) => React.element = "IonBadge"
}

module IonAccordion = {
  @react.component @module("@ionic/react")
  external make: (
    ~value: string=?,
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~readonly: bool=?,
    ~toggleIcon: bool=?,
    ~toggleIconSlot: [#end | #start]=?,
  ) => React.element = "IonAccordion"
}

module IonItem = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~button: bool=?,
    ~color: predefinedColors=?,
    ~detail: bool=?,
    ~detailIcon: string=?,
    ~disabled: bool=?,
    ~download: string=?,
    ~href: string=?,
    ~lines: [#full | #inset | #none]=?,
    ~mode: mode=?,
    ~rel: string=?,
    ~target: string=?,
    @as("type") ~type_: [#button | #reset | #submit]=?,
    ~slot: string=?,
  ) => React.element = "IonItem"
}

module IonAccordionGroup = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~value: string=?,
    ~readonly: bool=?,
    ~multiple: bool=?,
    ~mode: mode=?,
    ~expand: [#compact | #inset]=?,
    ~disabled: bool=?,
    ~animated: bool=?,
  ) => React.element = "IonItem"
}

module IonCard = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~button: bool=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~download: string=?,
    ~href: string=?,
    ~mode: mode=?,
    ~rel: string=?,
    ~target: string=?,
    @as("type") ~type_: [#submit | #reset | #button]=?,
  ) => React.element = "IonCard"
}

module IonCardHeader = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
    ~translucent: bool=?,
  ) => React.element = "IonCardHeader"
}

module IonCardTitle = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
  ) => React.element = "IonCardTitle"
}

module IonCardSubtitle = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
  ) => React.element = "IonCardSubtitle"
}

module IonCardContent = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~mode: mode=?,
  ) => React.element = "IonCardContent"
}

module IonRippleEffect = {
  @react.component @module("@ionic/react")
  external make: (@as("type") ~type_: [#bounded | #unbounded]=?) => React.element =
    "IonRippleEffect"
}

@unboxed
type actionSheetButtonHandlerResponse =
| Boolean(bool)
| Unit
| Promise(promise<bool>)

type actionSheetButton = {
  text?: string,
  role?: [#cancel | #destructive | #selected],
  icon?: string,
  cssClass?: array<string>,
  id?: string,
  htmlAttributes?: Dict.t<string>,
  handler?: () => actionSheetButtonHandlerResponse,
  data?: Dict.t<string>,
  disabled?: bool
}

module IonActionSheet = {
  @module("@ionic/react") @react.component
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~animated: bool=?,
    ~backdropDismiss: bool=?,
    ~buttons: array<actionSheetButton>=?,
    ~cssClass: array<string>=?,
    ~header: string=?,
    ~htmlAttributes: Dict.t<string>=?,
    ~isOpen: bool=?,
    ~keyboardClose: bool=?,
    ~mode: mode=?,
    ~onDidDismiss: CustomEvent.t => unit=?,
    ~onDidPresent: CustomEvent.t => unit=?,
    ~onIonActionSheetDidDismiss: CustomEvent.t => unit=?,
    ~onIonActionSheetWillDismiss: CustomEvent.t => unit=?,
    ~onIonActionSheetWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~subHeader: string=?,
    ~translucent: bool=?,
    ~trigger: string=?
  ) => React.element = "IonActionSheet"
}

@unboxed
type alertButtonHandler =
| Boolean(bool)
| Unit
| Dict(Dict.t<string>)
| Promise(promise<bool>)

type alertButon = {
  text: string,
  role?: [#cancel | #destructive],
  cssClass?: array<string>,
  id?: string,
  htmlAttributes?: Dict.t<string>,
  handler?: string => alertButtonHandler 
}

type textFieldTypes = [
| #date
| #email
| #number
| #password
| #search
| #tel
| #text
| #url
| #time
| #week
| #month
| #"datetime-local"
| #checkbox
| #radio
| #textarea
]

@unboxed
type minMax = Int(int) | String(string)

type rec alertInput = {
  @as("type") _type?: textFieldTypes,
  name?: string,
  placeholder?: string,
  value?: string,
  label?: string,
  checked?: bool,
  disabled?: bool,
  id?: string,
  handler?: alertInput => unit,
  min?: minMax,
  max?: minMax,
  cssClass?: array<string>,
  attributes?: Dict.t<string>,
  tabindex?: int
}

module IonAlert = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~animated: bool=?,
    ~backdropDismiss: bool=?,
    ~buttons: array<alertButon>=?,
    ~cssClass: array<string>=?,
    ~header: string=?,
    ~htmlAttributes: Dict.t<string>=?,
    ~inputs: array<alertInput>=?,
    ~isOpen: bool=?,
    ~keyboardClose: bool=?,
    ~message: string=?,
    ~mode: [#ios | #md]=?,
    ~onDidDismiss: CustomEvent.t => unit =?,
    ~onDidPresent: CustomEvent.t => unit =?,
    ~onIonAlertDidDismiss: CustomEvent.t => unit=?,
    ~onIonAlertDidPresent: CustomEvent.t => unit=?,
    ~onIonAlertWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~subHeader: string=?,
    ~translucent: bool=?,
    ~trigger: string=?
  ) => React.element = "IonAlert"
}

module IonCheckbox = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~alignment: [#start | #center]=?,
    ~checked: bool=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~errorText: string=?,
    ~helperText: string=?,
    ~indeterminate: bool=?,
    ~justify: justify=?,
    ~labelPlacement: labelPlacement=?,
    ~mode: mode=?,
    ~name: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~required: bool=?,
    ~value: string=?,
    ~children: React.element=?
  ) => React.element = "IonCheckbox"
}

module IonChip = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~outline: bool=?
  ) => React.element = "IonChip"
}

module IonDatetime = {
  type datetimeHourCycle = [#h11 | #h12 | #h23 | #h24]

  @unboxed
  type dayValues = Number(int) | Array(array<int>) | String(string)

  type formatOptions = {
    date: Intl.DateTimeFormat.t,
    time: Intl.DateTimeFormat.t
  }

  type datetimeHighlight = {
    date: string,
    textColor?: string,
    backgroundColor?: string,
  }

  type datetimeHighlightStyle = {
    textColor?: string,
    backgroundColor?: string,
  }

  @unboxed
  type highlightedDates =
  | Array(array<datetimeHighlight>)
  | Callback(string => datetimeHighlightStyle) 

  type datetimePresentation =  [
  | #"date-time"
  | #"time-date"
  | #"date"
  | #"time"
  | #"month"
  | #"year"
  | #"month-year"]

  @react.component @module("@ionic/react")
  external make:  (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~cancelText: string=?,
    ~clearText: string=?,
    ~color: predefinedColors=?,
    ~dayValues: dayValues=?,
    ~disabled: bool=?,
    ~doneText: string=?,
    ~firstDayOfWeek: int=?,
    ~formatOptions: formatOptions=?,
    ~highlightedDates: highlightedDates=?,
    ~hourCycle: datetimeHourCycle=?,
    ~isDateEnabled: string => bool=?,
    ~locale: string=?,
    ~max: string=?,
    ~min: string=?,
    ~minuteValues: array<int>=?,
    ~mode: mode=?,
    ~monthValues: array<int>=?,
    ~multiple: bool=?,
    ~name: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonCancel: CustomEvent.t => unit=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~preferWheel: bool=?,
    ~presentation: datetimePresentation=?,
    ~readonly: string=?,
    ~showClearButton: bool=?,
    ~showDefaultButtons: bool=?,
    ~showDefaultTimeLabel: bool=?,
    ~showDefaultTitle: bool=?,
    ~size: [#cover | #fixed]=?,
    ~titleSelectedDatesFormatter: array<string> => string=?,
    ~value: array<string>=?,
    ~yearValues: array<int>=?,
  ) => React.element = "IonDatetime"
}

module IonDateTimeButton = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~datetime: string=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~children: React.element=?,
  ) => React.element = "IonDateTimeButton"
}

module IonPicker = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~mode: mode=?,
    ~children: React.element=?,
  ) => React.element = "IonPicker"
}

module IonPickerColumn = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~value: string=?,
    ~children: React.element
  ) => React.element = "IonPickerColumn"
}

module IonPickerColumnOption = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~value: string=?,
    ~children: React.element
  ) => React.element = "IonPickerColumnOption"
}

module IonFab = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~slot: string=?,
    ~activated: bool=?,
    ~edge: bool=?,
    ~horizontal: [#start | #end | #center]=?,
    ~vertical: [#top | #bottom | #center]=?,
    ~children: React.element,
  ) => React.element = "IonFab"
}

module IonFabButton = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~activated: bool=?,
    ~closeIcon: string=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~download: string=?,
    ~href: string=?,
    ~mode: mode=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~rel: string=?,
    ~routerDirection: routerDirection=?,
    ~show: bool=?,
    ~size: [#small]=?,
    ~target: string=?,
    ~translucent: bool=?,
    @as("type") ~type_: [#submit | #reset | #button]=?,
    ~children: React.element=?,
  ) => React.element = "IonFabButton"
}

module IonFabList = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~activated: bool=?,
    ~side: [#start | #end | #top | #bottom]=?,
    ~children: React.element
  ) => React.element = "IonFabList"
}

module IonGrid = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~fixed: bool=?,
    ~children: React.element,
  ) => React.element = "IonGrid"
}

module IonRow = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "IonRow"
}

module IonCol = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?, 
    ~children: React.element,
    ~offset: string=?,
    ~offsetLg: string=?,
    ~offsetMd: string=?,
    ~offsetSm: string=?,
    ~offsetXl: string=?,
    ~offsetXs: string=?,
    ~pull: string=?,
    ~pullLg: string=?,
    ~pullMd: string=?,
    ~pullSm: string=?,
    ~pullXl: string=?,
    ~pullXs: string=?,
    ~push: string=?,
    ~pushLg: string=?,
    ~pushMd: string=?,
    ~pushSm: string=?,
    ~pushXl: string=?,
    ~pushXs: string=?,
    ~size: string=?,
    ~sizeLg: string=?,
    ~sizeMd: string=?,
    ~sizeSm: string=?,
    ~sizeXl: string=?,
    ~sizeXs: string=?
  ) => React.element = "IonCol"
}

module IonList = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~inset: bool=?,
    ~lines: [#full | #inset | #none]=?,
    ~mode: mode=?,
    ~children: React.element=?,
  ) => React.element = "IonList"
}

module IonListHeader = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~lines: [#full | #inset | #none]=?,
    ~children: React.element
  ) => React.element = "IonListHeader"
}

module IonAvatar = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "IonAvatar"
}

module IonImg = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~alt: string=?,
    ~onIonError: CustomEvent.t => unit=?,
    ~onIonImgDidLoad: CustomEvent.t => unit=?,
    ~onIonImgWillLoad: CustomEvent.t => unit=?,
    ~src: string=?
  ) => React.element = "IonImg"
}

module IonThumbnail = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element,
    ~slot: string=?,
  ) => React.element = "IonThumbnail"
}

module IonMenu = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~contentId: string=?,
    ~disabled: bool=?,
    ~maxEdgeStart: int=?,
    ~menuId: string=?,
    ~onIonDidClose: CustomEvent.t => unit=?,
    ~onIonDidOpen: CustomEvent.t => unit=?,
    ~onIonWillClose: CustomEvent.t => unit=?,
    ~onIonWillOpen: CustomEvent.t => unit=?,
    ~side: [#start | #end]=?,
    ~swipeGesture: bool=?,
    ~menuType: [#overlay | #reveal | #push]
  ) => React.element = "IonMenu"
}

module IonMenuButton = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~autoHide: bool=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~menu: string=?,
    ~mode: mode=?,
    @as("type") ~type_: [#submit | #reset | #button]=?,
  ) => React.element = "IonMenuButton"
}

module IonMenuToggle = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~autoHide: bool=?,
    ~menu: string=?,
  ) => React.element = "IonMenuToggle"
}

module IonSplitPane = {
  @unboxed
  type when_ = String(string) | Bool(bool)

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~contentId: string=?,
    ~disabled: bool,
    ~isVisible: unit => promise<bool>,
    @as("when") ~when_: when_
  ) => React.element = "IonSplitPane"
}

module IonPopover = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~alignment: [#start | #center | #end]=?,
    ~animated: bool=?,
    ~arrow: bool=?,
    ~backdropDismiss: bool=?,
    ~dismissOnSelect: bool=?,
    ~focusTrap: bool=?,
    ~htmlAttributes: Dict.t<string>=?,
    ~isOpen: bool=?,
    ~keepContentsMounted: bool=?,
    ~keyboardClose: bool=?,
    ~mode: mode=?,
    ~onDidDismiss: CustomEvent.t => unit=?,
    ~onDidPresent: CustomEvent.t => unit=?,
    ~onIonPopoverDidDismiss: CustomEvent.t => unit=?,
    ~onIonPopoverDidPresent: CustomEvent.t => unit=?,
    ~onIonPopoverWillDismiss: CustomEvent.t => unit=?,
    ~onIonPopoverWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~reference: [#trigger | #event]=?,
    ~showBackdrop: bool=?,
    ~side: [#start | #end | #top | #right | #bottom | #left]=?,
    ~size: [#cover | #auto]=?,
    ~translucent: bool=?,
    ~trigger: string=?,
    ~triggerAction: [#click | #hover | #"context-menu"]=?,
  ) => React.element = "IonPopover"
}

module IonRadio = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~alignment: [#start | #center]=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~justify: justify=?,
    ~labelPlacement: labelPlacement=?,
    ~mode: mode=?,
    ~name: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~value: string=?,
  ) => React.element = "IonRadio"
}

module IonRadioGroup = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~allowEmptySelection: bool=?,
    ~compareWith: compareWith=?,
    ~errorText: string=?,
    ~helperText: string=?,
    ~name: string=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~value: string=?,
  ) => React.element = "IonRadioGroup"
}

module IonRange = {
  type rangeValue = {
    lower: int,
    upper: int
  }

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~activeBarStart: float=?,
    ~color: predefinedColors=?,
    ~debounce: float=?,
    ~disabled: bool=?,
    ~dualKnobs: bool=?,
    ~label: string=?,
    ~labelPlacement: labelPlacement=?,
    ~max: float=?,
    ~min: float=?,
    ~mode: mode=?,
    ~name: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~onIonInput: CustomEvent.t => unit=?,
    ~onIonKnobMoveEnd: CustomEvent.t => unit=?,
    ~onIonKnobMoveStart: CustomEvent.t => unit=?,
    ~pin: bool=?,
    ~pinFormatter: int => int=?,
    ~snaps: bool=?,
    ~step: float=?,
    ~ticks: bool=?,
    ~value: rangeValue=?,
  ) => React.element = "IonRange"
}

module IonRefresher = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~slot: string,
    ~closeDuration: string=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~onIonPull: CustomEvent.t => unit=?,
    ~onIonRefresh: CustomEvent.t => unit=?,
    ~onIonStart: CustomEvent.t => unit=?,
    ~pullFactor: float=?,
    ~pullMax: float=?,
    ~pullMin: float=?,
    ~snapbackDuration: string=?,
  ) => React.element = "IonRefresher"
}

module IonRefresherContent = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~pullingIcon: spinnerTypes, 
    ~pullingText: string=?,
    ~refreshingSpinner: spinnerTypes=?,
    ~refreshingText: string=?,
  ) => React.element = "IonRefresherContent"
}

module IonReorder = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element,
  ) => React.element = "IonReorder"
}

module IonReorderGroup = {
  @react.component @module("@ionic/react")
  external make: ( 
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element,
    ~disabled: bool=?,
    ~onIonItemReorder: CustomEvent.t => unit
  ) => React.element = "IonReorderGroup"
}

module IonSegment = {
  @unboxed
  type segmentValue = String(string) | Number(int)

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~disabled: bool=?,
    ~mode: mode=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~scrollable: bool=?,
    ~selectOnFocus: bool=?,
    ~swipeGesture: bool=?,
    ~value: segmentValue=?,
  ) => React.element = "IonSegment"
}

module IonSegmentButton = {
  type segmentButtonLayout = [
  | #"icon-top"
  | #"icon-start"
  | #"icon-end"
  | #"icon-bottom"
  | #"icon-hide"
  | #"label-hide"
  ]

  @unboxed
  type segmentValue =
  | Number(int)
  | String(string)

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~contentId: string=?,
    ~disabled: bool=?,
    ~layout: segmentButtonLayout=?,
    ~mode: mode=?,
    @as("type") ~type_: [#submit | #reset | #button]=?,
    ~value: segmentValue=?,
  ) => React.element = "IonSegmentButton"
}

module IonSegmentContent = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
  ) => React.element = "IonSegmentContent"
}

module IonSegmentView = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~disabled: bool=?,
    ~onIonSegmentViewScroll: CustomEvent.t => unit=?,
  ) => React.element = "IonSegmentView"
}

module IonSelect = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~cancelText: string=?,
    ~color: predefinedColors=?,
    ~compareWith: compareWith=?,
    ~disabled: bool=?,
    ~errorText: string=?,
    ~expandedIcon: string=?,
    ~fill: [#outline | #solid]=?,
    ~helperText: string=?,
    ~interface: [
    #"action-sheet"
    | #popover 
    | #alert 
    | #modal
    ]=?,
    ~interfaceOptions: JSON.t=?,
    ~justify: justify=?,
    ~label: string=?,
    ~labelPlacement: labelPlacement=?,
    ~mode: mode=?,
    ~multiple: bool=?,
    ~name: string=?,
    ~okText: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonCancel: CustomEvent.t => unit=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~onIonDismiss: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
    ~placeholder: string=?,
    ~required: bool=?,
    ~selectedText: string=?,
    ~shape: [#round]=?,
    ~toggleIcon: string=?,
    ~value: string=?,
  ) => React.element = "IonSelect"
}

@unboxed
type selectModalHandlerResponse<'a> = 
| Boolean(bool)
| Unit
| Dict(Dict.t<'a>)

type selectModalOption<'a> = {
  text: string,
  value: string,
  disabled: string,
  checked: bool,
  cssClass: bool,
  handler: Dict.t<'a>,
}

module IonSelectModal = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~header: string=?,
    ~multiple: bool=?,
    ~options: array<selectModalOption<'a>>=?,
  ) => React.element = "IonSelectModal"
}

module IonSelectOption = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~disabled: bool=?,
    ~value: string=?,
  ) => React.element = "IonSelectOption"
}

module IonSkeletonText = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~animated: bool=?,
  ) => React.element = "IonSkeletonText"
}

module IonProgressBar = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~buffer: float=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
    ~reversed: bool=?,
    @as("type") ~type_: [#determinate | #indeterminate]=?,
    ~value: float=?,
  ) => React.element = "IonProgressBar"
}

module IonLoading = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~animated: bool=?,
    ~backdropDismiss: bool=?,
    ~cssClass: array<string>=?,
    ~duration: float=?,
    ~htmlAttributes: Dict.t<string>=?,
    ~isOpen: bool=?,
    ~keyboardClose: bool=?,
    ~message: string=?,
    ~mode: mode=?,
    ~onDidDismiss: CustomEvent.t => unit=?,
    ~onDidPresent: CustomEvent.t => unit=?,
    ~onIonLoadingDidDismiss: CustomEvent.t => unit=?,
    ~onIonLoadingDidPresent: CustomEvent.t => unit=?,
    ~onIonLoadingWillDismiss: CustomEvent.t => unit=?,
    ~onIonLoadingWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~showBackdrop: bool=?,
    ~spinner: spinnerTypes=?,
    ~translucent: bool=?,
    ~trigger: string=?,
  ) => React.element = "IonLoading"
}

@unboxed
type toastButtonHandlerResponse =
| Boolean(bool)
| Unit
| Promise(promise<bool>)

type toastButton = {
  text?: string,
  icon?: string,
  side?: [#start | #end],
  role?: [#cancel],
  htmlAttributes: Dict.t<string>,
  handler: unit => toastButtonHandlerResponse 
}

module IonToast = {
  type toastLayout = [#baseline | #stacked]
  type toastPosition = [#top | #bottom | #middle]

  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~animated: bool=?,
    ~buttons: array<toastButton>=?,
    ~color: predefinedColors=?,
    ~cssClass: string=?,
    ~duration: float=?,
    ~header: string=?,
    ~htmlAttributes: Dict.t<string>=?,
    ~icon: string=?,
    ~isOpen: bool=?,
    ~keyboardClose: bool=?,
    ~layout: toastLayout=?,
    ~message: string=?,
    ~mode: mode=?,
    ~onDidDismiss: CustomEvent.t => unit=?,
    ~onDidPresent: CustomEvent.t => unit=?,
    ~onIonToastDidDismiss: CustomEvent.t => unit=?,
    ~onIonToastDidPresent: CustomEvent.t => unit=?,
    ~onIonToastWillDismiss: CustomEvent.t => unit=?,
    ~onIonToastWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~position: toastPosition=?,
    ~positionAnchor: string=?,
    ~swipeGesture: [#vertical]=?,
    ~translucent: bool=?,
    ~trigger: string=?,
  ) => React.element = "IonToast"
}

module IonToggle = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~alignment: [#start | #center]=?,
    ~checked: bool,
    ~color: predefinedColors=?,
    ~disabled: bool,
    ~enableOnOffLabels: bool=?,
    ~errorText: string=?,
    ~helperText: string=?,
    ~justify: justify=?,
    ~labelPlacement: labelPlacement,
    ~mode: mode=?,
    ~name: string,
    ~required: bool=?,
    ~value: string=?,
    ~onIonBlur: CustomEvent.t => unit=?,
    ~onIonChange: CustomEvent.t => unit=?,
    ~onIonFocus: CustomEvent.t => unit=?,
  ) => React.element = "IonToggle"
}


module IonFooter = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~collapse: [#fade]=?,
    ~mode: mode=?,
    ~translucent: bool=?,
  ) => React.element = "IonFooter"
}

module IonBackButton = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: predefinedColors=?,
    ~defaultHref: string=?,
    ~disabled: bool=?,
    ~icon: string=?,
    ~mode: mode=?,
    ~text: string=?,
    @as("type") ~type_: [#submit | #reset | #button]=?,
  ) => React.element = "IonBackButton"
}


module IonModal = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~animated: bool=?,
    ~backdropBreakpoint: float=?,
    ~backdropDismiss: bool=?,
    ~breakpoints: array<float>=?,
    ~canDismiss: bool=?,
    ~expandToScroll: bool=?,
    ~focusTrap: bool=?,
    ~handle: bool=?,
    ~handleBehavior: [#none | #cycle]=?,
    ~htmlAttributes: Js.Dict.t<Js.Json.t>=?,
    ~initialBreakpoint: float=?,
    ~isOpen: bool=?,
    ~keepContentsMounted: bool=?,
    ~keyboardClose: bool=?,
    ~mode: mode=?,
    ~onDidDismiss: CustomEvent.t => unit=?,
    ~onDidPresent: CustomEvent.t => unit=?,
    ~onIonBreakpointDidChange: CustomEvent.t => unit=?,
    ~onIonModalDidDismiss: CustomEvent.t => unit=?,
    ~onIonModalDidPresent: CustomEvent.t => unit=?,
    ~onIonModalWillDismiss: CustomEvent.t => unit=?,
    ~onIonModalWillPresent: CustomEvent.t => unit=?,
    ~onWillDismiss: CustomEvent.t => unit=?,
    ~onWillPresent: CustomEvent.t => unit=?,
    ~presentingElement: Dom.htmlElement=?,
    ~showBackdrop: bool=?,
    ~trigger: string=?,
  ) => React.element = "IonModal"
}

module IonBackdrop = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~onIonBackdropTap: CustomEvent.t => unit=?,
    ~stopPropagation: bool=?,
    ~tappable: bool=?,
    ~visible: bool=?,
  ) => React.element = "IonBackdrop"
}

module IonItemDivider = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~mode: mode=?,
    ~sticky: bool,
  ) => React.element = "IonItemDivider"
}

module IonItemGroup = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
  ) => React.element = "IonItemGroup"
}


module IonItemOption = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~color: predefinedColors=?,
    ~disabled: bool,
    ~download: string=?,
    ~expandable: bool,
    ~href: string=?,
    ~mode: [#ios | #md]=?,
    ~rel: string=?,
    ~target: string=?,
    @as("type") ~type_: [#submit | #reset | #button],
  ) => React.element = "IonItemOption"
}

module IonItemOptions = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~side: [#start | #end],
    ~onIonSwipe: CustomEvent.t => unit,
  ) => React.element = "IonItemOptions"
}

module IonItemSliding = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~disabled: bool=?,
    ~onIonDrag: CustomEvent.t => unit=?,
    ~children: React.element=?,
  ) => React.element = "IonItemSliding"
}

module IonNote = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~color: string=?,
    ~mode: mode=?,
    ~children: React.element=?,
  ) => React.element = "IonNote"
}


module IonInfiniteScroll = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~disabled: bool=?,
    ~onIonInfinite: CustomEvent.t => unit=?,
    ~position: [#top | #bottom]=?,
    ~threshold: string=?,
    ~children: React.element=?,
  ) => React.element = "IonInfiniteScroll"
}

module IonInfiniteScrollContent = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~loadingSpinner: spinnerTypes=?,
    ~loadingText: string=?,
    ~children: React.element=?,
  ) => React.element = "IonInfiniteScrollContent"
}

module IonNav = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~animated: bool=?,
    ~onIonNavDidChange: CustomEvent.t => unit=?,
    ~onIonNavWillChange: CustomEvent.t=> unit=?,
    ~root: Dom.htmlElement=?,
    ~rootParams: Js.t<'a>=?,
    ~swipeGesture: bool=?,
  ) => React.element = "IonNav"
}

module IonNavLink = {
  @react.component @module("@ionic/react")
  external make: (
    ~ref: ReactDOM.domRef=?,
    ~key: string=?,
    ~className: string=?,
    ~children: React.element=?,
    ~component: Dom.htmlElement=?,
    ~componentProps: Js.t<'a>=?,
    ~routerDirection: [#forward | #back | #root],
  ) => React.element = "IonNavLink"
}

module IonicOverrides = {
  module Elements = {
    // Extend the available lowercase JSX props here.
    type props = {
      ...JsxDOM.domProps,
      slot: string,
    }

    @module("react/jsx-runtime")
    external jsx: (string, props) => Jsx.element = "jsx"
  }
}

@@jsxConfig({module_: "IonicOverrides"})

module Div = {
  let make = props => <div {...props} />
}

@module("@ionic/react")
external setupIonicReact: unit => unit = "setupIonicReact"

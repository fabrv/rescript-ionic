module Redirect = {
  @react.component @module("react-router-dom")
  external make: (
    ~to: string,
    ~push: bool=?,
    ~from: string=?,
    ~path: string=?,
    ~exact: string=?,
    ~strict: string=?,
    ~children: React.element=?,
  ) => React.element = "Redirect"
}

module Route = {
  type location<'a> = {
    pathname: string,
    search: string,
    state: 'a,
    hash: string,
    key: option<string>,
  }

  @react.component @module("react-router-dom")
  external make: (
    ~location: location<'a>=?,
    ~component: React.element=?,
    ~render: React.element=?,
    ~children: React.element=?,
    ~path: string,
    ~exact: bool=?,
    ~sensitive: bool=?,
    ~strict: bool=?,
  ) => React.element = "Route"
}

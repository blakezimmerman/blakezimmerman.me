module Details exposing (..)

type DetailCard
  = JetCard
  | BaeCard
  | StevensCard

type alias ExpItemDetails =
  { card : DetailCard
  , color : String
  , logo : String
  , position : String
  , timePeriod : String
  , details : List String
  }

jetDetails : ExpItemDetails
jetDetails =
  { card = JetCard
  , color = "rgb(130, 0, 255)"
  , logo = "/assets/jetlogo.jpg"
  , position = "Software Engineering Intern"
  , timePeriod = "January 2017 - Present"
  , details =
      [ "Developed an Angular 4 frontend from the ground up for a new internal tool that shows divergence between Event Store clusters"
      , "Implemented real-time notifications in the SKU management web application using SignalR and RxJS Observables"
      , "Rewrote the authentication system for the SKU management web application using Node and PassportJS"
      , "Built micro-scale version of the Jet website to demonstrate system architecture for new hires (frontend in Angular 2, backend in Web API 2.2 using F#)"
      , "Developed and deployed production level features to customer service and order management web applications"
      ]
  }

baeDetails : ExpItemDetails
baeDetails =
  { card = BaeCard
  , color = "rgb(237, 28, 59)"
  , logo = "/assets/baelogo.jpg"
  , position = "Technical Intern II"
  , timePeriod = "January 2016 - August 2016"
  , details =
      [ "Developed a web-based interface for a codebase health and metrics tool"
      , "Implemented and tested embedded software for Software Defined Radios"
      , "Used scrum and continuous integration to improve projects"
      , "Set up, deployed, and maintained a server cabinet"
      ]
  }

stevensDetails : ExpItemDetails
stevensDetails =
  { card = StevensCard
  , color = "rgb(179, 5, 56)"
  , logo = "/assets/stevenslogo.jpg"
  , position = "Learning Technology Assistant"
  , timePeriod = "January 2015 - December 2016"
  , details =
      [ "Created 3D models of classrooms in preparation of renovations"
      , "Assisted with campus presentations"
      , "Provided AV support in classrooms"
      ]
  }

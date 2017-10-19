module Details exposing (..)

type DetailCard
  = JetCard
  | BaeCard
  | StevensCard
  | StevensEduCard


-- ABOUT ME

aboutMe : List String
aboutMe =
  [ """
    Hi, I'm Blake! I am currently a student at Stevens Institute
    of Technology pursuing a B.E. in Software Engineering and a minor
    in Computer Science.
    """
  , """
    I am most interested in frontend development and functional programming.
    I always enjoy reading about emerging technologies in these fields and
    researching how I can leverage them to create better software experiences.
    """
  ]

-- EXPERIENCE

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
      [ "Created 3D models of classrooms in preparation of renovations using SketchUp"
      , "Helped plan and execute new AV initiatives campus wide"
      , "Designed instructional infographics for various campus AV technologies using Adobe InDesign"
      , "Assisted with campus presentations"
      , "Provided AV support in classrooms"
      ]
  }


-- EDUCATION

type alias EduItemDetails =
  { card : DetailCard
  , color : String
  , logo : String
  , degree : String
  , timePeriod : String
  , major : String
  , minor : String
  , coursework : List String
  }

stevensEduDetails : EduItemDetails
stevensEduDetails =
  { card = StevensEduCard
  , color = "rgb(179, 5, 56)"
  , logo = "/assets/stevenslogo.jpg"
  , degree = "Bachelors of Engineering"
  , timePeriod = "August 2014 - May 2019"
  , major = "Software Engineering"
  , minor = "Computer Science"
  , coursework =
      [ "Algorithms"
      , "Web Programming"
      , "Human Computer Interaction"
      , "Object-Oriented Software Engineering"
      , "Data Structures"
      , "Agile Methods for Software Development"
      , "Software Requirements Analysis & Engineering"
      , "Discrete Math"
      , "Differential Equations"
      , "Probability and Statistics for Engineers"
      , "Engineering Design I-V"
      ]
  }


-- CONTACT

email : String
email = "blake.zimmerman@me.com"

phone : String
phone = "215-275-9279"

linkedin : String
linkedin = "https://www.linkedin.com/in/blake-zimmerman-5b9961149/"

github : String
github = "https://github.com/blakezimmerman"

module Details exposing (..)

import Css exposing (..)


type alias CardId =
    String


type alias ExpDetails =
    List String


type alias EduDetails =
    { major : String
    , minor : String
    , extracurricularActivities : List String
    , coursework : List String
    }


type alias ItemDetails details =
    { id : CardId
    , color : Color
    , logo : String
    , logoAlt : String
    , title : String
    , timePeriod : String
    , details : details
    }



-- ABOUT ME


aboutMe : List String
aboutMe =
    [ """
    Hi, I'm Blake! I am currently a software engineer building cutting
    edge tools at Intelligent Retail Lab by Walmart.
    """
    , """
    I am most interested in front-end development and functional programming.
    I always enjoy reading about emerging technologies in these fields and
    researching how I can leverage them to create better software experiences.
    """
    ]



-- EXPERIENCE


storeno8Details : ItemDetails ExpDetails
storeno8Details =
    { id = "storeno8Card"
    , color = rgb 0 0 255
    , logo = "/assets/storeno8logo.jpg"
    , logoAlt = "Store No. 8 Logo"
    , title = "Software Engineer"
    , timePeriod = "March 2018 - Present"
    , details =
        [ "Implemented, tested, and maintained microservices and web applications to drive innovative in-store experiences for Walmart"
        , "Developed a service to convert real-time RTSP video to HLS and serve it with only a 3 second delay"
        , "Pioneered a UI component library to facilitate sharing between the company’s front-end developers"
        , "Designed an internal React library for managing shared state in multi-window web applications"
        ]
    }


jetDetails : ItemDetails ExpDetails
jetDetails =
    { id = "jetCard"
    , color = rgb 130 0 255
    , logo = "/assets/jetlogo.jpg"
    , logoAlt = "Jet.com Logo"
    , title = "Software Engineering Intern"
    , timePeriod = "January 2017 - December 2017"
    , details =
        [ "Built a visualization tool for Jet’s internal telemetry logging system using Typescript, React, and D3"
        , "Developed an Angular 4 front-end from the ground up for a new internal tool that shows divergence between Event Store clusters"
        , "Implemented real-time notifications in the catalog management web application using SignalR, RxJS Observables, and F# microservices"
        , "Rewrote the authentication system for the catalog management web application using Node.js and Passport.js"
        , "Built a micro-scale version of the Jet.com website to demonstrate system architecture for new hires (front-end in Angular 2, back-end in Web API 2.2 using F#)"
        , "Developed and deployed production level features to customer service, order management, and catalog management web applications"
        ]
    }


baeDetails : ItemDetails ExpDetails
baeDetails =
    { id = "baeCard"
    , color = rgb 237 28 59
    , logo = "/assets/baelogo.jpg"
    , logoAlt = "BAE Logo"
    , title = "Technical Intern II"
    , timePeriod = "January 2016 - August 2016"
    , details =
        [ "Developed a web-based interface for a codebase health and metrics tool"
        , "Implemented and tested embedded software for Software Defined Radios"
        , "Used scrum and continuous integration to improve projects"
        , "Set up, deployed, and maintained a server cabinet"
        ]
    }


stevensDetails : ItemDetails ExpDetails
stevensDetails =
    { id = "stevensCard"
    , color = rgb 179 5 56
    , logo = "/assets/stevenslogo.jpg"
    , logoAlt = "Stevens Institute of Technology Logo"
    , title = "Learning Technology Assistant"
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


stevensEduDetails : ItemDetails EduDetails
stevensEduDetails =
    { id = "stevensEduCard"
    , color = rgb 179 5 56
    , logo = "/assets/stevenslogo.jpg"
    , logoAlt = "Stevens Institute of Technology Logo"
    , title = "Bachelors of Engineering"
    , timePeriod = "August 2014 - May 2019"
    , details =
        { major = "Software Engineering"
        , minor = "Computer Science"
        , extracurricularActivities =
            [ "President and Co-Founder of Software Engineering Club"
            , "Technology Director for Duckhacks Hackathon"
            , "Alpha Phi Omega Service Fraternity"
            ]
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
            , "Engineering Design I-VIII"
            ]
        }
    }



-- CONTACT


email : String
email =
    "blake" ++ ".zimm" ++ "erman" ++ "@" ++ "me." ++ "com"


linkedin : String
linkedin =
    "https://www.linkedin.com/in/blake-zimmerman-5b9961149/"


github : String
github =
    "https://github.com/blakezimmerman"

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
  }

jetDetails : ExpItemDetails
jetDetails =
  { card = JetCard
  , color = "rgb(130, 0, 255)"
  , logo = "/assets/jetlogo.jpg"
  , position = "Software Engineering Intern"
  , timePeriod = "January 2017 - Present"
  }

baeDetails : ExpItemDetails
baeDetails =
  { card = BaeCard
  , color = "rgb(237, 28, 59)"
  , logo = "/assets/baelogo.jpg"
  , position = "Technical Intern II"
  , timePeriod = "January 2016 - August 2016"
  }

stevensDetails : ExpItemDetails
stevensDetails =
  { card = StevensCard
  , color = "rgb(179, 5, 56)"
  , logo = "/assets/stevenslogo.jpg"
  , position = "Learning Technology Assistant"
  , timePeriod = "January 2015 - December 2016"
  }

port module Stylesheets exposing (..)

import Css.File exposing (CssCompilerProgram, CssFileStructure)
import Styles.MainStyles

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "mainStyles.css", Css.File.compile [ Styles.MainStyles.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure

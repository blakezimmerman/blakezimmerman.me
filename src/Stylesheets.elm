port module Stylesheets exposing (..)

import Css.File exposing (CssCompilerProgram, CssFileStructure)
import MainStyles

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "mainStyles.css", Css.File.compile [ MainStyles.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure

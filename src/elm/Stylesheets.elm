port module Stylesheets exposing (..)

import Css.File exposing (CssCompilerProgram, CssFileStructure)
import Main.Styles

port files : CssFileStructure -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "mainStyles.css", Css.File.compile [ Main.Styles.css ] ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure

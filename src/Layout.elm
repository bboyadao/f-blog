module Layout exposing (view)

import Element
    exposing
        ( Element
        , alpha
        , centerX
        , column
        , el
        , fill
        , height
        , link
        , maximum
        , mouseOver
        , paddingEach
        , rgb255
        , row
        , spacing
        , text
        , width
        )
import Element.Font as Font
import Generated.Routes as Routes exposing (Route, routes)
import Utils.Spa as Spa


view : Spa.LayoutContext msg -> Element msg
view { page, route } =
    column [ height fill, width fill ]
        [ viewHeader route
        , page
        ]


viewHeader : Route -> Element msg
viewHeader currentRoute =
    row
        [ spacing 24
        , paddingEach { top = 32, left = 16, right = 16, bottom = 0 }
        , centerX
        , width (fill |> maximum 480)
        ]
        [ viewLink currentRoute ( "home", routes.top )
        , viewLink currentRoute ( "nowhere", routes.notFound )
        ]


viewLink : Route -> ( String, Route ) -> Element msg
viewLink currentRoute ( label, route ) =
    if currentRoute == route then
        el
            [ Font.color (rgb255 97 96 97)
            , Font.size 15
            ]
            (text label)

    else
        link
            [ Font.color (rgb255 128 127 128)
            , Font.size 15
            ]
            { label = text label
            , url = Routes.toPath route
            }

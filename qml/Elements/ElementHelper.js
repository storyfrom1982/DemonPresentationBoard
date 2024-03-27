var text = "text"
var image = "image"
var media = "media"
var browser = "browser"
var rectangle = "rectangle"
var circle = "circle"
var icon = "icon"
var bracket = "bracket"
var animation = "animation"
var arrow = "arrow"
var table = "table"
var chart = "chart"

function path(element){
    switch(element){
    case text:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementText.qml"
    case image:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementImage.qml"
    case media:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementMedia.qml"
    case browser:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementImage.qml"
    case rectangle:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementRectangle.qml"
    case circle:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementCircle.qml"
    case icon:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementIcon.qml"
    case bracket:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementBracket.qml"
    case animation:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementAnimation.qml"
    case arrow:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementArrow.qml"
    case table:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementTable.qml"
    case chart:
        return "qrc:/qt/qml/DPBEditor/qml/Elements/ElementChart.qml"
    }
}

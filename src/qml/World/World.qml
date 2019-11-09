import QtQuick 2.12
import "../Elements"
import "../Elements/ElementHelper.js" as Element

Item{
    id: iroot

    anchors.fill: parent

    property var currentElement: undefined
    property real handlesScale: 1 / iboard.scale
    property alias fakeLaser: ifakeLaser
    property alias board: iboard

    function toJson(){
        var json = {
            "elements":""
        }

        var elements = []
        for(var i= 0;i<iboard.elementContainer.children.length;i++){
            elements.push(iboard.elementContainer.children[i].json)
        }
        json.elements = elements
        return json
    }

    function fromJson(json){
        var elements = json.elements
        for(var i= 0;i<elements.length;i++){
            createElement(elements[i].type,elements[i])
        }

    }
    function createElement(type, properties){
        var component = Qt.createComponent(Element.path(type))
        if(component.status === Component.Ready){
            var obj = component.createObject(iboard.elementContainer,properties)
            if(properties.common!==undefined){
                obj.fromJson(properties)
                obj.fromJsonBase(properties.common)
            }else if(type === Element.image || type ===Element.media){
                obj.created()
            }
        }
    }
    function clear(){
        for(var i= 0;i<iboard.elementContainer.children.length;i++){
            iboard.elementContainer.children[i].destroy()
        }
    }

    Shortcut {
        sequence: StandardKey.Delete
        onActivated: {
            if(currentElement!==undefined)
                currentElement.deleteIt()
        }
    }
    Shortcut {
        sequence: StandardKey.Cancel
        onActivated: {
            currentElement = undefined
        }
    }
    Shortcut {
        sequence: StandardKey.ZoomIn
        onActivated: {
            iboard.scale += 0.1 * iboard.scale
        }
    }
    Shortcut {
        sequence: StandardKey.ZoomOut
        onActivated: {
            iboard.scale -= 0.1* iboard.scale
        }
    }
    Shortcut {
        sequence: StandardKey.MoveToPreviousWord
        onActivated: {
            iboard.rotation --
        }
    }
    Shortcut {
        sequence: StandardKey.MoveToNextWord
        onActivated: {
            iboard.rotation ++
        }
    }


    Board{
        id: iboard
    }

    FakeLaser{
        id: ifakeLaser

        anchors.fill: parent
    }
}

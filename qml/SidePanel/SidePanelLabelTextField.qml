import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

RowLayout {
    id: iroot

    spacing: 10
    property alias label: ilable.text
    property alias text: itext.text
    property alias textFocus: itext.focus
    property int labelSize: ilable.paintedWidth
    property alias validationRegex: iregex.regularExpression
    property alias isValid: itext.acceptableInput
    Label{
        id: ilable
        Layout.preferredWidth: labelSize
    }
    TextField{
        id: itext

        Layout.fillWidth: true
        selectByMouse: true
        property var lastText
        validator: RegularExpressionValidator{
            id: iregex
        }
        onFocusChanged: {
            if(focus)
                lastText = text
        }

        onEditingFinished: {
            if(lastText !== text){
                ifileManager.fileChanged()
                lastText = text
            }
        }
    }
}

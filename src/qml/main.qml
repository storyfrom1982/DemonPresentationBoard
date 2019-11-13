import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Controls.Material 2.3
import "SidePanel"
import "World"
import "Timeline"
import "Settings"
import "FileEdit"

ApplicationWindow {
    id: iwin
    visible: true
    width: 800
    height: 600
    minimumWidth: 800
    minimumHeight: 600
    Material.theme: isettings.appInterface.theme
    Material.accent: Material.Red
    visibility: ApplicationWindow.Maximized
    onWidthChanged: iworld.updatePosition()
    onHeightChanged: iworld.updatePosition()

    readonly property real animationDuration: 200

    FontLoader{
        id: ifontAwsome
        source: "qrc:/res/res/Font Awesome 5 Pro-Solid-900.otf"
    }
    FontLoader{
        id: ifontAwsomereg
        source: "qrc:/res/res/Font Awesome 5 Pro-Regular-400.otf"
    }
    FontLoader{
        id: ifontAwsomebrands
        source: "qrc:/res/res/Font Awesome 5 Brands-Regular-400.otf"
    }
    World{
        id: iworld
    }
    Timeline{
        id: itimeline
        board: iworld.board
        onTimelienChanged: ifileManager.fileChanged()
    }
    SidePanelIconGallery{
        id: iiconGallery
    }
    Settings{
        id: isettings
    }
    SidePanel{
        id: isidePanel
    }

    FileManager{
        id: ifileManager

        appTitle: "Demon Presentation Board"
        application: iwin
        toFileFunc: function toFile(){
            var file = {
                "world":"",
                "timeline":""
            }
            file.world = iworld.toJson()
            file.timeline = itimeline.toJson()

            return JSON.stringify(file)
        }

        fromFileFunc: function fromFile(data){
            itimeline.clear()
            iworld.clear()
            var jsData = JSON.parse(data)
            iworld.fromJson(jsData.world)
            itimeline.fromJson(jsData.timeline)
        }

        binaryFilesFunc: function(){
            return iworld.binaryFiles()
        }

        fileFormat :"dpb"
    }
    RemoteHandler{
        id: iremoteHandler
    }
    Welcome{
        id: iwelcome
        visible: true
    }
}


import QtQuick
import QtCharts

ChartView{
    width: parent.width
    height: parent.height
    theme: currentTheme
    visible: type === chartType
    antialiasing: true
    legend.visible: containLegend
    property int type
}


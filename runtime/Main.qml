import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "runtime.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("Run time variables")

        Column {
            anchors.fill: parent

            ListItem.Base {
                id: header
                height: ubuntuLabel.height + runtime.height + units.gu(6)

                Column {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.centerIn: parent
                    spacing: units.gu(2)
                    Label {
                        id: ubuntuLabel
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: ""
                        fontSize: "x-large"
                    }
                    Label {
                        id: runtime
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "Runtime Environment"
                    }
                }
            }

            ListView {
                height: parent.height - header.height
                width: parent.width
                model: varModel
                clip: true

                delegate:  ListItem.Subtitled {
                    text: key
                    subText: value
                }
            }

        }
    }
}


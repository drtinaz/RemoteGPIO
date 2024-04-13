import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

        property string rgpioSettings: "dbus/com.victronenergy.settings/Settings/RemoteGPIO/ReadDigin"
        property string serviceSetting: "dbus/com.victronenergy.settings/Settings/Services/RemoteGPIO"

	title: qsTr("Read Digital Inputs")


	model: VisualModels {
		VisibleItemModel {


        	MbItemText {                                                               
            	text: qsTr("Enable reading the digital inputs of the connected relay modules")     
            	wrapMode: Text.WordWrap                                            
        	} 

        	MbSwitch {                                  
            	id: readdigin                           
            	name: qsTr("Enable")                 
				bind: rgpioSettings
        	}         
		}
	}
}

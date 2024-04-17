import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

        property string rgpioSettings: "dbus/com.victronenergy.settings/Settings/RemoteGPIO/Unit1"
        property string serviceSetting: "dbus/com.victronenergy.settings/Settings/Services/RemoteGPIO"

	title: qsTr("Unit 1 Options")


	model: VisualModels {
		VisibleItemModel {
          

        	MbSwitch {                                  
            	id: readdigin                           
            	name: qsTr("Enable Digital Inputs")                 
				bind: [rgpioSettings, "/ReadDigin"]
        	} 

        	MbSwitch {                                  
            	id: readrelay                           
            	name: qsTr("Enable Reading Relay State")                 
				bind: [rgpioSettings, "/ReadRelays"]
        	}

		}
	}
}
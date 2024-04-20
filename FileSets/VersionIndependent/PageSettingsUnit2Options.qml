import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

        property string rgpioSettings: "dbus/com.victronenergy.settings/Settings/RemoteGPIO/Unit2"
        property string serviceSetting: "dbus/com.victronenergy.settings/Settings/Services/RemoteGPIO"

	title: qsTr("Unit 2 Options")


	model: VisualModels {
		VisibleItemModel { 

			MbSwitch {                                  
            	id: reboot                           
            	name: qsTr("Reboot Unit 2?")                 
				bind: [rgpioSettings, "/Reboot"]
        	}         
		
			MbItemOptions {
            	id: confirm
            	description: qsTr("PLEASE CONFIRM")
				bind: serviceSetting
            	show: reboot.checked
            	possibleValues: [
                	MbOption {description: qsTr("Don't reboot Unit"); value: 1},
                	MbOption {description: qsTr("Yes, Reboot please"); value: 2}
            	]
        	}
		}
	}
}
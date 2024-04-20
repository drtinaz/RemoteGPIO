import QtQuick 1.1
import com.victron.velib 1.0
import "utils.js" as Utils

MbPage {
	id: root

        property string rgpioSettings: "dbus/com.victronenergy.settings/Settings/RemoteGPIO/Unit2"
        property string serviceSetting: "dbus/com.victronenergy.settings/Settings/Services/RemoteGPIO"

	title: qsTr("Unit 2 Configuration")


	model: VisualModels {
		VisibleItemModel {

	    	MbEditBox {
            	description: qsTr("Unit 2 IP Address")
            	maximumLength: 15
				item.bind: [rgpioSettings, "/IP"]
            	matchString: ".0123456789"
			}

			MbItemOptions {
                id: numrelays
                description: qsTr("Number of Relays")
                bind: [rgpioSettings, "/NumRelays"]
                show: enable.checked
                possibleValues: [
                    MbOption {description: qsTr("2 Relays"); value: 2},
                    MbOption {description: qsTr("4 Relays"); value: 4},
                    MbOption {description: qsTr("8 Relays"); value: 8}
                ]
            }

			MbSubMenu {
				description: qsTr("Additional Options")
				subpage: Component { PageSettingsUnit2Options {} }
			}
                        
        	MbItemText {                                                               
            	text: qsTr("Relay module needs to be configured with Addr = 2. TCP Service must be set to Modbus-TCP. Total number of relays for ALL connected modules MUST NOT exceed 16!")     
            	wrapMode: Text.WordWrap                                            
        	}    
		}
	}
}
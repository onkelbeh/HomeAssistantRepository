From ebuild directory /var/db/repos/HomeAssistantRepository/app-misc/zigbee2mqtt
cp zigbee2mqtt-<old>.ebuild zigbee2mqtt-<new>.ebuild
ebuild zigbee2mqtt-<new>.ebuild clean digest unpack
pushd /var/tmp/portage/app-misc/zigbee2mqtt-1.40.2/work/zigbee2mqtt-1.40.2
npm install
pushd ..
tar c zigbee2mqtt-1.40.2/node_modules/* | xz -4e > zigbee2mqtt-1.40.2-nodes_modules.tar.xz
popd && popd

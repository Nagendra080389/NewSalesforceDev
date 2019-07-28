/**
 * Created by Nagendra on 13-04-2019.
 */
({
    doInit:function (objComponent, objEvent, objHelper) {
        window.addEventListener("message", function (objEvent) {
            let accountIdFromAccountCard = objEvent.data;
            if(accountIdFromAccountCard) {
                var objData = JSON.parse(accountIdFromAccountCard);
                let workspaceAPI = objComponent.find("workspace");
                workspaceAPI.getEnclosingTabId().then(function(tabId) {
                    if(tabId === objData.objectId){
                        var fetchAddressInfo = objComponent.get('c.getAddresses');
                        fetchAddressInfo.setParams({
                            accountId : objData.data
                        });

                        fetchAddressInfo.setCallback(this, function (response) {
                            var state = response.getState();
                            if (state === "SUCCESS") {
                                objComponent.set('v.lstAddreses', response.getReturnValue())
                            }
                            else if (state === "INCOMPLETE") {
                                // do something
                            }
                            else if (state === "ERROR") {
                                var errors = response.getError();
                                if (errors) {
                                    if (errors[0] && errors[0].message) {
                                        console.log("Error message: " +
                                            errors[0].message);
                                    }
                                } else {
                                    console.log("Unknown error");
                                }
                            }
                        });
                        $A.enqueueAction(fetchAddressInfo);
                    } else {
                        return;
                    }
                })

            }
        });
    }
})
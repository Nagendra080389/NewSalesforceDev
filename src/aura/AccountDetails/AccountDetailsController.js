/**
 * Created by Nagendra on 13-04-2019.
 */
({
    doInit:function (objComponent, objEvent, objHelper) {
        var enqueueAction = objComponent.get('c.getListOfAllAccounts');
        enqueueAction.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                objComponent.set('v.lstAccounts', response.getReturnValue())
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
        $A.enqueueAction(enqueueAction);

        var setInterValCheck = setInterval(function () {
            if(document.getElementById('contactPage') !== undefined && document.getElementById('contactPage') !== null){
                if(document.getElementById('contactPage').dataisloaded === 1) {
                    var contentWindwow = document.getElementById('contactPage').contentWindow;
                    contentWindwow.postMessage(JSON.stringify('Check This'), '*');
                    clearInterval(setInterValCheck);
                }
            }
        }, 1000);
    },

    accountChanged: function (objComponent, objEvent, objHelper) {
        let accountId = objEvent.getSource().get("v.value");
        let workspaceAPI = objComponent.find("workspace");
        workspaceAPI.getEnclosingTabId().then(function(tabId) {
            workspaceAPI.getTabURL({
                tabId: tabId
            }).then(function(response) {
                var objToBePassed = {
                    objectId : tabId,
                    data : accountId
                }
                window.postMessage(JSON.stringify(objToBePassed), '*');
            });
        })

    }
})
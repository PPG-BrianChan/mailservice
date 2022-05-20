//@ui5-bundle mailserviceui/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"mailserviceui/Component.js":function(){sap.ui.define(["sap/fe/core/AppComponent"],function(e){"use strict";return e.extend("mailserviceui.Component",{metadata:{manifest:"json"}})});
},
	"mailserviceui/i18n/i18n.properties":'# This is the resource bundle for mailserviceui\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Mail Service UI\n\n#YDES: Application description\nappDescription=A Fiori application.',
	"mailserviceui/manifest.json":'{"_version":"1.40.0","sap.app":{"id":"mailserviceui","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap-ux/fiori-elements-writer:lrop","version":"0.2.0"},"dataSources":{"mainService":{"uri":"mailservice-services/","type":"OData","settings":{"annotations":["annotation"],"localUri":"localService/metadata.xml","odataVersion":"4.0"}},"annotation":{"type":"ODataAnnotation","uri":"annotations/annotation.xml","settings":{"localUri":"annotations/annotation.xml"}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.101.0","libs":{"sap.m":{},"sap.ui.core":{},"sap.ushell":{},"sap.fe.templates":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"mailserviceui.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true,"groupId":"$direct"}},"@i18n":{"type":"sap.ui.model.resource.ResourceModel","uri":"i18n/i18n.properties"}},"resources":{"css":[]},"routing":{"config":{},"routes":[{"pattern":":?query:","name":"mailrequestsList","target":"mailrequestsList"},{"pattern":"mailrequests({key}):?query:","name":"mailrequestsObjectPage","target":"mailrequestsObjectPage"}],"targets":{"mailrequestsList":{"type":"Component","id":"mailrequestsList","name":"sap.fe.templates.ListReport","options":{"settings":{"entitySet":"mailrequests","variantManagement":"Page","navigation":{"mailrequests":{"detail":{"route":"mailrequestsObjectPage"}}}}}},"mailrequestsObjectPage":{"type":"Component","id":"mailrequestsObjectPage","name":"sap.fe.templates.ObjectPage","options":{"settings":{"editableHeaderContent":false,"entitySet":"mailrequests"}}}}}},"sap.fiori":{"registrationIds":[],"archeType":"transactional"},"sap.cloud":{"public":true,"service":"mailservice_approuter"}}'
}});

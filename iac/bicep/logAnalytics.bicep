param resourcesPrefix string
var location = resourceGroup().location

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${resourcesPrefix}log'
  location: location
  
  properties: {
    sku: {
      name: 'PerGB2018'
    }
  }
}

resource logAnalyticsSolutionContainers 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
  name: 'Containers(${logAnalyticsWorkspace.name})'
  location: location
  
  plan: {
    name: 'Containers(${logAnalyticsWorkspace.name})'
    product: 'OMSGallery/Containers'
    publisher: 'Microsoft'
    promotionCode: '' // this is ignored, but has to be present
  }

  properties: {
    workspaceResourceId: logAnalyticsWorkspace.id
  }
}

// resource logAnalyticsSolutionContainerInsights 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
//   name: 'ContainerInsights(${logAnalyticsWorkspace.name})'
//   location: location
  
//   plan: {
//     name: 'ContainerInsights(${logAnalyticsWorkspace.name})'
//     product: 'OMSGallery/ContainerInsights'
//     publisher: 'Microsoft'
//     promotionCode: '' // this is ignored, but has to be present
//   }

//   properties: {
//     workspaceResourceId: logAnalyticsWorkspace.id
//   }
// }

param appServiceAppName string = 'toy-product-launch-494238'
var appServicePlanName = 'toy-product-launch-plan-starter'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'mystorageaccountrp233232'
  location: 'swedencentral'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: 'swedencentral'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceAppName
  location: 'swedencentral'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

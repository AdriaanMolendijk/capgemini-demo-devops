oc create secret generic <secret-name> \
 --from-literal=azurestorageaccountname=<storage-account> \
 --from-literal=azurestorageaccountkey=<storage-account-key> 
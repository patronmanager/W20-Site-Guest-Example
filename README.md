# Winter '20 Guest User FLS Example

## Create a scratch org and assign Perm Set to Site Guest User
```
sfdx force:org:create -f config/project-scratch-def.json --setdefaultusername
sfdx force:source:push
```

## Load the VF page

```
sfdx force:org:open
```
Then visit the Sites page in Setup and navigate to your new Site
```
https://<your Sites domain>/sample/FLSExample
``` 

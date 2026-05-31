## Check if Node is installed  
 
```text
node -v  —> [v26.0.0]
npm -v —> [11.12.1]
```
  
  
## If not installed
```text
brew install node 
```  

## Create Project

### Before
```text
npx react-native init MyFirstApp
```  

### Current
```text
npx @react-native-community/cli init MyFirstApp
```  

## Why did this change?

Before:

```text
npx react-native init MyFirstApp
``` 

The react-native package itself handled project creation.

Now the React Native team moved that responsibility to a separate CLI package:

**`React Native Community CLI`**

So:

```text
react-native   → framework/runtime
@react-native-community/cli → project generator / CLI
```

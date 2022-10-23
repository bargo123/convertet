# Instructions on how to build the project.
 - please run this command to make sure that we are on the same page => 
 flutter packages pub run build_runner watch --delete-conflicting-outputs 

# Adapted design pattern for the app architecture with justification on why to choose it
- Singleton =>  i used it  for any shared resources , and in case if the instance , is used more than one , to keep the memory in a good state

- factory if an instance is only used once like the GetCurrenciesService class , is used only once , when app is loaded , so no need to make a singleton 

# Adapted image loader library with justification on why to choose it.

- I used  cachedImageNetwork because it store the files and retrieve them when needed


# Used database in the app with justification on why to choose it.

- i used objectBox which is a non-sql , it's extremely fast , easy to use , it has the ability save data on a server, so you can retrieve your data if you used other devices
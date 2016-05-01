# Coffee-Companion

## Changes
### Change internal storage structure of model from Array to Dictionary (Apr '16)
 - Dictionary is a (key, value) pair:
    - key = String (this is simply the name of the particular coffee type)
    - value = Coffee (this includes all attributes necessary to distinguish a particular type from another)
 - The individual dictionaries (Intenso, Espresso, Pure Origin, Lungo, Decaffeinato, Variations) are sorted as and when required through use of the function createArrayFromDictionary()
 - The function createArrayFromDictionary() will be kept within the main VC

**N.B.** The whole reason for doing this is so that, when required, we can create a new array showing only the coffees whose attribute .isIncluded == true. This is required because the app allows the user to switch specific coffee types on/off. This means that a new (or updated) array must be created each time the user appends or removes a coffee. This new (or updated) array can be used to show only the **user-selected coffees** within the main view.

**When should Array be created?**
 - always within main VC?! (since this is the view in which we must only show specific coffees)
 - When app loads (check core data and load only coffee types for which .isIncluded == true)
 - When MenuVC segue unwinds back to main VC (i.e. just after user makes the change and adds/removes coffee types)

**When should we SAVE to core data (.isIncluded)?**
 - this has already been handled - each time the user switches a coffee on/off, core data is updated

**When should we LOAD from core data (.isIncluded)?**
 - whenever function is called - the load should be built into the function itself
 - Q1: we will have to load each coffee every time the function is called - will this have a noticeable impact on performance?
 - A1: it shouldn’t have a noticeable impact. This is also a far safer (less error-prone) method of determining whether or not a particular coffee should be included in its respective array. The alternative would be to create a new array so that we could simply use dot syntax to check .isIncluded == true, however we would then have to ensure this new array is kept in sync with core data. To avoid this altogether we will simply check the isIncluded attribute within core data each time the function is called. Also note that the function createArrayFromDictionary() will not be called very often - only when user switches coffee on/off

**Deal with newly-created Arrays**
 - create variables for each array that will be required (6No in total)
 - create new func updateArrays()
 - this function will update the 6No arrays, all at once, when required
 - this function must be called when app loads (otherwise arrays will be empty!)

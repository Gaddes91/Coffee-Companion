# Coffee-Companion

## Changes
Major change to model April ’16:
 - Change internal storage structure of model from Array to Dictionary
 - Dictionary is a (key, value) pair:
    - key = String (this is simply the name of the particular coffee type)
    - value = Coffee (this includes all attributes necessary to distinguish a particular type from another)
 - The individual dictionaries (Intenso, Espresso, Pure Origin, Lungo, Decaffeinato, Variations) are sorted as and when required through use of the function createArrayFromDictionary()
 - The function createArrayFromDictionary() will be kept within the main VC

*N.B.* The whole reason for doing this is so that, when required, we can create a new array showing only the coffees whose attribute .isIncluded == true. This is required because the app allows the user to switch specific coffee types on/off. This means that a new (or updated) array must be created each time the user appends or removes a coffee. This new (or updated) array can be used to show only the *user-selected coffees* within the main view.

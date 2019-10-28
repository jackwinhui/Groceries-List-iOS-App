1, 4


**READ FOR INFORMATION ABOUT IMPLEMENTATION OF ADD, REMOVE, AND CHANGE BUTTONS**
For challenge 4, I implemented add, remove, and change.

THE ADD METHOD NOW CHECKS IF THE ITEM ALREADY EXISTS ON THE GROCERIES LIST.
- If the item does not exist, it adds the item to the list. 
- If the item already exists, it adds the quantity in the text field to the original quantity on the groceries list. 

THE REMOVE METHOD REMOVES THE ITEM AND QUANTITY.
- If the quantity in the text field is greater than that on the groceries list, it returns an error. 
- If the quantity in the text field is less than that on the groceries list, then it only removes that quantity of items in the text field from the original quantity on the groceries list.
- If it is equal, then the entire item is removed. 
- If there is no value in the quantity text field, then the entire item is removed. 

THE CHANGE METHOD CHANGES THE QUANTITY IN THE GROCERIES LIST.
- The change method changes the quantity in the groceries list to quantity in the text field.
- If the quantity in the text field is 0, then the entire item is removed. 
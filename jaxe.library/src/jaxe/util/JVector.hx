package jaxe.util;
import jaxe.lang.JObject;

/**
 * ...
 * @author G.Legris
 */
class JVector extends List
{

	public function new() 
	{
		
	}
	
	public function addElement(e : T) : Void {
		add(e);
	}
	
	public function removeElementAt(int index): Void {
		remove(index);
	}
	
	public function capacity(): JInt {
		return 0;
	}
	
	/*public function contains(e: T): JBoolean
	
	
	}*/
	
	
	
	
/*void 	addElement(Object obj)
Adds the specified component to the end of this vector, increasing its size by one.
int 	capacity()
Returns the current capacity of this vector.
boolean 	contains(Object elem)
Tests if the specified object is a component in this vector.
void 	copyInto(Object[] anArray)
Copies the components of this vector into the specified array.
Object 	elementAt(int index)
Returns the component at the specified index.
Enumeration 	elements()
Returns an enumeration of the components of this vector.
void 	ensureCapacity(int minCapacity)
Increases the capacity of this vector, if necessary, to ensure that it can hold at least the number of components specified by the minimum capacity argument.
Object 	firstElement()
Returns the first component of this vector.
int 	indexOf(Object elem)
Searches for the first occurrence of the given argument, testing for equality using the equals method.
int 	indexOf(Object elem, int index)
Searches for the first occurrence of the given argument, beginning the search at index, and testing for equality using the equals method.
void 	insertElementAt(Object obj, int index)
Inserts the specified object as a component in this vector at the specified index.
boolean 	isEmpty()
Tests if this vector has no components.
Object 	lastElement()
Returns the last component of the vector.
int 	lastIndexOf(Object elem)
Returns the index of the last occurrence of the specified object in this vector.
int 	lastIndexOf(Object elem, int index)
Searches backwards for the specified object, starting from the specified index, and returns an index to it.
void 	removeAllElements()
Removes all components from this vector and sets its size to zero.
boolean 	removeElement(Object obj)
Removes the first occurrence of the argument from this vector.
void 	removeElementAt(int index)
Deletes the component at the specified index.
void 	setElementAt(Object obj, int index)
Sets the component at the specified index of this vector to be the specified object.
void 	setSize(int newSize)
Sets the size of this vector.
int 	size()
Returns the number of components in this vector.
String 	toString()
Returns a string representation of this vector.
void 	trimToSize()
Trims the capacity of this vector to be the vector's current size.*/
	
	
	
}
#pragma once

/**
 * Structure for storing a hash table.
 */
typedef struct _IntHashTable IntHashTable;

/**
 * Creates a new hash table, with no elements.
 * @param size The size of the hash table.
 * @return A reference to a hash table.
 */
IntHashTable *intHashTable_new(unsigned size);

/**
 * Frees all the memory allocated for the hash table.
 * @param hashTable Reference to the hash table to be freed.
 */
void intHashTable_free(IntHashTable *hashTable);

/**
 * Inserts the pair (key, value) in the hash table. If the key is already inside, the value should be changed with the new value.
 * @param hashTable Reference to the hash table.
 * @param key The key.
 * @param value The value.
 */
void intHashTable_put(IntHashTable *hashTable, int key, int value);

/**
 * Gets the value associated with the key inside the hash table. If the key does not exist, NULL should be returned.
 * @param hashTable Reference to the hash table.
 * @param key The key to be searched.
 * @return A reference to a value or NULL.
 */
int *intHashTable_get(IntHashTable *hashTable, int key);

/**
 * Deletes the pair (key, value) from the hash table. If the key does not exist, nothing happens.
 * @param hashTable Reference to the hash table.
 * @param key The key to be deleted.
 */
void intHashTable_delete(IntHashTable *hashTable, int key);

/**
 * Pretty prints the hash table.
 * @param hashTable Reference to the hash table.
 */
void intHashTable_print(IntHashTable *hashTable);

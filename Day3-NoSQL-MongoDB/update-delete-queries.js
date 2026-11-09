// File: update-delete-queries.js

const database = db.getSiblingDB("TechnicalYcap");
const collection = database.people;

// 1. Update one person's location
collection.updateOne(
    { id: 101 },
    { $set: { Location: "Nagpur" } }
);

// 2. Update one person's name
collection.updateOne(
    { id: 103 },
    { $set: { name: "Shiv Kumar" } }
);

// 3. Update multiple documents from YTL
collection.updateMany(
    { Location: "YTL" },
    { $set: { Location: "Yavatmal" } }
);

// 4. Add a new field to a document
collection.updateOne(
    { id: 104 },
    { $set: { status: "Active" } }
);

// 5. Remove a field from a document
collection.updateOne(
    { id: 104 },
    { $unset: { status: "" } }
);

// 6. Increase a numeric field (example)
collection.updateOne(
    { id: 101 },
    { $inc: { id: 1 } }
);

// 7. Delete one document
// Uncomment only when you want to perform this operation.
// collection.deleteOne({ id: 109 });

// 8. Delete multiple documents from a location
// Uncomment only when you want to perform this operation.
// collection.deleteMany({ Location: "Delhi" });

// 9. Delete all documents
// DANGEROUS: This removes every document from the collection.
// collection.deleteMany({});

print("Update and delete query examples completed.");
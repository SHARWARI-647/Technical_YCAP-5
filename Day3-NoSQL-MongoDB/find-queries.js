// File: find-queries.js

const database = db.getSiblingDB("TechnicalYcap");
const collection = database.people;

// 1. Display all documents
collection.find();

// 2. Find one document
collection.findOne();

// 3. Find person by name
collection.find({ name: "Om" });

// 4. Find people from Mumbai
collection.find({ Location: "Mumbai" });

// 5. Find people from Pune
collection.find({ Location: "Pune" });

// 6. Find people with ID greater than 104
collection.find({ id: { $gt: 104 } });

// 7. Find people with ID less than 105
collection.find({ id: { $lt: 105 } });

// 8. Find people with ID between 102 and 106
collection.find({
    id: { $gte: 102, $lte: 106 }
});

// 9. Find documents where contact field exists
collection.find({ contact: { $exists: true } });

// 10. Find people from Mumbai or Pune
collection.find({
    Location: { $in: ["Mumbai", "Pune"] }
});

// 11. Display only name and location
collection.find(
    {},
    { _id: 0, name: 1, Location: 1 }
);

// 12. Sort records by name in ascending order
collection.find().sort({ name: 1 });

// 13. Sort records by ID in descending order
collection.find().sort({ id: -1 });

// 14. Display first five documents
collection.find().limit(5);

// 15. Skip first three documents
collection.find().skip(3);
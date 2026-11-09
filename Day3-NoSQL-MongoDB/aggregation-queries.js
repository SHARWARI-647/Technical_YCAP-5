// File: aggregation-queries.js

const database = db.getSiblingDB("TechnicalYcap");
const collection = database.people;

// 1. Count total documents
collection.aggregate([
    {
        $count: "TotalRecords"
    }
]);

// 2. Count people in each location
collection.aggregate([
    {
        $group: {
            _id: "$Location",
            TotalPeople: { $sum: 1 }
        }
    }
]);

// 3. Sort locations by number of people
collection.aggregate([
    {
        $group: {
            _id: "$Location",
            TotalPeople: { $sum: 1 }
        }
    },
    {
        $sort: { TotalPeople: -1 }
    }
]);

// 4. Find all unique locations
collection.aggregate([
    {
        $group: {
            _id: "$Location"
        }
    }
]);

// 5. Count records with contact information
collection.aggregate([
    {
        $match: {
            contact: { $exists: true }
        }
    },
    {
        $count: "RecordsWithContact"
    }
]);

// 6. Group people by ID and find duplicate IDs
collection.aggregate([
    {
        $group: {
            _id: "$id",
            TotalRecords: { $sum: 1 },
            Names: { $push: "$name" }
        }
    },
    {
        $match: {
            TotalRecords: { $gt: 1 }
        }
    }
]);

// 7. Count total people from Mumbai
collection.aggregate([
    {
        $match: {
            Location: "Mumbai"
        }
    },
    {
        $count: "MumbaiPeople"
    }
]);

// 8. Display people from locations having more than one record
collection.aggregate([
    {
        $group: {
            _id: "$Location",
            TotalPeople: { $sum: 1 }
        }
    },
    {
        $match: {
            TotalPeople: { $gt: 1 }
        }
    }
]);

// 9. Group and collect names according to location
collection.aggregate([
    {
        $group: {
            _id: "$Location",
            Names: { $push: "$name" }
        }
    }
]);

// 10. Find the total number of unique IDs
collection.aggregate([
    {
        $group: {
            _id: "$id"
        }
    },
    {
        $count: "UniqueIDs"
    }
]);
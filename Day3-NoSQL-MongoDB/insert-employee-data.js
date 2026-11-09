// Day 3 - MongoDB
// File: insert-employee-data.js

// Select Database
const dbName = "TechnicalYcap";
const database = db.getSiblingDB(dbName);

// Select Collection
const collection = database.people;

// Insert Multiple Documents
collection.insertMany([
    {
        id: 101,
        name: "Rani",
        Location: "YTL"
    },
    {
        id: 102,
        name: "Om",
        Location: "YTL",
        contact: "DUMMY_CONTACT_1"
    },
    {
        id: 102,
        name: "Om",
        Location: "YTL",
        contact: "DUMMY_CONTACT_1"
    },
    {
        id: 103,
        name: "Shiv",
        Location: "Nagpur",
        contact: "DUMMY_CONTACT_2"
    },
    {
        id: 104,
        name: "Simran",
        Location: "Amravati",
        contact: "DUMMY_CONTACT_3"
    },
    {
        id: 105,
        name: "Vansh",
        Location: "Mumbai",
        contact: "DUMMY_CONTACT_1"
    },
    {
        id: 105,
        name: "Sharwari",
        Location: "Pune",
        contact: "DUMMY_CONTACT_2"
    },
    {
        id: 106,
        name: "Ram",
        Location: "Mumbai",
        contact: "DUMMY_CONTACT_3"
    },
    {
        id: 109,
        name: "Varun",
        Location: "Mumbai",
        contact: "DUMMY_CONTACT_1"
    },
    {
        id: 108,
        name: "Sanskruti",
        Location: "Pune",
        contact: "DUMMY_CONTACT_2"
    },
    {
        id: 107,
        name: "Tanushree",
        Location: "Delhi",
        contact: "DUMMY_CONTACT_3"
    }
]);

print("Documents inserted successfully!");

// Display all documents
collection.find().forEach(printjson);
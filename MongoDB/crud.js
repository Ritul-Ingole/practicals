// Create a new collection and insert multiple documents
db.students.insertMany([
  { roll_no: 1, name: "Ritul Ingole", branch: "Computer", marks: 88, city: "Pune" },
  { roll_no: 2, name: "Aryan Deshmukh", branch: "IT", marks: 76, city: "Nagpur" },
  { roll_no: 3, name: "Riya Patil", branch: "ENTC", marks: 92, city: "Pune" },
  { roll_no: 4, name: "Sneha Joshi", branch: "Civil", marks: 65, city: "Mumbai" },
  { roll_no: 5, name: "Aditya More", branch: "Mechanical", marks: 82, city: "Nashik" }
]);

// View all students
db.students.find().pretty();

// Find students from Pune
db.students.find({ city: "Pune" }).pretty();



// Update marks of student with roll_no = 2
db.students.updateOne(
  { roll_no: 2 },
  { $set: { marks: 85, city: "Pune" } }
);



// Delete student with roll_no = 4
db.students.deleteOne({ roll_no: 4 });

// Delete a student with marks less than 70
db.students.deleteOne({ marks: { $lt: 70 } });



// Insert new student using save()
db.students.save({ roll_no: 6, name: "Rahul Patil", branch: "Computer", marks: 79, city: "Kolhapur" });


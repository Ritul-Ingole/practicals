db.students.insertMany([
  { roll_no: 1, name: "Ritul Ingole", branch: "Computer", marks: 88, city: "Pune" },
  { roll_no: 2, name: "Aryan Deshmukh", branch: "IT", marks: 76, city: "Nagpur" },
  { roll_no: 3, name: "Riya Patil", branch: "ENTC", marks: 92, city: "Pune" },
  { roll_no: 4, name: "Sneha Joshi", branch: "Civil", marks: 65, city: "Mumbai" },
  { roll_no: 5, name: "Aditya More", branch: "Mechanical", marks: 82, city: "Nashik" },
  { roll_no: 6, name: "Rahul Patil", branch: "Computer", marks: 90, city: "Pune" }
]);

//maximum marks
db.students.aggregate([
  { $group: { _id: null, maxMarks: { $max: "$marks" } } }
]);

//minimum marks
db.students.aggregate([
  { $group: { _id: null, minMarks: { $min: "$marks" } } }
]);

//average marks
db.students.aggregate([
  { $group: { _id: null, avgMarks: { $avg: "$marks" } } }
]);

//total marks per city
db.students.aggregate([
  { $group: { _id: "$city", totalMarks: { $sum: "$marks" } } }
]);

//count of students per branch
db.students.aggregate([
  { $group: { _id: "$branch", studentCount: { $sum: 1 } } }
]);
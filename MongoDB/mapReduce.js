db.students.insertMany([
  { roll_no: 1, name: "Ritul Ingole", branch: "Computer", marks: 88 },
  { roll_no: 2, name: "Aryan Deshmukh", branch: "IT", marks: 76 },
  { roll_no: 3, name: "Riya Patil", branch: "ENTC", marks: 92 },
  { roll_no: 4, name: "Sneha Joshi", branch: "Civil", marks: 65 },
  { roll_no: 5, name: "Aditya More", branch: "Mechanical", marks: 82 },
  { roll_no: 6, name: "Rahul Patil", branch: "Computer", marks: 90 },
  { roll_no: 7, name: "Tanvi Kulkarni", branch: "Computer", marks: 84 }
]);


var mapFunction = function() {
  emit(this.branch, this.marks);
};


var reduceFunction = function(branch, marks) {
  return Array.sum(marks);
};

db.students.mapReduce(
  mapFunction,
  reduceFunction,
  { out: "total_marks_per_branch" }
);

db.total_marks_per_branch.find().pretty();
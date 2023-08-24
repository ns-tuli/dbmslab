using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine("TASK ONE -");
        {
            string path = @"grades.txt";
            string[] gradeLines = File.ReadAllLines(path);

            int highestStudentID = -1;
            double highestGPA = 0.0;

            foreach (string line in gradeLines)
            {
                string[] parts = line.Split(';');
                int studentID = int.Parse(parts[0]);
                double gpa = double.Parse(parts[1]);

                if (gpa > highestGPA)
                {
                    highestGPA = gpa;
                    highestStudentID = studentID;
                }
            }

            Console.WriteLine($"Student ID with the highest GPA: {highestStudentID}");

        }


        Console.WriteLine("TASK TWO -");
        {

            Console.Write("Enter Student ID: ");
            int studentID = int.Parse(Console.ReadLine());

            Console.Write("Enter GPA: ");
            double gpa = double.Parse(Console.ReadLine());

            Console.Write("Enter Semester: ");
            int semester = int.Parse(Console.ReadLine());

            if (gpa >= 2.50 && gpa <= 4.00 && semester >= 1 && semester <= 8)
            {
                string newGrade = $"{studentID};{gpa};{semester}";
                File.AppendAllText("grades.txt", newGrade + Environment.NewLine);
                Console.WriteLine("New grade added successfully.");
            }
            else
            {
                Console.WriteLine("Invalid input. GPA should be between 2.50 and 4.00, and semester should be between 1 and 8.");
            }
        }

        Console.WriteLine("TASK THREE-");
        {
           
            Console.Write("Enter Student ID: ");
            int studentID = int.Parse(Console.ReadLine());

            string[] studentInfoLines = File.ReadAllLines("studentInfo.txt");
            string[] gradeLines = File.ReadAllLines("grades.txt");

            string studentName = "";
            double totalGPA = 0.0;
            int semestersAttended = 0;

            foreach (string infoLine in studentInfoLines)
            {
                string[] parts = infoLine.Split(';');
                if (int.Parse(parts[0]) == studentID)
                {
                    studentName = parts[1];
                    break;
                }
            }

            foreach (string gradeLine in gradeLines)
            {
                string[] parts = gradeLine.Split(';');
                int gradeStudentID = int.Parse(parts[0]);
                double gpa = double.Parse(parts[1]);

                if (gradeStudentID == studentID)
                {
                    totalGPA += gpa;
                    semestersAttended++;
                }
            }

            if (studentName != "")
            {
                double cgpa = totalGPA / semestersAttended;
                Console.WriteLine($"Student Name: {studentName}");
                Console.WriteLine($"CGPA: {cgpa:F2}");
            }
            else
            {
                Console.WriteLine("Student not found in the database.");
            }
        }
    }

}

    






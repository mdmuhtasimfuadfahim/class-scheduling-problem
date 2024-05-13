% 
% Class Scheduling Model for Universities
% 
% This MiniZinc model was created by Md. Muhtasim Fuad Fahim, Alzum Shahadat Miazee
% for the course "CSE 6213 | Advanced Artificial Intelligence" at IUT in May, 2024.
%
% The problem involves scheduling courses in a university setting with the following constraints:
%
% 1. Each course must be scheduled three times per week.
%
% 2. Each classroom can only hold one class at a time for each day.
%
% 3. A course should be scheduled once a day.
%
% 4. The number of classes per week should not exceed the total credit hours for all courses.
%
% The model uses the following parameters:
%
% - N_levels: Number of sets of levels
% - N_courses: Number of courses per year
% - N_classroom: Number of classrooms
% - N_timeSlotsPerDayPerClassroom: Number of time slots
% - N_weekdays: Number of days in a week
% - N_creditPerCourses: Course credit
%
% The decision variable is a 5-dimensional array representing whether a set of students attends a course at a certain timeslot on a certain weekday in a certain classroom.
%
% The model outputs a schedule of courses, indicating the year, course, weekday, period, and classroom for each scheduled course.
%
% This MiniZinc model was created by Md. Muhtasim Fuad Fahim, Alzum Shahadat Miazee
% See also my MiniZinc page: http://www.hakank.org/minizinc/
%

% Parameters
int: N_levels; % Number of sets of levels
int: N_courses; % Number of courses per year
int: N_classroom; % Number of classrooms
int: N_timeSlotsPerDayPerClassroom; % Number of time slots
int: N_weekdays; % Number of days in a week
int: N_creditPerCourses; % Course credit

% Sets
set of int: Levels = 1..N_levels;
set of int: Courses = 1..N_courses;
set of int: Classrooms = 301..N_classroom;
set of int: Weekdays = 1..N_weekdays;
set of int: Timeslots = 1..N_timeSlotsPerDayPerClassroom;
set of int: Classnos =1..(3*N_levels*N_courses);

% Decision Variables
array[Levels, Courses, Weekdays, Timeslots, Classrooms] of var 0..1: StudentCourseTimeslot; % 1 if set of students attends course at timeslot on weekday, 0 otherwise

% Constraints
%Constraint 01: Each course must be scheduled three times per week
constraint forall(s in Levels, c in Courses)(
    sum(d in Weekdays, r in Classrooms, t in Timeslots)(StudentCourseTimeslot[s, c, d, t, r]) == 3
);
%Constraint 02: Each classroom can only hold one class at a time for each day
constraint forall(r in Classrooms, t in Timeslots, d in Weekdays)(
    sum(s in Levels, c in Courses)(StudentCourseTimeslot[s, c, d, t, r]) <= 1
);
%%Constraint 03: A course should be scheduled once a day
constraint forall(s in Levels, c in Courses, d in Weekdays)(
    sum(r in Classrooms, t in Timeslots)(StudentCourseTimeslot[s, c, d, t, r]) <= 1
);
%Constraint 04: Number of classes per week
constraint forall(s in Levels, c in Courses)(
    sum(d in Weekdays, t in Timeslots, r in Classrooms)(StudentCourseTimeslot[s, c, d, t, r]) <= N_creditPerCourses*N_levels*N_courses
);

% Solve
solve satisfy;

% Outputting the schedule
output ["Year | Course | Weekday | Period | Classroom\n"] ++
[ if fix(StudentCourseTimeslot[s, c, d, t, r]) = 1 then 
       " " ++ show(s) ++ "   |   " ++ show(c) ++ "    |    " ++ show(d) ++ "    |    " ++ show(t) ++ "   |    " ++ show(r) ++ "\n" 
    else "" 
    endif | s in Levels, c in Courses, d in Weekdays, t in Timeslots, r in Classrooms];
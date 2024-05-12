# Classroom Scheduling Model 👋

The `classroom-scheduling-model` is a MiniZinc model designed to solve the classroom scheduling problem in a university setting. It schedules courses considering various constraints like the number of times a course must be scheduled per week, classroom availability, and total credit hours for all courses.

## 🔖 Table Of Contents

- 🌱 [Prerequisites](#prerequisites)
- ⏬ [Installing](#installing)
- 📝 [Model Description](#model-description)
- 📖 [Example](#example)
- 💡 [How To Contribute](#how-to-contribute)
- 👤 [Author](#author)
- 🔏 [License](#license)

---

## 🌱 Prerequisites

- MiniZinc IDE

[Back To The Top](#title)

---

## ⏬ Installing

#### 💻 Desktop

1. Download and install the MiniZinc IDE from the [official website](https://www.minizinc.org/ide/).
2. Clone this repository and open the `class_scheduling.mzn` file in the MiniZinc IDE.

[Back To The Top](#title)

---

## 📝 Model Description

The model is designed to solve a classroom scheduling problem in a university setting. It uses several parameters such as the number of sets of levels, number of courses per year, number of classrooms, number of time slots, number of days in a week, and course credit.

The decision variable is a 5-dimensional array representing whether a set of students attends a course at a certain timeslot on a certain weekday in a certain classroom.

The model applies constraints to ensure that each course is scheduled three times per week, each classroom can only hold one class at a time for each day, a course should be scheduled once a day, and the number of classes per week should not exceed the total credit hours for all courses.

The model outputs a schedule of courses, indicating the year, course, weekday, period, and classroom for each scheduled course.

[Back To The Top](#title)

## 📖 Example

To run the model, follow these steps:

1. Open the `class_scheduling.mzn` file in the MiniZinc IDE.
2. Set the parameters as per your requirements. For example:
    - `N_levels = 4`
    - `N_courses = 4`
    - `N_classroom = 303`
    - `N_timeSlotsPerDayPerClassroom = 4`
    - `N_weekdays = 4`
    - `N_creditPerCourses = 3`
3. Click on the "Run" button in the IDE. The model will start solving the problem and will output a schedule once it's done.
4. The output will be a 5-dimensional array indicating the year, course, weekday, period, and classroom for each scheduled course.

The output of the model is available in this [CSV file](./schedule.csv).

Please note that the model may take some time to find a solution depending on the complexity of the problem (i.e., the number of courses, classrooms, timeslots, etc.).

[Back To The Top](#title)

---

## 💡 How To Contribute

- Fork it 😎
- Create a feature branch: `git checkout -b my-feature`
- Add your changes: `git add .`
- Commit your changes: `git commit -m 'My new feature'`
- Push to the branch: `git push origin my-feature`
- Submit a pull request 

<p align="center">
<i>Contributions, issues and features requests are welcome!</i><br />
<i>📮 Submit PRs to help solve issues or add features</i><br />
<i>🐛 Find and report issues</i><br />
<i>🌟 Star the project</i><br />
</p>

[Back To The Top](#title)

---

## 👤 Author

🤓 **Md. Muhtasim Fuad Fahim <muhtasimfahim@iut-dhaka.edu>**

- Github: [@mdmuhtasimfuadfahim](https://github.com/mdmuhtasimfuadfahim)

🤓 **Alzum Shahadat Miazee <alzumshahadat@iut-dhaka.edu>**

- Github: [@alzumiazee](https://github.com/alzumiazee/)

[Back To The Top](#title)

---

## 🔏 License

Copyright © 2024 [Md. Muhtasim Fuad Fahim](https://github.com/mdmuhtasimfuadfahim) & & [Alzum Shahadat Miazee](https://github.com/alzumiazee)

This project is licensed by [MIT License](https://api.github.com/licenses/mit).

[Back To The Top](#title)

---
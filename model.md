# 学生选课成绩系统表结构设计

## 1. 学生表 student
- student_id：VARCHAR(20)，主键，学号
- student_name：VARCHAR(50)，非空，学生姓名
- gender：CHAR(1)，非空，性别
- age：INT，年龄
- class_name：VARCHAR(50)，非空，班级
- phone：VARCHAR(20)，唯一，联系电话

## 2. 教师表 teacher
- teacher_id：VARCHAR(20)，主键，教师编号
- teacher_name：VARCHAR(50)，非空，教师姓名
- gender：CHAR(1)，非空，性别
- title：VARCHAR(50)，职称
- phone：VARCHAR(20)，唯一，电话

## 3. 课程表 course
- course_id：VARCHAR(20)，主键，课程号
- course_name：VARCHAR(100)，非空，课程名称
- credit：DECIMAL(3,1)，非空，学分
- teacher_id：VARCHAR(20)，非空，外键，关联 teacher(teacher_id)
- course_hours：INT，学时

## 4. 选课成绩表 score
- score_id：INT，自增主键，成绩记录编号
- student_id：VARCHAR(20)，非空，外键，关联 student(student_id)
- course_id：VARCHAR(20)，非空，外键，关联 course(course_id)
- usual_score：DECIMAL(5,2)，默认 0，平时成绩
- exam_score：DECIMAL(5,2)，默认 0，期末成绩
- total_score：DECIMAL(5,2)，总成绩

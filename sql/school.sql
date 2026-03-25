DROP DATABASE IF EXISTS school_selection_system;
CREATE DATABASE school_selection_system;
USE school_selection_system;

-- 1. 学生表
CREATE TABLE student (
    stu_id VARCHAR(20) PRIMARY KEY COMMENT '学号',
    student_name VARCHAR(50) NOT NULL COMMENT '学生姓名',
    gender CHAR(1) NOT NULL COMMENT '性别',
    age INT COMMENT '年龄',
    class_name VARCHAR(50) NOT NULL COMMENT '班级',
    phone VARCHAR(20) UNIQUE COMMENT '联系电话'
) COMMENT='学生表';

-- 2. 教师表
CREATE TABLE teacher (
    teacher_id VARCHAR(20) PRIMARY KEY COMMENT '教师编号',
    teacher_name VARCHAR(50) NOT NULL COMMENT '教师姓名',
    gender CHAR(1) NOT NULL COMMENT '性别',
    title VARCHAR(50) COMMENT '职称',
    phone VARCHAR(20) UNIQUE COMMENT '联系电话'
) COMMENT='教师表';

-- 3. 课程表
CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY COMMENT '课程号',
    course_name VARCHAR(100) NOT NULL COMMENT '课程名称',
    credit DECIMAL(3,1) NOT NULL COMMENT '学分',
    teacher_id VARCHAR(20) NOT NULL COMMENT '任课教师编号',
    course_hours INT COMMENT '学时',
    CONSTRAINT fk_course_teacher
        FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id)
) COMMENT='课程表';

-- 4. 选课成绩表
CREATE TABLE score (
    score_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '成绩记录编号',
    student_id VARCHAR(20) NOT NULL COMMENT '学号',
    course_id VARCHAR(20) NOT NULL COMMENT '课程号',
    usual_score DECIMAL(5,2) DEFAULT 0 COMMENT '平时成绩',
    exam_score DECIMAL(5,2) DEFAULT 0 COMMENT '期末成绩',
    total_score DECIMAL(5,2) COMMENT '总成绩',
    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id) REFERENCES student(student_id),
    CONSTRAINT fk_score_course
        FOREIGN KEY (course_id) REFERENCES course(course_id)
) COMMENT='选课成绩表';

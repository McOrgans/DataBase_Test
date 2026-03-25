-- 学生表
CREATE TABLE students (
    stud_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '学生学号（主键）',
    name VARCHAR(50) NOT NULL COMMENT '学生姓名',
    gender ENUM('男', '女') NOT NULL COMMENT '性别',
    birth_date DATE COMMENT '出生日期',
    major VARCHAR(100) NOT NULL COMMENT '专业',
    enroll_date DATE NOT NULL COMMENT '入学日期'
) COMMENT '学生信息表';

-- 课程表
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '课程编号（主键）',
    course_name VARCHAR(100) NOT NULL COMMENT '课程名称',
    credit TINYINT NOT NULL COMMENT '学分',
    teacher VARCHAR(50) NOT NULL COMMENT '授课教师',
    classroom VARCHAR(20) COMMENT '上课教室'
) COMMENT '课程信息表';

-- 成绩表（关联学生和课程）
CREATE TABLE scores (
    score_id INT PRIMARY KEY AUTO_INCREMENT COMMENT '成绩记录ID',
    stud_id INT NOT NULL COMMENT '关联学生学号',
    course_id INT NOT NULL COMMENT '关联课程编号',
    score DECIMAL(5,2) COMMENT '考试成绩',
    exam_date DATE NOT NULL COMMENT '考试日期',
    -- 外键约束：关联学生表
    FOREIGN KEY (stud_id) REFERENCES students(stud_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    -- 外键约束：关联课程表
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    -- 唯一约束：同一学生同一课程只能有一条成绩记录
    UNIQUE KEY unique_student_course (stud_id, course_id)
) COMMENT '学生成绩表';
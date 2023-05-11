CREATE TABLE IF NOT EXISTS Person (
    UtorID VARCHAR(100) PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    SIN VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Student (
    StudentID VARCHAR(100) PRIMARY KEY,
    UtorID VARCHAR(100),
    status VARCHAR(100),
    emergency_contact_name VARCHAR(100),
    emergency_contact_phone VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Department (
    DepartmentID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(100),
    Chair VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Employee (
    EID VARCHAR(100) PRIMARY KEY,
    PersonnelNum VARCHAR(100),
    UtorID VARCHAR(100),
    SIN VARCHAR(100),
    status VARCHAR(100),
    role int,
    DepartmentID VARCHAR(100),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Professor (
    EID VARCHAR(100) PRIMARY KEY,
    type VARCHAR(100),
    rank VARCHAR(100),
    FOREIGN KEY (EID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Course (
    CourseCode VARCHAR(100),
    Session VARCHAR(100),
    PEID VARCHAR(100),

    PRIMARY KEY(CourseCode, Session),
    FOREIGN KEY (PEID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Teachingassistant (
    StudentID VARCHAR(100) PRIMARY KEY,
    CourseCode VARCHAR(100),
    Session VARCHAR(100),
    ContractHour int,
    SIN int,
    PersonnelNum int,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseCode, Session) REFERENCES Course(CourseCode, Session)
);

CREATE TABLE IF NOT EXISTS Campus (
    CampusID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Faculty (
    Name VARCHAR(100),
    CampusID VARCHAR(100),
    EID VARCHAR(100),
    Phone VARCHAR(100),

    PRIMARY KEY(Name, CampusID),
    FOREIGN KEY (CampusID) REFERENCES Campus(CampusID),
    FOREIGN KEY (EID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Hold (
    CampusID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),

    FOREIGN KEY (CampusID) REFERENCES Campus(CampusID),
    FOREIGN KEY (Name, CampusID) REFERENCES Faculty(Name, CampusID)
);

CREATE TABLE IF NOT EXISTS Manage(
    DepartmentID VARCHAR(100) PRIMARY KEY,
    Name VARCHAR(100),
    CampusID VARCHAR(100),

    FOREIGN KEY (Name, CampusID) REFERENCES Faculty(Name, CampusID),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE IF NOT EXISTS Offer (
    DepartmentID VARCHAR(100) PRIMARY KEY,
    CourseCode VARCHAR(100),
    Session VARCHAR(100),

    FOREIGN KEY (DepartmentID ) REFERENCES Department(DepartmentID),
    FOREIGN KEY (CourseCode, Session) REFERENCES Course(CourseCode, Session)
);

CREATE TABLE IF NOT EXISTS Lecture (

    CourseCode VARCHAR(100),
    Session VARCHAR(100),
    Time DATE,
    Lecture_session VARCHAR(100),
    PEID VARCHAR(100),

    FOREIGN KEY (CourseCode, Session) REFERENCES Course(CourseCode, Session),
    FOREIGN KEY (PEID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Grade (
    StudentID VARCHAR(100) PRIMARY KEY,
    CourseCode VARCHAR(100),
    Session VARCHAR(100),
    Mark NUMERIC,
    LetterGrade NUMERIC,

    FOREIGN KEY (CourseCode, Session) REFERENCES Course(CourseCode, Session),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
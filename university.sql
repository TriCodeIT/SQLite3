CREATE TABLE Matakuliah
(
    id_mk CHAR (5) PRIMARY KEY NOT NULL,
    nama_matakuliah VARCHAR (35) NOT NULL,
    jumlah_sks INTEGER NOT NULL
);
INSERT INTO Matakuliah(id_mk,nama_matakuliah,jumlah_sks) VALUES ('MK001','Fisika Kuantum', 4);
INSERT INTO Matakuliah(id_mk,nama_matakuliah,jumlah_sks) VALUES ('MK002','Fisika Komputasi', 3);
INSERT INTO Matakuliah(id_mk,nama_matakuliah,jumlah_sks) VALUES ('MK003','Instrumentasi Cerdas', 4);

CREATE TABLE Jurusan
(
    id_jr CHAR (5) PRIMARY KEY NOT NULL,
    nama_jurusan VARCHAR (20) NOT NULL
);
INSERT INTO Jurusan(id_jr, nama_jurusan) VALUES ('JR001','FISIKA');
INSERT INTO Jurusan(id_jr, nama_jurusan) VALUES ('JR002','ILMU KOMPUTER');
INSERT INTO Jurusan(id_jr, nama_jurusan) VALUES ('JR003','KIMIA');

CREATE TABLE Dosen
(
    id_dos CHAR (6) PRIMARY KEY NOT NULL,
    nama_dosen VARCHAR (50) NOT NULL
);
INSERT INTO Dosen(id_dos, nama_dosen) VALUES ('DOS001','Ahmad Aminudin');
INSERT INTO Dosen(id_dos, nama_dosen) VALUES ('DOS002','Ana Hadiana');
INSERT INTO Dosen(id_dos, nama_dosen) VALUES ('DOS003','Rubi Henjaya');

CREATE TABLE Mahasiswa
(
    nim CHAR (10) PRIMARY KEY NOT NULL,
    nama_mahasiswa VARCHAR (50) NOT NULL,
    alamat TEXT NOT NULL,
    jenis_kelamin VARCHAR (10) NOT NULL,
    umur INTEGER NOT NULL,
    id_jr CHAR (5) NOT NULL,
    nama_jurusan VARCHAR (20) NOT NULL,
    FOREIGN KEY (id_jr) REFERENCES Jurusan (id_jr),
    FOREIGN KEY (nama_jurusan) REFERENCES Jurusan (nama_jurusan)
);
INSERT INTO Mahasiswa(nim,nama_mahasiswa,alamat,jenis_kelamin,umur,id_jr,nama_jurusan) VALUES ('2018210020','TRI SUTRISNA BHAYUKUSUMA','Jalan Depok VI Antapani Kota Bandung','Laki-Laki','29','JR001','FISIKA');

CREATE TABLE Semester 
(
    smt CHAR (2) NOT NULL,
    nim CHAR (10) NOT NULL,
    id_mk CHAR (5) NOT NULL,
    id_dos CHAR (6) NOT NULL,
    nilai TEXT NOT NULL,
    PRIMARY KEY (nim,id_mk,id_dos),
    FOREIGN KEY (nim) REFERENCES Mahasiswa (nim),
    FOREIGN KEY (id_mk) REFERENCES Matakuliah (id_mk),
    FOREIGN KEY (id_dos) REFERENCES Dosen (id_dos)
);
INSERT INTO Semester(smt,nim,id_mk,id_dos,nilai) VALUES ('01','2018210020','MK003','Ahmad Aminudin','A');




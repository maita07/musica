--drop database musica
create database musica;
go

use musica;
go

-- Tabla: Banda
CREATE TABLE Banda (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NombreBanda NVARCHAR(100) NOT NULL
);
GO

-- Tabla: Album
CREATE TABLE Album (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NombreAlbum NVARCHAR(100) NOT NULL,
    FechaLanzamiento DATE NOT NULL,
    BandaId INT FOREIGN KEY REFERENCES Banda(Id)
);
GO

-- Tabla: Tema
CREATE TABLE Tema (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    NumeroTema INT NOT NULL,
    NombreTema NVARCHAR(100) NOT NULL,
    AlbumId INT FOREIGN KEY REFERENCES Album(Id)
);
GO

-- Tabla: Usuario
CREATE TABLE Usuario (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    NombreUsuario NVARCHAR(50) NOT NULL UNIQUE
);
GO

-- Tabla: Escucha
CREATE TABLE Escucha (
    UsuarioId INT NOT NULL,
    TemaId INT NOT NULL,
    FechaHora DATETIME2 NOT NULL,
    PRIMARY KEY (UsuarioId, TemaId, FechaHora),
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    FOREIGN KEY (TemaId) REFERENCES Tema(Id)
);
GO

-- Tabla: Prefiere
CREATE TABLE Prefiere (
    UsuarioId INT NOT NULL,
    BandaId INT NOT NULL,
    PRIMARY KEY (UsuarioId, BandaId),
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    FOREIGN KEY (BandaId) REFERENCES Banda(Id)
);
GO




--Insertar usuarios
INSERT INTO Usuario (Nombre, Apellido, NombreUsuario) VALUES
('Juan', 'Pérez', 'juanp'),
('Ana', 'Gómez', 'anag'),
('Carlos', 'López', 'carlosl'),
('Luisa', 'Martínez', 'luim'),
('Pedro', 'García', 'pedrog'),
('Marta', 'Sánchez', 'martas'),
('Diego', 'Rodríguez', 'diegor'),
('Laura', 'Hernández', 'laurah'),
('Sofía', 'Ramírez', 'sofiar'),
('David', 'Díaz', 'davidd'),
('Isabel', 'Jiménez', 'isabelj'),
('Jorge', 'Morales', 'jorgem'),
('Clara', 'Ortiz', 'clarao'),
('Pablo', 'Torres', 'pablot'),
('Valeria', 'Flores', 'valeriaf'),
('Lucas', 'Castillo', 'lucasc'),
('Camila', 'Vega', 'camilav'),
('Andrés', 'Reyes', 'andresr'),
('Manuela', 'Cruz', 'manuelac'),
('Sebastián', 'Silva', 'sebass');
GO

-- Inserta bandas
INSERT INTO Banda (NombreBanda) VALUES
('The Beatles'), ('Metallica'), ('Queen'), ('Pink Floyd'), ('Nirvana'),
('Radiohead'), ('Led Zeppelin'), ('AC/DC'), ('The Rolling Stones'), ('Coldplay'),
('U2'), ('Red Hot Chili Peppers'), ('Green Day'), ('Linkin Park'), ('Foo Fighters'),
('Pearl Jam'), ('Muse'), ('Imagine Dragons'), ('Arctic Monkeys'), ('The Killers');
GO

INSERT INTO Album (NombreAlbum, FechaLanzamiento, BandaId) VALUES
('Abbey Road', '1969-09-26', 1),
('Master of Puppets', '1986-03-03', 2),
('A Night at the Opera', '1975-11-21', 3),
('The Dark Side of the Moon', '1973-03-01', 4),
('Nevermind', '1991-09-24', 5),
('OK Computer', '1997-05-21', 6),
('Led Zeppelin IV', '1971-11-08', 7),
('Back in Black', '1980-07-25', 8),
('Let It Bleed', '1969-12-05', 9),
('A Rush of Blood to the Head', '2002-08-26', 10),
('The Joshua Tree', '1987-03-09', 11),
('Californication', '1999-06-08', 12),
('American Idiot', '2004-09-20', 13),
('Hybrid Theory', '2000-10-24', 14),
('The Colour and the Shape', '1997-05-20', 15),
('Ten', '1991-08-27', 16),
('Black Holes and Revelations', '2006-07-03', 17),
('Night Visions', '2012-09-04', 18),
('AM', '2013-09-09', 19),
('Hot Fuss', '2004-06-07', 20);
GO

-- Abbey Road (The Beatles)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Come Together', 1),
(2, 'Something', 1),
(3, 'Maxwell''s Silver Hammer', 1),
(4, 'Oh! Darling', 1),
(5, 'Octopus''s Garden', 1),
(6, 'I Want You (She''s So Heavy)', 1),
(7, 'Here Comes the Sun', 1),
(8, 'Because', 1),
(9, 'You Never Give Me Your Money', 1),
(10, 'The End', 1);

-- Master of Puppets (Metallica)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Battery', 2),
(2, 'Master of Puppets', 2),
(3, 'The Thing That Should Not Be', 2),
(4, 'Welcome Home (Sanitarium)', 2),
(5, 'Disposable Heroes', 2),
(6, 'Leper Messiah', 2),
(7, 'Orion', 2),
(8, 'Damage, Inc.', 2);

-- A Night at the Opera (Queen)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Death on Two Legs', 3),
(2, 'Lazing on a Sunday Afternoon', 3),
(3, 'I''m in Love with My Car', 3),
(4, 'You''re My Best Friend', 3),
(5, 'Mateo', 3),
(6, 'Sweet Lady', 3),
(7, 'Seaside Rendezvous', 3),
(8, 'The Prophet''s Song', 3),
(9, 'Love of My Life', 3),
(10, 'Bohemian Rhapsody', 3);

-- The Dark Side of the Moon (Pink Floyd)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Speak to Me', 4),
(2, 'Breathe', 4),
(3, 'On the Run', 4),
(4, 'Time', 4),
(5, 'The Great Gig in the Sky', 4),
(6, 'Money', 4),
(7, 'Us and Them', 4),
(8, 'Any Colour You Like', 4),
(9, 'Brain Damage', 4),
(10, 'Eclipse', 4);

-- Nevermind (Nirvana)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Smells Like Teen Spirit', 5),
(2, 'In Bloom', 5),
(3, 'Come as You Are', 5),
(4, 'Breed', 5),
(5, 'Lithium', 5),
(6, 'Polly', 5),
(7, 'Territorial Pissings', 5),
(8, 'Drain You', 5),
(9, 'Lounge Act', 5),
(10, 'Something in the Way', 5);

-- OK Computer (Radiohead)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Airbag', 6),
(2, 'Paranoid Android', 6),
(3, 'Subterranean Homesick Alien', 6),
(4, 'Exit Music (For a Film)', 6),
(5, 'Let Down', 6),
(6, 'Karma Police', 6),
(7, 'No Surprises', 6),
(8, 'Lucky', 6);

-- Led Zeppelin IV (Led Zeppelin)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Black Dog', 7),
(2, 'Rock and Roll', 7),
(3, 'The Battle of Evermore', 7),
(4, 'Stairway to Heaven', 7),
(5, 'Misty Mountain Hop', 7),
(6, 'Four Sticks', 7),
(7, 'Going to California', 7),
(8, 'When the Levee Breaks', 7);

-- Back in Black (AC/DC)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Hells Bells', 8),
(2, 'Shoot to Thrill', 8),
(3, 'What Do You Do for Money Honey', 8),
(4, 'Given the Dog a Bone', 8),
(5, 'Back in Black', 8),
(6, 'You Shook Me All Night Long', 8),
(7, 'Have a Drink on Me', 8),
(8, 'Rock and Roll Ain’t Noise Pollution', 8);

-- Let It Bleed (The Rolling Stones)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Gimme Shelter', 9),
(2, 'Love in Vain', 9),
(3, 'Country Honk', 9),
(4, 'Live with Me', 9),
(5, 'Let It Bleed', 9),
(6, 'Midnight Rambler', 9),
(7, 'You Got the Silver', 9),
(8, 'You Can’t Always Get What You Want', 9);

-- A Rush of Blood to the Head (Coldplay)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Politik', 10),
(2, 'In My Place', 10),
(3, 'God Put a Smile upon Your Face', 10),
(4, 'The Scientist', 10),
(5, 'Clocks', 10),
(6, 'Daylight', 10),
(7, 'Warning Sign', 10),
(8, 'A Rush of Blood to the Head', 10);

-- The Joshua Tree (U2)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Where the Streets Have No Name', 11),
(2, 'I Still Haven’t Found What I’m Looking For', 11),
(3, 'With or Without You', 11),
(4, 'Bullet the Blue Sky', 11),
(5, 'Running to Stand Still', 11),
(6, 'Red Hill Mining Town', 11),
(7, 'In God’s Country', 11),
(8, 'One Tree Hill', 11);

-- Californication (Red Hot Chili Peppers)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Around the World', 12),
(2, 'Parallel Universe', 12),
(3, 'Scar Tissue', 12),
(4, 'Otherside', 12),
(5, 'Get on Top', 12),
(6, 'Californication', 12),
(7, 'Easily', 12),
(8, 'Road Trippin’', 12);

-- American Idiot (Green Day)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'American Idiot', 13),
(2, 'Jesus of Suburbia', 13),
(3, 'Holiday', 13),
(4, 'Boulevard of Broken Dreams', 13),
(5, 'Are We the Waiting', 13),
(6, 'St. Jimmy', 13),
(7, 'Give Me Novacaine', 13),
(8, 'Wake Me Up When September Ends', 13);

-- Hybrid Theory (Linkin Park)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Papercut', 14),
(2, 'One Step Closer', 14),
(3, 'With You', 14),
(4, 'Points of Authority', 14),
(5, 'Crawling', 14),
(6, 'In the End', 14),
(7, 'Pushing Me Away', 14),
(8, 'By Myself', 14);

-- The Colour and the Shape (Foo Fighters)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Doll', 15),
(2, 'Monkey Wrench', 15),
(3, 'Hey, Johnny Park!', 15),
(4, 'My Hero', 15),
(5, 'See You', 15),
(6, 'Everlong', 15),
(7, 'Walking After You', 15),
(8, 'New Way Home', 15);

-- Ten (Pearl Jam)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Once', 16),
(2, 'Even Flow', 16),
(3, 'Alive', 16),
(4, 'Why Go', 16),
(5, 'Black', 16),
(6, 'Jeremy', 16),
(7, 'Oceans', 16),
(8, 'Release', 16);

-- Black Holes and Revelations (Muse)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Take a Bow', 17),
(2, 'Starlight', 17),
(3, 'Supermassive Black Hole', 17),
(4, 'Map of the Problematique', 17),
(5, 'Soldier’s Poem', 17),
(6, 'Invincible', 17),
(7, 'Assassin', 17),
(8, 'Knights of Cydonia', 17);

-- Night Visions (Imagine Dragons)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Radioactive', 18),
(2, 'Tiptoe', 18),
(3, 'It’s Time', 18),
(4, 'Demons', 18),
(5, 'On Top of the World', 18),
(6, 'Amsterdam', 18),
(7, 'Hear Me', 18),
(8, 'Bleeding Out', 18);

-- AM (Arctic Monkeys)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Do I Wanna Know?', 19),
(2, 'R U Mine?', 19),
(3, 'One for the Road', 19),
(4, 'Arabella', 19),
(5, 'I Want It All', 19),
(6, 'No. 1 Party Anthem', 19),
(7, 'Snap Out of It', 19),
(8, 'I Wanna Be Yours', 19);

-- Hot Fuss (The Killers)
INSERT INTO Tema (NumeroTema, NombreTema, AlbumId) VALUES
(1, 'Jenny Was a Friend of Mine', 20),
(2, 'Mr. Brightside', 20),
(3, 'Smile Like You Mean It', 20),
(4, 'Somebody Told Me', 20),
(5, 'All These Things That I’ve Done', 20),
(6, 'Andy, You’re a Star', 20),
(7, 'Glamorous Indie Rock & Roll', 20),
(8, 'Everything Will Be Alright', 20);

go






-- Escoge 40 combinaciones válidas de usuarios y temas existentes
DECLARE @maxRegistros INT = 40;
DECLARE @usuarioId INT;
DECLARE @temaId INT;
DECLARE @contador INT = 0;

WHILE @contador < @maxRegistros
BEGIN
    SELECT TOP 1 @usuarioId = Id FROM Usuario ORDER BY NEWID();
    SELECT TOP 1 @temaId = Id FROM Tema ORDER BY NEWID();

    IF NOT EXISTS (
        SELECT 1 FROM Escucha 
        WHERE UsuarioId = @usuarioId AND TemaId = @temaId
    )
    BEGIN
        INSERT INTO Escucha (UsuarioId, TemaId, FechaHora)
        VALUES (@usuarioId, @temaId, DATEADD(MINUTE, -@contador * 10, SYSDATETIME()));
        
        SET @contador = @contador + 1;
    END
END;
GO



-- Escoge 40 combinaciones válidas de usuarios y bandas existentes
DECLARE @maxPrefiere INT = 40;
DECLARE @usuarioPrefId INT;
DECLARE @bandaPrefId INT;
DECLARE @contador2 INT = 0;

WHILE @contador2 < @maxPrefiere
BEGIN
    SELECT TOP 1 @usuarioPrefId = Id FROM Usuario ORDER BY NEWID();
    SELECT TOP 1 @bandaPrefId = Id FROM Banda ORDER BY NEWID();

    IF NOT EXISTS (
        SELECT 1 FROM Prefiere 
        WHERE UsuarioId = @usuarioPrefId AND BandaId = @bandaPrefId
    )
    BEGIN
        INSERT INTO Prefiere (UsuarioId, BandaId)
        VALUES (@usuarioPrefId, @bandaPrefId);
        
        SET @contador2 = @contador2 + 1;
    END
END;
GO






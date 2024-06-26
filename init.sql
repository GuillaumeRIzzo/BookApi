USE [BookDB]
GO
/****** Object:  Database [BookDB]    Script Date: 04/06/2024 14:09:22 ******/
CREATE DATABASE [BookDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookDB] SET  MULTI_USER 
GO
ALTER DATABASE [BookDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookDB] SET QUERY_STORE = OFF
GO
USE [BookDB]
GO
/****** Object:  User [sa]    Script Date: 04/06/2024 14:09:22 ******/
CREATE USER [sa] WITH LOGIN = sa, DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[AUTHOR]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AUTHOR](
	[authorID] [int] IDENTITY(1,1) NOT NULL,
	[authorName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED 
(
	[authorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOK]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK](
	[bookID] [int] IDENTITY(1,1) NOT NULL,
	[bookTitle] [varchar](50) NOT NULL,
	[bookDescription] [text] NOT NULL,
	[bookPublishDate] [datetime] NOT NULL,
	[bookPageCount] [int] NOT NULL,
	[bookAverageRating] [float] NULL,
	[bookRatingCount] [int] NULL,
	[bookImageLink] [text] NULL,
	[bookLanguage] [varchar](15) NULL,
	[publisherID] [int] NOT NULL,
	[authorID] [int] NOT NULL,
 CONSTRAINT [PK_BOOK] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOK_ACTIONS]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_ACTIONS](
	[bookID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[bookActionsDateAdd] [datetime] NOT NULL,
	[bookActionsDateUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_BOOK_ACTIONS] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOK_CATEGORIES]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOK_CATEGORIES](
	[bookCategoID] [int] IDENTITY(1,1) NOT NULL,
	[bookCategoName] [varchar](100) NOT NULL,
	[bookCategoDescription] [text] NULL,
 CONSTRAINT [PK_BOOK_CATEGORIES] PRIMARY KEY CLUSTERED 
(
	[bookCategoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIE_LIST]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIE_LIST](
	[bookCategoID] [int] NOT NULL,
	[bookID] [int] NOT NULL,
 CONSTRAINT [PK_CATEGORIE_LIST] PRIMARY KEY CLUSTERED 
(
	[bookCategoID] ASC,
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODIFY]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODIFY](
	[userID] [int] NOT NULL,
	[userID_USERS] [int] NOT NULL,
	[modifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MODIFY] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[userID_USERS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUBLISHER]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUBLISHER](
	[publisherID] [int] IDENTITY(1,1) NOT NULL,
	[publisherName] [varchar](60) NOT NULL,
 CONSTRAINT [PK_PUBLISHER] PRIMARY KEY CLUSTERED 
(
	[publisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[READLIST]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[READLIST](
	[bookID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[readListRead] [bit] NOT NULL,
	[readListDateAdd] [datetime] NOT NULL,
	[readListDateUpdate] [datetime] NOT NULL,
 CONSTRAINT [PK_READLIST] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 04/06/2024 14:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userFirstname] [varchar](50) NOT NULL,
	[userLastname] [varchar](50) NOT NULL,
	[userPassword] [varchar](80) NOT NULL,
	[userLogin] [varchar](30) NOT NULL,
	[userEmail] [varchar](50) NOT NULL,
	[userRight] [varchar](30) NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AUTHOR] ON 

INSERT [dbo].[AUTHOR] ([authorID], [authorName]) VALUES (1, N'J.R.R. Tolkien')
INSERT [dbo].[AUTHOR] ([authorID], [authorName]) VALUES (2, N'A.G')
INSERT [dbo].[AUTHOR] ([authorID], [authorName]) VALUES (3, N'Test')
SET IDENTITY_INSERT [dbo].[AUTHOR] OFF
GO
SET IDENTITY_INSERT [dbo].[BOOK] ON 

INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (11, N'Le Silmarillion', N'Les Premiers Jours du Monde étaient à peine passés quand Fëanor, le plus doué des Elfes, créa les trois Silmarils. Ces bijoux renfermaient la Lumière des Deux Arbres de Valinor. Morgoth, le premier Prince de la Nuit, était encore sur la Terre du Milieu, et il fut fâché d''apprendre que la Lumière allait se perpétuer. Alors il enleva les Silmarils, les fit sertir dans son diadème et garder dans la forteresse d''Angband. Les Elfes prirent les armes pour reprendre les joyaux et ce fut la première de toutes les guerres. Longtemps, longtemps après, lors de la Guerre de l''Anneau, Elrond et Galadriel en parlaient encore.', CAST(N'2003-11-20T13:27:12.063' AS DateTime), 480, 5, 1, N'https://www.babelio.com/couv/CVT_Le-Silmarillion_6780.jpg', N'Français', 3, 1)
INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (12, N'ss', N'efeaf', CAST(N'2024-05-02T00:00:00.000' AS DateTime), 45, 0, 0, N'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1409595968i/929.jpg', N'Japonais', 4, 2)
INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (14, N'test', N'aefaefeaf', CAST(N'2024-05-03T00:00:00.000' AS DateTime), 20, 0, 0, N'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1348264535i/4386485.jpg', N'Français', 4, 1)
INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (17, N'lotr', N'lotr', CAST(N'2024-05-07T00:00:00.000' AS DateTime), 42, 0, 0, N'data:image/jpeg;base64,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', N'Français', 1, 1)
INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (18, N'Tout ce que j''ai à te dire.', N'  “Tout ce que j’ai à te dire.” est un recueil captivant de plus de 150 textes originaux qui explorent les facettes les plus profondes de la vie humaine.  C’est un voyage intime à travers les méandres de l’âme humaine, où l’auteur ouvre son cœur pour partager ses pensées les plus profondes et ses émotions les plus sincères.  À travers des réflexions sur les relations amoureuses et amicales, la santé mentale et le deuil, l’auteur ouvre son cœur pour partager un voyage émotionnel poignant avec les lecteurs.  Chaque texte est une fenêtre ouverte sur les sentiments les plus intimes et les émotions les plus authentiques, offrant une expérience de lecture immersive et révélatrice.  À travers chaque page, l’introspection devient un chemin vers la découverte de soi-même, tandis que l’amour, sous toutes ses formes, est exploré avec une sensibilité poignante.  Les lecteurs sont invités à plonger dans les tréfonds de la santé mentale, où les luttes et les triomphes sont exposés avec une franchise désarmante.  Ce recueil offre un refuge pour ceux qui cherchent à comprendre et à exprimer leurs propres expériences, tout en rappelant la beauté et la complexité de l’humanité.  Que vous soyez en quête de réconfort, de compréhension ou simplement d’une connexion humaine, ce recueil saura vous toucher en plein cœur.', CAST(N'2024-03-12T00:00:00.000' AS DateTime), 171, 0, 0, N'https://m.media-amazon.com/images/I/11hIdI1pyML._SY445_SX342_.jpg', N'Français', 8, 2)
INSERT [dbo].[BOOK] ([bookID], [bookTitle], [bookDescription], [bookPublishDate], [bookPageCount], [bookAverageRating], [bookRatingCount], [bookImageLink], [bookLanguage], [publisherID], [authorID]) VALUES (20, N'ss', N'Voluptatem ea vero r', CAST(N'2024-05-29T12:25:42.717' AS DateTime), 100, 0, 0, N'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019', N'Français', 4, 3)
SET IDENTITY_INSERT [dbo].[BOOK] OFF
GO
SET IDENTITY_INSERT [dbo].[BOOK_CATEGORIES] ON 

INSERT [dbo].[BOOK_CATEGORIES] ([bookCategoID], [bookCategoName], [bookCategoDescription]) VALUES (3, N'Fantasy', N'La fantasy est un genre qui utilise la magie et d''autres formes surnaturelles comme élément principal de l''intrigue, du thème et/ou du cadre.')
INSERT [dbo].[BOOK_CATEGORIES] ([bookCategoID], [bookCategoName], [bookCategoDescription]) VALUES (4, N'Fiction', N'La fiction consiste à raconter des histoires qui ne sont pas réelles. Plus précisément, la fiction est une forme imaginative de narration, l''un des quatre modes rhétoriques fondamentaux.')
INSERT [dbo].[BOOK_CATEGORIES] ([bookCategoID], [bookCategoName], [bookCategoDescription]) VALUES (5, N'Animaux', N'Les animaux sont des organismes eucaryotes multicellulaires appartenant au règne Animalia (également connu sous le nom de Metazoa). Tous les animaux sont mobiles, c''est-à-dire qu''ils peuvent se déplacer spontanément et indépendamment à un moment donné de leur vie. La forme de leur corps se fixe au fur et à mesure de leur développement, bien que certains subissent un processus de métamorphose plus tard dans leur vie. Tous les animaux sont hétérotrophes : ils doivent ingérer d''autres organismes ou leurs produits pour se nourrir.  Traduit avec DeepL.com (version gratuite)')
SET IDENTITY_INSERT [dbo].[BOOK_CATEGORIES] OFF
GO
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (3, 11)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (3, 17)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (3, 18)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (4, 11)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (4, 12)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (4, 20)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (5, 12)
INSERT [dbo].[CATEGORIE_LIST] ([bookCategoID], [bookID]) VALUES (5, 14)
GO
SET IDENTITY_INSERT [dbo].[PUBLISHER] ON 

INSERT [dbo].[PUBLISHER] ([publisherID], [publisherName]) VALUES (1, N'Christian Bourgois')
INSERT [dbo].[PUBLISHER] ([publisherID], [publisherName]) VALUES (2, N'HarperCollins ')
INSERT [dbo].[PUBLISHER] ([publisherID], [publisherName]) VALUES (3, N'Pocket')
INSERT [dbo].[PUBLISHER] ([publisherID], [publisherName]) VALUES (4, N'test')
INSERT [dbo].[PUBLISHER] ([publisherID], [publisherName]) VALUES (8, N'Indépendant')
SET IDENTITY_INSERT [dbo].[PUBLISHER] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 

INSERT [dbo].[USERS] ([userID], [userFirstname], [userLastname], [userPassword], [userLogin], [userEmail], [userRight]) VALUES (2, N'First', N'Last', N'$2a$11$4LnICLVyB.lDPan741uPg.9H46vLpWJVAyEsSIPPtJ/89BLvg8enq', N'log', N'email@gmail.com', N'Super Admin')
INSERT [dbo].[USERS] ([userID], [userFirstname], [userLastname], [userPassword], [userLogin], [userEmail], [userRight]) VALUES (9, N'string', N'string', N'$2a$11$8HbPP1YpMEsQL92aMSW24eXaAHBGZz2yJDEHhfGNMGs42fNt5C13e', N'string', N'string@gmail.com', N'Admin')
INSERT [dbo].[USERS] ([userID], [userFirstname], [userLastname], [userPassword], [userLogin], [userEmail], [userRight]) VALUES (12, N'testb', N'test', N'$2a$11$cIm6CGQmN0W8IUJ9zooGVeFDSxOpQf9hXNwqx4xoPuSiVg//6zx1O', N'test', N'test@test.fr', N'User')
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_AUTHOR0] FOREIGN KEY([authorID])
REFERENCES [dbo].[AUTHOR] ([authorID])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_AUTHOR0]
GO
ALTER TABLE [dbo].[BOOK]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_PUBLISHER] FOREIGN KEY([publisherID])
REFERENCES [dbo].[PUBLISHER] ([publisherID])
GO
ALTER TABLE [dbo].[BOOK] CHECK CONSTRAINT [FK_BOOK_PUBLISHER]
GO
ALTER TABLE [dbo].[BOOK_ACTIONS]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_ACTIONS_BOOK] FOREIGN KEY([bookID])
REFERENCES [dbo].[BOOK] ([bookID])
GO
ALTER TABLE [dbo].[BOOK_ACTIONS] CHECK CONSTRAINT [FK_BOOK_ACTIONS_BOOK]
GO
ALTER TABLE [dbo].[BOOK_ACTIONS]  WITH CHECK ADD  CONSTRAINT [FK_BOOK_ACTIONS_USERS0] FOREIGN KEY([userID])
REFERENCES [dbo].[USERS] ([userID])
GO
ALTER TABLE [dbo].[BOOK_ACTIONS] CHECK CONSTRAINT [FK_BOOK_ACTIONS_USERS0]
GO
ALTER TABLE [dbo].[CATEGORIE_LIST]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIE_LIST_BOOK_CATEGORIES] FOREIGN KEY([bookCategoID])
REFERENCES [dbo].[BOOK_CATEGORIES] ([bookCategoID])
GO
ALTER TABLE [dbo].[CATEGORIE_LIST] CHECK CONSTRAINT [FK_CATEGORIE_LIST_BOOK_CATEGORIES]
GO
ALTER TABLE [dbo].[CATEGORIE_LIST]  WITH CHECK ADD  CONSTRAINT [FK_CATEGORIE_LIST_BOOK0] FOREIGN KEY([bookID])
REFERENCES [dbo].[BOOK] ([bookID])
GO
ALTER TABLE [dbo].[CATEGORIE_LIST] CHECK CONSTRAINT [FK_CATEGORIE_LIST_BOOK0]
GO
ALTER TABLE [dbo].[MODIFY]  WITH CHECK ADD  CONSTRAINT [FK_MODIFY_USERS] FOREIGN KEY([userID])
REFERENCES [dbo].[USERS] ([userID])
GO
ALTER TABLE [dbo].[MODIFY] CHECK CONSTRAINT [FK_MODIFY_USERS]
GO
ALTER TABLE [dbo].[MODIFY]  WITH CHECK ADD  CONSTRAINT [FK_MODIFY_USERS0] FOREIGN KEY([userID_USERS])
REFERENCES [dbo].[USERS] ([userID])
GO
ALTER TABLE [dbo].[MODIFY] CHECK CONSTRAINT [FK_MODIFY_USERS0]
GO
ALTER TABLE [dbo].[READLIST]  WITH CHECK ADD  CONSTRAINT [FK_READLIST_BOOK] FOREIGN KEY([bookID])
REFERENCES [dbo].[BOOK] ([bookID])
GO
ALTER TABLE [dbo].[READLIST] CHECK CONSTRAINT [FK_READLIST_BOOK]
GO
ALTER TABLE [dbo].[READLIST]  WITH CHECK ADD  CONSTRAINT [FK_READLIST_USERS0] FOREIGN KEY([userID])
REFERENCES [dbo].[USERS] ([userID])
GO
ALTER TABLE [dbo].[READLIST] CHECK CONSTRAINT [FK_READLIST_USERS0]
GO
ALTER TABLE [dbo].[USERS]  WITH CHECK ADD  CONSTRAINT [CHK_Users_UserRight] CHECK  (([userRight]='User' OR [userRight]='Admin' OR [userRight]='Super Admin'))
GO
ALTER TABLE [dbo].[USERS] CHECK CONSTRAINT [CHK_Users_UserRight]
GO
USE [BookDB]
GO
ALTER DATABASE [BookDB] SET  READ_WRITE 
GO

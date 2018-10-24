USE MASTER
GO
DROP DATABASE dbTruphox
GO
CREATE DATABASE dbTruphox
GO
USE dbTruphox
GO

-------------------------------- TABLES --------------------------------

CREATE TABLE tbAccount
(
	username VARCHAR(30) PRIMARY KEY,
	userPassword VARCHAR(30),
	email VARCHAR(70),
	firstName VARCHAR(40),
	lastName VARCHAR (40),
	dob DATETIME,
	profileImage VARCHAR(150),
	bio VARCHAR(400),
	joinDate DATETIME,
	active BIT,
	accessLevel INT
)

CREATE TABLE tbFollowing
(
	followID INT IDENTITY (0,1) PRIMARY KEY,
	username VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username),
	followedUser VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username)
)

CREATE TABLE tbBlocked
(
	blockID INT IDENTITY (0,1) PRIMARY KEY,
	username VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username),
	blockedUser VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username),
	blockDate DATETIME
)

CREATE TABLE tbNotification
(
	notificationID INT IDENTITY (0,1) PRIMARY KEY,
	notificationText VARCHAR(100),
	notificationDate DATETIME,
	username VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username)
)

CREATE TABLE tbPost
(
	postID INT IDENTITY(0,1) PRIMARY KEY,
	rating BIT,
	postTitle VARCHAR(50),
	postSubTitle VARCHAR(50),
	postText VARCHAR(800),
	postDate DATETIME,
	lastComment INT,
	username VARCHAR(30)
)

CREATE TABLE tbComment
(
	commentID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	postCommentNumber INT,
	commentText VARCHAR(100),
	commentDate DATETIME,
	username VARCHAR(30)
)

CREATE TABLE tbDeletedComments
(
	commentID INT,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	postCommentNumber INT,
	commentText VARCHAR(100),
	commentDate DATETIME,
	username VARCHAR(30),
	deletedCommentDate DATETIME
)


CREATE TABLE tbLike
(
	likeID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	username VARCHAR(30) FOREIGN KEY REFERENCES tbAccount(username)
)

CREATE TABLE tbTagName
(
	tagID INT IDENTITY (0,1) PRIMARY KEY,
	tagName VARCHAR(30)
)

CREATE TABLE tbPostTag
(
	postTagID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	tagID INT FOREIGN KEY REFERENCES tbTagName(tagID)
)

CREATE TABLE tbWriting
(
	writingID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	writingText VARCHAR(3000)
)

CREATE TABLE tbArt
(
	artID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	artLink VARCHAR(150)
)

CREATE TABLE tbPhotography
(
	photoID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	photoLink VARCHAR(150)
)

CREATE TABLE tbVideo
(
	videoID INT IDENTITY (0,1) PRIMARY KEY,
	postID INT FOREIGN KEY REFERENCES tbPost(postID),
	videoLink VARCHAR(150)
)

Create Table tbPassRecovery
(
	email VARCHAR(60),
	recoveryGuid VARCHAR(300),
	recoveryDate date
)
--CREATE TABLE tbSale
--(
--	saleID INT IDENTITY (0,1) PRIMARY KEY,
--	saleStatus VARCHAR(30)


--CREATE TABLE tbType
--(
--	typeID INT IDENTITY (0,1) PRIMARY KEY,
--	typeName VARCHAR(30)
--)

--CREATE TABLE tbItem
--(
--	itemID INT IDENTITY (0,1) PRIMARY KEY,
--	typeID INT FOREIGN KEY REFERENCES tbType(typeID),
--	itemName VARCHAR(40)
--)

GO
-------------------------------- PROCEDURES --------------------------------

-------------------------------- ACCOUNTS --------------------------------

CREATE PROCEDURE spCreateAccount
(
	@username VARCHAR(30),
	@userPassword VARCHAR(30),
	@email VARCHAR(70),
	@firstName VARCHAR(40),
	@lastName VARCHAR (40),
	@dob DATETIME,
	@bio VARCHAR(400) = null,
	@profileImage VARCHAR(150) = null,
	@active BIT = 1,
	@accessLevel INT = 1
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbAccount WHERE username = @username)
		BEGIN
			SELECT 'User already exists' as MESSAGE
		END
	ELSE
		BEGIN
			INSERT INTO tbAccount (username, userPassword, email, firstName, lastName, dob, bio, profileImage, joinDate, active, accessLevel) VALUES
						(@username, @userPassword, @email, @firstName, @lastName, @dob, @bio, @profileImage, GETDATE(), @active, @accessLevel)
		END
END
GO

CREATE PROCEDURE spReadAccount
(
	@username VARCHAR(30)
)
AS
BEGIN
	SELECT * FROM tbAccount WHERE username = ISNULL (@username, username)
END
GO

CREATE PROCEDURE spUpdateAccount
(
	@username VARCHAR(30),
	@userPassword VARCHAR(30),
	@dob DATETIME,
	@profileImage VARCHAR(150),
	@active BIT
)
AS
BEGIN
	UPDATE tbAccount SET
	username = @username,
	userPassword = @userPassword,
	dob = @dob,
	profileImage = @profileImage,
	active = @active
	WHERE username = @username
END
GO

CREATE PROCEDURE spDisableAccount
(
	@username VARCHAR(30)
)
AS
BEGIN
	UPDATE tbAccount SET
	active = 0
	WHERE username = @username
END
GO

-------------------------------- LOGIN --------------------------------
CREATE PROCEDURE spLogin
(
	@username VARCHAR(30),
	@userPassword VARCHAR(30)
)
AS
BEGIN
   IF EXISTS (SELECT * FROM tbAccount WHERE username = @username and userPassword = @userPassword)
		BEGIN
			SELECT 'valid' as MESSAGE, active, accessLevel, username FROM tbAccount WHERE username = @username and userPassword=@userPassword; 
		END
   ELSE 
        BEGIN 
	        SELECT 'invalid' AS MESSAGE, -1 as active, -1 as accessLevel, '' as username 
	    END 
END
GO

EXEC spLogin @username='CanadaGhost', @userPassword='admin';
GO
-------------------------------- RECOVER --------------------------------

CREATE PROCEDURE spRecoverUsername
(
	@email VARCHAR(60)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbAccount WHERE email = @email)
		BEGIN
			SELECT 'VALID' AS MESSAGE, username
			FROM tbAccount
			WHERE email = @email
		END
END
GO

CREATE PROCEDURE spRecoverPassword
(
	@username VARCHAR(30)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbAccount WHERE username = @username)
		BEGIN
			SELECT 'VALID' AS MESSAGE, userPassword, email
			FROM tbAccount
			WHERE username = @username
		END
END
GO

CREATE PROCEDURE spInsertGuid
(
	@recoveryGuid VARCHAR(300),
	@email VARCHAR(60)
)
AS
BEGIN
	INSERT INTO tbPassRecovery (email, recoveryGuid, recoveryDate) VALUES
								(@email, @recoveryGuid, GETDATE())
END
GO

CREATE PROCEDURE spValidCheck
(
	@recoveryGuid VARCHAR(200)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbPassRecovery WHERE recoveryGuid = @recoveryGuid)
		BEGIN
			SELECT 'VALID' AS MESSAGE, username
			FROM tbAccount a INNER JOIN tbPassRecovery r ON
			a.email = r.email
			WHERE r.recoveryGuid = @recoveryGuid

			DELETE FROM tbPassRecovery
			WHERE recoveryGuid = @recoveryGuid
		END
END
GO

CREATE PROCEDURE spResetPassword
(
	@username VARCHAR(30),
	@userPassword VARCHAR(30)
)
AS
BEGIN
	UPDATE tbAccount SET
	userPassword = @userPassword
	WHERE username = @username
END
GO

-------------------------------- FOLLOWING --------------------------------

CREATE PROCEDURE spCreateFollow
(
	@username VARCHAR(30),
	@followedUser VARCHAR(30)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbBlocked WHERE username = @username AND blockedUser = @followedUser OR username = @followedUser AND blockedUser = @username)
		BEGIN
			SELECT 'User cannot be followed' AS MESSAGE
		END
	ELSE
		BEGIN
			IF EXISTS (SELECT * FROM tbFollowing WHERE username = @username and followedUser = @followedUser)
				BEGIN
					DELETE FROM tbFollowing WHERE username = @username and followedUser = @followedUser
				END
			ELSE
				BEGIN
					INSERT INTO tbFollowing (username, followedUser) VALUES
											(@username, @followedUser)
				END
		END
END
GO

CREATE PROCEDURE spReadFollow
(
	@username VARCHAR(30) = null,
	@followedUser VARCHAR(30) = null
)
AS
BEGIN
	IF (@username IS NOT NULL and @followedUser IS NULL)
		BEGIN
			SELECT * FROM tbFollowing WHERE username = @username
		END
	ELSE IF (@followedUser IS NOT NULL and @username IS NULL)
		BEGIN
			SELECT * FROM tbFollowing WHERE followedUser = @followedUser
		END
	ELSE
		BEGIN
			SELECT 'Must provide only username or followedUser' as MESSAGE
		END
END
GO	

-------------------------------- BLOCKED --------------------------------

CREATE PROCEDURE spCreateBlock
(
	@username VARCHAR(30),
	@blockedUser VARCHAR(30),
	@blockDate DATETIME = null
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbBlocked WHERE username = @username and blockedUser = @blockedUser)
		BEGIN
			DELETE FROM tbBlocked WHERE username = @username and blockedUser = @blockedUser
		END
	ELSE
		BEGIN
			INSERT INTO tbBlocked(username, blockedUser, blockDate) VALUES
						(@username, @blockedUser, GETDATE())
		END
END
GO

CREATE PROCEDURE spReadBlock
(
	@username VARCHAR(30) = null,
	@blockedUser VARCHAR(30)
)
AS
BEGIN
	IF (@username IS NOT NULL and @blockedUser IS NULL)
		BEGIN
			SELECT * FROM tbBlocked WHERE username = @username
		END
	ELSE IF (@blockedUser IS NOT NULL and @username IS NULL)
		BEGIN
			SELECT * FROM tbBlocked WHERE blockedUser = @blockedUser
		END
	ELSE
		BEGIN
			SELECT 'Must provide only username or blockedUser' as MESSAGE
		END
END
GO

-------------------------------- Notification --------------------------------

CREATE PROCEDURE spCreateNotification
(
	@notificationText VARCHAR(100),
	@notificationDate DATETIME,
	@username VARCHAR(30)
)
AS
BEGIN
	INSERT INTO tbNotifications (notificationText, notificationDate, username) VALUES (@notificationText, GETDATE(), @username)
END
GO

CREATE PROCEDURE spReadNotification
(
	@username VARCHAR(30)
)
AS
BEGIN
	SELECT * FROM tbNotification WHERE username = ISNULL (@username, username)
END
GO

CREATE PROCEDURE spUpdateNotification
(
	@notificationID INT,
	@notificationText VARCHAR(100),
	@notificationDate DATETIME,
	@username VARCHAR(30)
)
AS
BEGIN
	UPDATE tbNotification SET
	notificationText = @notificationText,
	notificationDate = @notificationDate,
	username = @username
	WHERE notificationID = @notificationID
END
GO

CREATE PROCEDURE spDeleteNotification
(
	@notificationID INT
)
AS
BEGIN
	DELETE FROM tbNotification WHERE notificationID = @notificationID
END
GO

-------------------------------- POST --------------------------------

--CREATE PROCEDURE spCreatePost
--(
--	@rating BIT,
--	@postText VARCHAR(800),
--	@postDate DATETIME,
--	@postTitle VARCHAR(50),
--	@postSubTitle VARCHAR(50),
--	@lastComment INT,
--	@username VARCHAR(30)
--)
--AS
--BEGIN
--	INSERT INTO tbPost (rating, postText, postDate, postTitle, postSubTitle, lastComment, username) VALUES
--					(@rating, @postText, GETDATE(), @postTitle, @postSubTitle, @lastComment, @username)
--END
--GO

CREATE PROCEDURE spReadPost
(
	@postID INT
)
AS
BEGIN
	SELECT * FROM tbPost WHERE postID = ISNULL (@postID, postID)
END
GO

CREATE PROCEDURE spUpdatePost
(
	@postID INT,
	@rating BIT,
	@postText VARCHAR(200),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@postDate DATETIME,
	@lastComment INT,
	@username VARCHAR(30)
)
AS
BEGIN
	UPDATE tbPost SET
	rating = @rating,
	postText = @postText,
	postDate = @postDate,
	postTitle = @postTitle,
	postSubtitle = @postSubTitle,
	lastComment = @lastComment,
	username = @username
	WHERE postID = @postID
END
GO

--CREATE PROCEDURE spDeletePost
--(
--	@postID INT
--)
--AS
--BEGIN
--	DELETE FROM tbPost WHERE postID = @postID
--END
--GO

-------------------------------- COMMENT --------------------------------

CREATE PROCEDURE spCreateComment
(
	@postID INT,
	@postCommentNumber INT,
	@commentText VARCHAR(100),
	@username VARCHAR(30)
)
AS
BEGIN
	INSERT INTO tbComment (postID, postCommentNumber, commentText, commentDate, username) VALUES
						(@postID, @postCommentNumber, @commentText, GETDATE(), @username)

	UPDATE tbPost SET
	lastComment = @postCommentNumber
	WHERE postID = @postID
END
GO

CREATE PROCEDURE spReadComment
(
	@postID INT
)
AS
BEGIN
	SELECT * FROM tbComment WHERE postID = ISNULL (@postID, postID)
END
GO

CREATE PROCEDURE spUpdateComment
(
	@commentID INT,	
	@commentText VARCHAR(100)	
)
AS
BEGIN
	UPDATE tbComment SET
	commentText = @commentText
	WHERE commentID = @commentID
END
GO

CREATE PROCEDURE spDeleteComment
(
	@commentID INT
)	
AS
BEGIN
	INSERT INTO tbDeletedComments (commentID, postID, postCommentNumber, commentText, commentDate, username)
	SELECT commentID, postID, postCommentNumber, commentText, commentDate, username
	FROM tbComment
	WHERE commentID = @commentID
	
	UPDATE tbDeletedComments SET
	deletedCommentDate = GETDATE()
	WHERE commentID = @commentID

	DELETE FROM tbComment WHERE commentID = @commentID
END
GO

CREATE PROCEDURE spReadDeletedComments
(
	@commentID INT = null
)
AS
BEGIN
	SELECT * FROM tbDeletedComments WHERE commentID = ISNULL (@commentID, commentID)
END
GO

CREATE PROCEDURE spClearDeletedComments
(
	@deletedDate DATETIME
)
AS
BEGIN
	DELETE FROM tbDeletedComments WHERE deletedCommentDate < @deletedDate
END
GO

-------------------------------- LIKE --------------------------------

CREATE PROCEDURE spCreateLike
(
	@postID INT,
	@username VARCHAR(30)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbLike WHERE username = @username and postID = @postID)
				BEGIN
					DELETE FROM tbLike WHERE username = @username and postID = @postID
				END
			ELSE
				BEGIN				
					INSERT INTO tbLike (postID, username) VALUES
									(@postID, @username)
				END
END
GO

CREATE PROCEDURE spReadLike
(
	@postID INT
)
AS
BEGIN
	SELECT * FROM tbLike WHERE postID = ISNULL (@postID, postID)
END
GO


-------------------------------- TAGS --------------------------------

CREATE PROCEDURE spCreateTag
(
	@tagName VARCHAR(30)
)
AS
BEGIN
		IF EXISTS (SELECT * FROM tbTagName WHERE tagName = @tagName)
			BEGIN
				SELECT 'Tag Already Exists' AS MESSAGE
			END
		ELSE
			BEGIN				
				INSERT INTO tbTagName(tagName) VALUES
									(@tagName)
			END	
END
GO

CREATE PROCEDURE spReadTag
(
	@tagID INT
)
AS
BEGIN
	SELECT * FROM tbTagName WHERE tagID = ISNULL (@tagID, tagID)
END
GO

CREATE PROCEDURE spDeleteTag
(
	@tagID INT
)
AS
BEGIN
	DELETE FROM tbTagName WHERE tagID = @tagID
END
GO

-------------------------------- POST TAGS --------------------------------

CREATE PROCEDURE spCreatePostTag
(
	@postID INT,
	@tagName VARCHAR(30),
	@tagID INT
)
AS
BEGIN
	IF EXISTS (SELECT * FROM tbTagName WHERE tagName = @tagName)
		BEGIN
			INSERT INTO tbPostTag (postID, tagID) VALUES
								(@postID, @tagID)
		END
	ELSE
		BEGIN				
			INSERT INTO tbTagName(tagName) VALUES
								(@tagName)
			INSERT INTO tbPostTag (postID, tagID) VALUES
								(@postID, @@IDENTITY)
		END	
END
GO

CREATE PROCEDURE spReadPostTag
(
	@postTagID INT
)
AS
BEGIN
	SELECT * FROM tbPostTag WHERE postTagID = ISNULL (@postTagID, postTagID)
END
GO

CREATE PROCEDURE spDeletePostTag
(
	@postTagID INT
)
AS
BEGIN
	DELETE FROM tbPostTag WHERE postTagID = @postTagID
END
GO

-------------------------------- WRITING --------------------------------

CREATE PROCEDURE spCreateWriting
(
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubtitle VARCHAR(50),
	@username VARCHAR(30),
	@writingText VARCHAR(3000)
)
AS
BEGIN
	INSERT INTO tbPost (rating, postText, postDate, postTitle, postSubtitle, username) VALUES
					(@rating, @postText, GETDATE(), @postTitle, @postSubtitle, @username)
	INSERT INTO tbWriting (writingText, postID) VALUES
					(@writingText, @@IDENTITY)
END
GO

CREATE PROCEDURE spReadWriting
(
	@postID INT=NULL
)
AS
BEGIN
	SELECT p.postTitle, p.postSubTitle, w.writingText
	FROM tbPost p INNER JOIN tbWriting w ON
	p.postID = w.postID
END
GO

CREATE PROCEDURE spUpdateWriting
(
	@postID INT,
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@writingText VARCHAR(3000)
)
AS
BEGIN
	UPDATE tbPost SET
	rating = @rating,
	postText = @postText,
	postTitle = @postTitle,
	postSubtitle = @postSubTitle,
	username = @username
	WHERE postID = @postID

	UPDATE tbWriting SET
	writingText = @writingText
	WHERE postID = @postID
END
GO

CREATE PROCEDURE spDeleteWriting
(
	@postID INT
)
AS
BEGIN
	DELETE FROM tbComment WHERE postID = @postID
	DELETE FROM tbDeletedComments WHERE postID = @postID
	DELETE FROM tbLike WHERE postID = @postID
	DELETE FROM tbPostTag WHERE postID = @postID
	DELETE FROM tbWriting WHERE postID = @postID
	DELETE FROM tbPost WHERE postID = @postID
END
GO

-------------------------------- ART --------------------------------
	
CREATE PROCEDURE spCreateArt
(
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@artLink VARCHAR(150)
)
AS
BEGIN
	INSERT INTO tbPost (rating, postText, postDate, postTitle, postSubTitle, username) VALUES
					(@rating, @postText, GETDATE(),@postTitle, @postSubTitle, @username)
	INSERT INTO tbArt (postID, artLink) VALUES
					(@@IDENTITY, @artLink)
END
GO

CREATE PROCEDURE spReadArt
(
	@postID INT=NULL
)
AS
BEGIN
	SELECT a.postID as 'postID', './Images/' + artLink  as 'artLink', postTitle, postSubTitle
	FROM tbPost p INNER JOIN tbArt a ON
	p.postID = a.postID
	WHERE a.postID = ISNULL(@postID, a.postID);
END
GO


CREATE PROCEDURE spUpdateArt
(
	@postID INT,
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@artLink VARCHAR(150)
)
AS
BEGIN
	UPDATE tbPost SET
	rating = @rating,
	postText = @postText,
	postTitle = @postTitle,
	postSubtitle = @postSubTitle,
	username = @username
	WHERE postID = @postID

	UPDATE tbArt SET
	artLink = @artLink
	WHERE postID = @postID
END
GO

CREATE PROCEDURE spDeleteArt
(
	@postID INT
)
AS
BEGIN
	DELETE FROM tbComment WHERE postID = @postID
	DELETE FROM tbDeletedComments WHERE postID = @postID
	DELETE FROM tbLike WHERE postID = @postID
	DELETE FROM tbPostTag WHERE postID = @postID
	DELETE FROM tbArt WHERE postID = @postID
	DELETE FROM tbPost WHERE postID = @postID
END
GO

-------------------------------- PHOTOGRAPHY --------------------------------

CREATE PROCEDURE spCreatePhotography
(
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@photoLink VARCHAR(150)

)
AS
BEGIN
	INSERT INTO tbPost (rating, postText, postDate, postTitle, postSubTitle, username) VALUES
					(@rating, @postText, GETDATE(), @postTitle, @postSubTitle,  @username)
	INSERT INTO tbPhotography (postID, photoLink) VALUES
					(@@IDENTITY, @photoLink)
END
GO

CREATE PROCEDURE spReadPhotography
(
	@postID INT=NULL
)
AS
BEGIN
	SELECT * FROM tbPost WHERE postID = ISNULL(@postID, postID);
	SELECT * FROM tbPhotography WHERE postID = ISNULL(@postID, postID);
END
GO

CREATE PROCEDURE spUpdatePhotography
(
	@postID INT,
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@photoLink VARCHAR(150)
)
AS
BEGIN
	UPDATE tbPost SET
	rating = @rating,
	postText = @postText,
	postTitle = @postTitle,
	postSubtitle = @postSubTitle,
	username = @username
	WHERE postID = @postID

	UPDATE tbPhotography SET
	photoLink = @photoLink
	WHERE postID = @postID
END
GO

CREATE PROCEDURE spDeletePhotography
(
	@postID INT
)
AS
BEGIN
	DELETE FROM tbComment WHERE postID = @postID
	DELETE FROM tbDeletedComments WHERE postID = @postID
	DELETE FROM tbLike WHERE postID = @postID
	DELETE FROM tbPostTag WHERE postID = @postID
	DELETE FROM tbPhotography WHERE postID = @postID
	DELETE FROM tbPost WHERE postID = @postID
END
GO

-------------------------------- VIDEO --------------------------------

CREATE PROCEDURE spCreateVideo
(
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@videoLink VARCHAR(150)
)
AS
BEGIN
	INSERT INTO tbPost (rating, postText, postDate, postTitle, postSubTitle, username) VALUES
					(@rating, @postText, GETDATE(), @postTitle, @postSubTitle, @username)
	INSERT INTO tbVideo (postID, videoLink) VALUES
					(@@IDENTITY, @videoLink)
END
GO

CREATE PROCEDURE spReadVideo
(
	@postID INT=NULL
)
AS
BEGIN
	SELECT * FROM tbPost WHERE postID = ISNULL(@postID, postID);
	SELECT * FROM tbVideo WHERE postID = ISNULL(@postID, postID);
END
GO

CREATE PROCEDURE spUpdateVideo
(
	@postID INT,
	@rating BIT,
	@postText VARCHAR(800),
	@postTitle VARCHAR(50),
	@postSubTitle VARCHAR(50),
	@username VARCHAR(30),
	@videoLink VARCHAR(150)
)
AS
BEGIN
	UPDATE tbPost SET
	rating = @rating,
	postText = @postText,
	postTitle = @postTitle,
	postSubtitle = @postSubTitle,
	username = @username
	WHERE postID = @postID

	UPDATE tbVideo SET
	videoLink = @videoLink
	WHERE postID = @postID
END
GO

CREATE PROCEDURE spDeleteVideo
(
	@postID INT
)
AS
BEGIN
	DELETE FROM tbComment WHERE postID = @postID
	DELETE FROM tbDeletedComments WHERE postID = @postID
	DELETE FROM tbLike WHERE postID = @postID
	DELETE FROM tbPostTag WHERE postID = @postID
	DELETE FROM tbVideo WHERE postID = @postID
	DELETE FROM tbPost WHERE postID = @postID
END
GO

-------------------------------- USERS CREATED --------------------------------

EXEC spCreateAccount @username='wrenjay', @userPassword='admin', @email='wrenjaymes@gmail.com', @firstName='Wren', @lastName='Jaymes', @dob='1997-07-08', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg', @bio='One of the geeky nerds running this website.', @active='1', @accessLevel='0';
EXEC spCreateAccount @username='CanadaGhost', @userPassword='admin', @email='dcourcelles7@gmail.com', @firstName='Dan', @lastName='Courcelles', @dob='1990-09-07', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg', @bio='',  @active='1', @accessLevel='0';
EXEC spCreateAccount @username='Truphox', @userPassword='admin', @email='truphox@gmail.com', @firstName='TruPhox', @lastName='Admin', @dob='', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg',  @bio='', @active='1', @accessLevel='0';
EXEC spCreateAccount @username='GigglesMcklown', @userPassword='password', @email='', @firstName='Alex', @lastName='Chartier', @dob='', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg',  @bio='', @active='1', @accessLevel='1';
EXEC spCreateAccount @username='Stranger', @userPassword='password', @email='email@gmail.com', @firstName='Person', @lastName='PersonLast', @dob='1999-11-28', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg',  @bio='', @active='1', @accessLevel='1';
EXEC spCreateAccount @username='Person', @userPassword='password', @email='email2@gmail.com', @firstName='Person', @lastName='Person', @dob='1989-01-24', @profileImage='C:\Users\WrenJ\Source\Repos\GroupProj3\TruphoxGP\TruphoxGP\Images\profilePict.jpg',  @bio='', @active='1', @accessLevel='1';

SELECT * FROM tbAccount
GO

---------------------POSTS CREATED (WRITTING) -------------------

EXEC spCreateWriting @rating=0, @postText='', @postTitle='WELCOME', @postSubTitle='', @username='Truphox', @writingText='IT HAS FINIALLY ARIVVED! This is the offical launch of TruPhox, the website built  for even the most novice of artists, videographers and poets. Post your creavity, like and share other ones and join the community that will accept you where ever you are.';
EXEC spCreateWriting @rating=0, @postText='', @postTitle='Albert Einstein', @postSubTitle='Quotes', @username='wrenjay', @writingText='Two things are infinite: the universe and human stupidity; and I''m not sure about the universe';
EXEC spCreateWriting @rating=0, @postText='', @postTitle='The Four Loves', @postSubTitle='C.S. Lewis', @username='wrenjay', @writingText='To love at all is to be vulnerable. Love anything and your heart will be wrung and possibly broken. If you want to make sure of keeping it intact you must give it to no one, not even an animal. Wrap it carefully round with hobbies and little luxuries; avoid all entanglements. Lock it up safe in the casket or coffin of your selfishness. But in that casket, safe, dark, motionless, airless, it will change. It will not be broken; it will become unbreakable, impenetrable, irredeemable. To love is to be vulnerabe.';
EXEC spCreateWriting @rating=0, @postText='', @postTitle='', @postSubTitle='', @username='CanadaGhost' , @writingText='I''M TINY RICK!!';
EXEC spCreateWriting @rating=0, @postText='', @postTitle='', @postSubTitle='', @username='Person', @writingText='I have decied that if I spent my whole life believing I am something, I will amount to nothing. But if I believe I am nothing I will amount to nothing. Either way you cannot win...';
EXEC spCreateWriting @rating=0, @postText='', @postTitle='', @postSubTitle='', @username='Person', @writingText='Nobody exists on purpose. Nobody belongs anywhere. We''re all going to die. Come watch TV.';
GO

------------------POSTS CREATED (ART) -------------------

EXEC spCreateArt @rating=0, @postText='', @postTitle='Dragon', @postSubTitle='', @username='wrenjay', @artLink='dragon.png'; 
EXEC spCreateArt @rating=1, @postText='', @postTitle='Truphox', @postSubTitle='', @username='Truphox', @artLink='GP-Logo.png'; 
EXEC spCreateArt @rating=0, @postText='', @postTitle='Space', @postSubTitle='Inktober promt day 17', @username='wrenjay', @artLink='Astro.jpg';
EXEC spCreateArt @rating=0, @postText='', @postTitle='Dragon', @postSubTitle='', @username='wrenjay', @artLink='Dragon.jpg'; 
EXEC spCreateArt @rating=0, @postText='', @postTitle='Rick and Morty', @postSubTitle='Harry Potter', @username='CanadaGhost', @artLink='RickMortyHP.jpg'; 

------------------POSTS CREATED (VIDEO) -------------------

--EXEC spCreatePost @rating=0, @postText='', @postDate='', @lastComment=3, @username='';
--EXEC spCreatePost @rating=0, @postText='', @postDate='', @lastComment=3, @username='';
--EXEC spCreatePost @rating=0, @postText='', @postDate='', @lastComment=3, @username='';
--EXEC spCreatePost @rating=0, @postText='', @postDate='', @lastComment=3, @username='';
--EXEC spCreatePost @rating=0, @postText='', @postDate='', @lastComment=3, @username='';
GO
------------------POSTS CREATED (PHOTOGRAPHY) -------------------

EXEC spCreatePhotography @rating=0, @postText='', @postTitle='Debby', @postSubTitle='Crazy cat lady life', @username='wrenjay', @photoLink='Debby.jpg';
EXEC spCreatePhotography @rating=0, @postText='', @postTitle='Pumkin #1', @postSubTitle='KCarvings', @username='wrenjay', @photoLink='pumkinK.jpg';
EXEC spCreatePhotography @rating=0, @postText='', @postTitle='Pumkin #2', @postSubTitle='DCarvings', @username='CanadaGhost', @photoLink='PumkinD.jpg';
EXEC  spCreatePhotography @rating=0, @postText='', @postTitle='Ruka', @postSubTitle='My canine.', @username='wrenjay', @photoLink='Ruka.jpg';
EXEC  spCreatePhotography @rating=0, @postText='', @postTitle='', @postSubTitle='', @username='CanadaGhost', @photoLink='Sky.jpg';
GO

EXEC spCreateComment @postID=7, @postCommentNumber=0, @commentText='Cool logo!', @username='CanadaGhost';
EXEC spCreateComment @postID=7, @postCommentNumber=1, @commentText='We thought so!', @username='Truphox';
EXEC spCreateComment @postID=7, @postCommentNumber=2, @commentText='Drew it myself!', @username='wrenjay';
EXEC spCreateComment @postID=7, @postCommentNumber=3, @commentText='I am person.', @username='Person';
EXEC spCreateComment @postID=7, @postCommentNumber=4, @commentText='Truphox da best #truphox', @username='CanadaGhost';
GO

SELECT * FROM tbPhotography
SELECT * FROM tbArt
SELECT * FROM tbWriting
SELECT * FROM tbVideo
SELECT * FROM tbComment
GO

------------------RECENTLY ADDED... PROFILE--------------------

CREATE PROCEDURE spRecentlyAdded
(
@postID INT=NULL,
@username VARCHAR(30)
)
AS
BEGIN
	SELECT TOP 10  * FROM tbPost  
	WHERE username = @username 
	ORDER BY  postDate DESC
END
GO

EXEC spRecentlyAdded @username='wrenjay'
GO

------------------USER ART -------------------

CREATE PROCEDURE spReadUserArt
(
@postID INT=NULL,
@username VARCHAR(30)
)
AS
BEGIN
	SELECT a.postID as 'postID', './Images/' + artLink  as 'artLink', postTitle, postSubTitle FROM tbPost p INNER JOIN tbArt a ON 
	a.postID = p.postID
	WHERE username = @username 
	ORDER BY  postDate ASC
END
GO

EXEC spReadUserArt @username='wrenjay'
GO

------------------USER PHOTOGRAPHY -------------------

CREATE PROCEDURE spReadUserPhotography
(
@postID INT=NULL,
@username VARCHAR(30)
)
AS
BEGIN
	SELECT p.postID as 'postID', './Images/' + photoLink  as 'photoLink', postTitle, postSubTitle 
	FROM tbPost p INNER JOIN tbPhotography ph ON 
	ph.postID = p.postID
	WHERE username = @username 
	ORDER BY  postDate ASC
END
GO

EXEC spReadUserPhotography @username='wrenjay'
GO

------------------USER VIDEOS -------------------

CREATE PROCEDURE spReadUserVideo
(
@postID INT=NULL,
@username VARCHAR(30)
)
AS
BEGIN
	SELECT  * FROM tbPost p INNER JOIN tbVideo v ON 
	v.postID = p.postID
	WHERE username = @username 
	ORDER BY  postDate ASC
END
GO

EXEC spReadUserVideo @username='wrenjay'
GO

------------------USER WRITING -------------------

CREATE PROCEDURE spReadUserWriting
(
@postID INT=NULL,
@username VARCHAR(30)
)
AS
BEGIN
	SELECT  * FROM tbPost p INNER JOIN tbWriting w ON 
	w.postID = p.postID
	WHERE username = @username 
	ORDER BY  postDate ASC
END
GO

EXEC spReadUserWriting @username='wrenjay'
GO

------------------SEARCH PROC -------------------

CREATE PROCEDURE spSearch
(
 @input VARCHAR (150)=NULL
)
AS
BEGIN
		SELECT postTitle, postSubTitle, postText from tbPost  p INNER JOIN tbArt a ON 
	     a.postID = p.postID
         INNER JOIN tbWriting w ON 
	     w.postID = p.postID 
		 INNER JOIN tbPhotography ph ON 
	   	 ph.postID = p.postID 
	     INNER JOIN tbVideo v ON 
	     v.postID = p.postID
	WHERE postTitle  like '%' + trim(@input) + '%'
END
GO

EXEC spSearch 
GO
-- Alter Commands

-- These are the commands you can use to quickly add FKs and PKs to your tables

ALTER TABLE Comments 
ADD CONSTRAINT FK_Posts_Comments FOREIGN KEY (PostId) REFERENCES Posts (Id)
GO
ALTER TABLE Comments  
ADD CONSTRAINT FK_Users_Comments FOREIGN KEY (UserId) REFERENCES Users (Id)
GO
ALTER TABLE PostHistory  
ADD CONSTRAINT FK_Posts_PostHistory FOREIGN KEY (PostId) REFERENCES Posts (Id)
GO
ALTER TABLE PostHistory  
ADD CONSTRAINT FK_Users_PostHistory FOREIGN KEY (UserId) REFERENCES Users (Id)
GO
ALTER TABLE PostLinks  
ADD CONSTRAINT FK_Posts_PostLinks FOREIGN KEY (PostId) REFERENCES Posts (Id)
GO
ALTER TABLE PostLinks  
ADD CONSTRAINT FK_RelatedPosts_PostLinks FOREIGN KEY (RelatedPostId) REFERENCES Posts (Id)
GO
ALTER TABLE PostTags  
ADD CONSTRAINT FK_Posts_PostTags FOREIGN KEY (PostId) REFERENCES Posts (Id)
GO
ALTER TABLE PostTags  
ADD CONSTRAINT FK_Tags_PostTags FOREIGN KEY (TagId) REFERENCES Tags (Id)
GO
ALTER TABLE PostTags  
ADD CONSTRAINT PK_Tags_Posts_Id PRIMARY KEY (PostId, TagId)
GO
ALTER TABLE UserBadges
ADD CONSTRAINT FK_UserBadges_Badges FOREIGN KEY (BadgesId) REFERENCES Badges(Id)
GO
ALTER TABLE UserBadges
ADD CONSTRAINT FK_UserBadges_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
GO
ALTER TABLE Votes  
ADD CONSTRAINT FK_Posts_Votes FOREIGN KEY (PostId) REFERENCES Posts (Id)
GO
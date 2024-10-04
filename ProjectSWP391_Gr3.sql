USE [SWP391_G3_Project]
GO
/****** Object:  Table [dbo].[AuctionLogs]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[LogTime] [datetime] NULL,
	[Action] [nvarchar](255) NOT NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auctions]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auctions](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[LandLotID] [int] NULL,
	[AuctioneerID] [int] NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[WinnerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[BidID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[BidderID] [int] NULL,
	[BidAmount] [decimal](18, 2) NOT NULL,
	[BidTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLotImages]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLotImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[LandLotID] [int] NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[UploadedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLots]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLots](
	[LandLotID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Area] [decimal](10, 2) NOT NULL,
	[ZoningInfo] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[StartingPrice] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime] NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LandLotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLotZoning]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLotZoning](
	[LandLotID] [int] NOT NULL,
	[ZoningID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LandLotID] ASC,
	[ZoningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[WinnerID] [int] NULL,
	[AmountPaid] [decimal](18, 2) NOT NULL,
	[PaymentDate] [datetime] NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NULL,
	[phone] [nvarchar](15) NULL,
	[role] [nvarchar](20) NOT NULL,
	[address] [nvarchar](255) NULL,
	[createdAt] [date] NULL,
 CONSTRAINT [PK__Users__1788CCAC2F46775C] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Users__A9D1053448EC0EDA] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Users__A9D105345456D579] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZoningTypes]    Script Date: 10/4/2024 9:37:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ZoningTypes](
	[ZoningID] [int] IDENTITY(1,1) NOT NULL,
	[ZoningCode] [nvarchar](50) NOT NULL,
	[ZoningDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ZoningID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuctionLogs] ADD  DEFAULT (getdate()) FOR [LogTime]
GO
ALTER TABLE [dbo].[Bids] ADD  DEFAULT (getdate()) FOR [BidTime]
GO
ALTER TABLE [dbo].[LandLotImages] ADD  DEFAULT (getdate()) FOR [UploadedAt]
GO
ALTER TABLE [dbo].[LandLots] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreatedAt__38996AB5]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD  CONSTRAINT [FK__AuctionLo__UserI__52593CB8] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[AuctionLogs] CHECK CONSTRAINT [FK__AuctionLo__UserI__52593CB8]
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD  CONSTRAINT [FK__AuctionLo__UserI__778AC167] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[AuctionLogs] CHECK CONSTRAINT [FK__AuctionLo__UserI__778AC167]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__Auctio__412EB0B6] FOREIGN KEY([AuctioneerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__Auctio__412EB0B6]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__Auctio__787EE5A0] FOREIGN KEY([AuctioneerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__Auctio__787EE5A0]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__Winner__4316F928] FOREIGN KEY([WinnerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__Winner__4316F928]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__Winner__7A672E12] FOREIGN KEY([WinnerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__Winner__7A672E12]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK__Bids__BidderID__46E78A0C] FOREIGN KEY([BidderID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK__Bids__BidderID__46E78A0C]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK__Bids__BidderID__7C4F7684] FOREIGN KEY([BidderID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK__Bids__BidderID__7C4F7684]
GO
ALTER TABLE [dbo].[LandLotImages]  WITH CHECK ADD FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[LandLots]  WITH CHECK ADD  CONSTRAINT [FK__LandLots__Seller__3B75D760] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[LandLots] CHECK CONSTRAINT [FK__LandLots__Seller__3B75D760]
GO
ALTER TABLE [dbo].[LandLots]  WITH CHECK ADD  CONSTRAINT [FK__LandLots__Seller__7D439ABD] FOREIGN KEY([SellerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[LandLots] CHECK CONSTRAINT [FK__LandLots__Seller__7D439ABD]
GO
ALTER TABLE [dbo].[LandLotZoning]  WITH CHECK ADD FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[LandLotZoning]  WITH CHECK ADD FOREIGN KEY([ZoningID])
REFERENCES [dbo].[ZoningTypes] ([ZoningID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__Winner__4BAC3F29] FOREIGN KEY([WinnerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__Winner__4BAC3F29]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__Winner__7F2BE32F] FOREIGN KEY([WinnerID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__Winner__7F2BE32F]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__UserI__01142BA1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__UserI__01142BA1]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK__UserRoles__UserI__571DF1D5] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK__UserRoles__UserI__571DF1D5]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Ongoing'))
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Ongoing'))
GO
ALTER TABLE [dbo].[LandLots]  WITH CHECK ADD CHECK  (([Status]='Sold' OR [Status]='Available'))
GO
ALTER TABLE [dbo].[LandLots]  WITH CHECK ADD CHECK  (([Status]='Sold' OR [Status]='Available'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO

USE [SWP391_G3_Project]
GO
/****** Object:  Table [dbo].[AuctionLogs]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionLogs](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[LogTime] [date] NULL,
	[Action] [nvarchar](255) NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__AuctionL__5E5499A81D507B3B] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auctions]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auctions](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[LandLotID] [int] NULL,
	[AuctioneerID] [int] NULL,
	[StartTime] [date] NOT NULL,
	[EndTime] [date] NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[WinnerID] [int] NULL,
 CONSTRAINT [PK__Auctions__51004A2C3292C352] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[BidID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[BidderID] [int] NULL,
	[BidAmount] [decimal](18, 2) NOT NULL,
	[BidTime] [date] NULL,
 CONSTRAINT [PK__Bids__4A733DB27AE7C68C] PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLotImages]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLotImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[LandLotID] [int] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[UploadedAt] [date] NULL,
 CONSTRAINT [PK__LandLotI__7516F4EC42B011FA] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLots]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLots](
	[LandLotID] [int] IDENTITY(1,1) NOT NULL,
	[SellerID] [int] NULL,
	[LandLotName] [nvarchar](max) NULL,
	[Location] [nvarchar](max) NOT NULL,
	[Area] [decimal](10, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartingPrice] [decimal](18, 2) NOT NULL,
	[CreatedAt] [date] NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__LandLots__A8EEA4F92DD573A9] PRIMARY KEY CLUSTERED 
(
	[LandLotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLotZoning]    Script Date: 10/14/2024 3:43:58 PM ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 10/14/2024 3:43:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[WinnerID] [int] NULL,
	[AmountPaid] [decimal](18, 2) NOT NULL,
	[PaymentDate] [date] NULL,
	[Status] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK__Payments__9B556A58B4076BBF] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/14/2024 3:43:58 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 10/14/2024 3:43:58 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ZoningTypes]    Script Date: 10/14/2024 3:43:58 PM ******/
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
SET IDENTITY_INSERT [dbo].[LandLotImages] ON 

INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (36, 26, N'images/240_F_764015938_ZRfwMDKHSK9UBGrMuwWMzfNszR2nJL2b.jpg', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (37, 27, N'images/240_F_818184140_ImF8oZ1tQaMJBuyvNtN37YbNT4sRiyig.jpg', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (38, 27, N'images/240_F_829644377_IOEBI81IH41x6jtBvCWTG1yGIAPTFD8Y.jpg', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (39, 27, N'images/240_F_846610865_D3uC68WS8Z2XV0Sl3W1cxzy4bTTw0I1r.jpg', CAST(N'2024-10-08' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (40, 28, N'images/240_F_487560514_FPJMYvoL7mTOaGIzw8tnSODDZgfJObsv.jpg', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (41, 28, N'images/240_F_565170621_N0Tt27IqvLAbWrbjgLpBvk9xtrGx8nof.jpg', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (42, 28, N'images/240_F_829644377_IOEBI81IH41x6jtBvCWTG1yGIAPTFD8Y.jpg', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (46, 30, N'images/240_F_230550944_jo8RNm3Y9d1DsIbaGO7u7xgkvj4oiVRH.jpg', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (47, 30, N'images/240_F_538947521_xL7iTSDJg5apvSf7BtrS11dOu4ff3TvX.jpg', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (48, 30, N'images/240_F_565170621_N0Tt27IqvLAbWrbjgLpBvk9xtrGx8nof.jpg', CAST(N'2024-10-12' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (49, 31, N'images/240_F_535503848_8CPJTV2aALt3urNrDfZphQXPdk1Vl1Zr.jpg', CAST(N'2024-10-14' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (50, 31, N'images/240_F_543115448_3keovu8ejvVODxklaJZtoIn0xwuwN0Uq.jpg', CAST(N'2024-10-14' AS Date))
INSERT [dbo].[LandLotImages] ([ImageID], [LandLotID], [ImageURL], [UploadedAt]) VALUES (51, 31, N'images/240_F_487560514_FPJMYvoL7mTOaGIzw8tnSODDZgfJObsv.jpg', CAST(N'2024-10-14' AS Date))
SET IDENTITY_INSERT [dbo].[LandLotImages] OFF
GO
SET IDENTITY_INSERT [dbo].[LandLots] ON 

INSERT [dbo].[LandLots] ([LandLotID], [SellerID], [LandLotName], [Location], [Area], [Description], [StartingPrice], [CreatedAt], [Status]) VALUES (26, 2, N'my land', N'Hòa Lạc', CAST(500.00 AS Decimal(10, 2)), N'Địa hình ở đây bằng phẳng, rải rác có nhiều cồn cát xen kẽ với ruộng vườn, không có rừng cây lớn, bốn bề sông nước bao bọc rất thuận tiện cho giao thông vận tải cũng như thủy lợi.', CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-10-08' AS Date), N'Waiting')
INSERT [dbo].[LandLots] ([LandLotID], [SellerID], [LandLotName], [Location], [Area], [Description], [StartingPrice], [CreatedAt], [Status]) VALUES (27, 2, N'dat cua toi', N'Cao Phong ', CAST(1000.00 AS Decimal(10, 2)), N'Địa hình ở đây bằng phẳng, rải rác có nhiều cồn cát xen kẽ với ruộng vườn, không có rừng cây lớn, bốn bề sông nước bao bọc rất thuận tiện cho giao thông vận tải cũng như thủy lợi.', CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-10-08' AS Date), N'Waiting')
INSERT [dbo].[LandLots] ([LandLotID], [SellerID], [LandLotName], [Location], [Area], [Description], [StartingPrice], [CreatedAt], [Status]) VALUES (28, 3, N'Ban Dat Hoa Lac', N'Tan Xa, Hoa Lac', CAST(7000.00 AS Decimal(10, 2)), N'Dat hoa lac, khi hau dep, thien nhien phong phu, Gan truong hoc, benh xa rat tien loi cho viec di lai di hoc va di lam', CAST(1000000.00 AS Decimal(18, 2)), CAST(N'2024-10-10' AS Date), N'Waiting')
INSERT [dbo].[LandLots] ([LandLotID], [SellerID], [LandLotName], [Location], [Area], [Description], [StartingPrice], [CreatedAt], [Status]) VALUES (30, 3, N'Bán Đất', N'Thạch Thất, Hòa Lạc', CAST(700.00 AS Decimal(10, 2)), N'Đất bán tại Hòa lạc, Đất bán tại Hòa lạc, Đất bán tại Hòa lạc, Đất bán tại Hòa lạc, Đất bán tại Hòa lạc, ', CAST(9000000.00 AS Decimal(18, 2)), CAST(N'2024-10-12' AS Date), N'Waiting')
INSERT [dbo].[LandLots] ([LandLotID], [SellerID], [LandLotName], [Location], [Area], [Description], [StartingPrice], [CreatedAt], [Status]) VALUES (31, 3, N'Manh Dat 1', N'Hòa Lạc', CAST(500.00 AS Decimal(10, 2)), N'Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi Day la dat thuoc khu dan cu tien loi ', CAST(9000000.00 AS Decimal(18, 2)), CAST(N'2024-10-14' AS Date), N'Waiting')
SET IDENTITY_INSERT [dbo].[LandLots] OFF
GO
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (26, 1)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (27, 1)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (27, 3)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (28, 1)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (28, 12)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (30, 1)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (30, 13)
INSERT [dbo].[LandLotZoning] ([LandLotID], [ZoningID]) VALUES (31, 1)
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'Auctioneer')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (5, N'Guest')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [userName], [password], [fullName], [email], [phone], [role], [address], [createdAt]) VALUES (1, N'admin', N'123456', N'Admin', N'tranhuy@gmail.com', N'0346842677', N'1', N'Hoa Binh', CAST(N'2024-09-27' AS Date))
INSERT [dbo].[Users] ([userID], [userName], [password], [fullName], [email], [phone], [role], [address], [createdAt]) VALUES (2, N'tranhuy', N'Tranhuy123', N'tran do quang huy', N'nkocbadboy@gmail.com', N'0346842675', N'2', N'Hoa Binh', CAST(N'2024-10-04' AS Date))
INSERT [dbo].[Users] ([userID], [userName], [password], [fullName], [email], [phone], [role], [address], [createdAt]) VALUES (3, N'user1', N'User@123456', N'Nguyen Thi A', N'user1@gmail.com', N'0346842679', N'2', N'Hoa Lac', CAST(N'2024-10-10' AS Date))
INSERT [dbo].[Users] ([userID], [userName], [password], [fullName], [email], [phone], [role], [address], [createdAt]) VALUES (4, N'user2', N'User@123', N'Nguyen Van B', N'user2@gmail.com', N'0353478237', N'2', N'Hoa Lac', CAST(N'2024-10-11' AS Date))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[ZoningTypes] ON 

INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (1, N'R1', N'Khu dân cư')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (2, N'C2', N'Khu Thương mại - Trung tâm mua sắm')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (3, N'AG', N'Khu Nông nghiệp')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (4, N'I1', N'Khu công nghiệp')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (5, N'R2', N'Khu dân cư nhiều hộ')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (6, N'C1', N'Khu thương mại - Văn phòng')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (7, N'M1', N'Khu công nghiệp - Sản xuất nặng')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (8, N'P1', N'Khu cơ sở hạ tầng công cộng')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (9, N'MXD', N'Khu phát triển hỗn hợp')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (10, N'T1', N'Khu hạ tầng giao thông')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (11, N'H1', N'Khu bảo tồn lịch sử')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (12, N'R3', N'Khu dân cư mật độ cao')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (13, N'PUD', N'Khu phát triển theo quy hoạch')
INSERT [dbo].[ZoningTypes] ([ZoningID], [ZoningCode], [ZoningDescription]) VALUES (14, N'AG2', N'Khu nông nghiệp - Quy mô lớn')
SET IDENTITY_INSERT [dbo].[ZoningTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D1053448EC0EDA]    Script Date: 10/14/2024 3:43:58 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D1053448EC0EDA] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D105345456D579]    Script Date: 10/14/2024 3:43:58 PM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UQ__Users__A9D105345456D579] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuctionLogs] ADD  CONSTRAINT [DF__AuctionLo__LogTi__5165187F]  DEFAULT (getdate()) FOR [LogTime]
GO
ALTER TABLE [dbo].[Bids] ADD  CONSTRAINT [DF__Bids__BidTime__47DBAE45]  DEFAULT (getdate()) FOR [BidTime]
GO
ALTER TABLE [dbo].[LandLotImages] ADD  CONSTRAINT [DF__LandLotIm__Uploa__40F9A68C]  DEFAULT (getdate()) FOR [UploadedAt]
GO
ALTER TABLE [dbo].[LandLots] ADD  CONSTRAINT [DF__LandLots__Create__3C69FB99]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Payments] ADD  CONSTRAINT [DF__Payments__Paymen__4CA06362]  DEFAULT (getdate()) FOR [PaymentDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreatedAt__38996AB5]  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD  CONSTRAINT [FK__AuctionLo__Aucti__5070F446] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionLogs] CHECK CONSTRAINT [FK__AuctionLo__Aucti__5070F446]
GO
ALTER TABLE [dbo].[AuctionLogs]  WITH CHECK ADD  CONSTRAINT [FK__AuctionLo__Aucti__76969D2E] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionLogs] CHECK CONSTRAINT [FK__AuctionLo__Aucti__76969D2E]
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
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__LandLo__403A8C7D] FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__LandLo__403A8C7D]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [FK__Auctions__LandLo__797309D9] FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [FK__Auctions__LandLo__797309D9]
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
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK__Bids__AuctionID__45F365D3] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK__Bids__AuctionID__45F365D3]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK__Bids__AuctionID__7B5B524B] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK__Bids__AuctionID__7B5B524B]
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
ALTER TABLE [dbo].[LandLotImages]  WITH CHECK ADD  CONSTRAINT [FK__LandLotIm__LandL__40058253] FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[LandLotImages] CHECK CONSTRAINT [FK__LandLotIm__LandL__40058253]
GO
ALTER TABLE [dbo].[LandLotZoning]  WITH CHECK ADD  CONSTRAINT [FK__LandLotZo__LandL__51300E55] FOREIGN KEY([LandLotID])
REFERENCES [dbo].[LandLots] ([LandLotID])
GO
ALTER TABLE [dbo].[LandLotZoning] CHECK CONSTRAINT [FK__LandLotZo__LandL__51300E55]
GO
ALTER TABLE [dbo].[LandLotZoning]  WITH CHECK ADD FOREIGN KEY([ZoningID])
REFERENCES [dbo].[ZoningTypes] ([ZoningID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__Auctio__4AB81AF0] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__Auctio__4AB81AF0]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__Auctio__7E37BEF6] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[Auctions] ([AuctionID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__Auctio__7E37BEF6]
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
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [CK__Auctions__Status__02084FDA] CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Ongoing'))
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [CK__Auctions__Status__02084FDA]
GO
ALTER TABLE [dbo].[Auctions]  WITH CHECK ADD  CONSTRAINT [CK__Auctions__Status__4222D4EF] CHECK  (([Status]='Cancelled' OR [Status]='Completed' OR [Status]='Ongoing'))
GO
ALTER TABLE [dbo].[Auctions] CHECK CONSTRAINT [CK__Auctions__Status__4222D4EF]
GO
ALTER TABLE [dbo].[LandLots]  WITH CHECK ADD  CONSTRAINT [CK_Status] CHECK  (([Status]='Waiting' OR [Status]='Available' OR [Status]='Sold'))
GO
ALTER TABLE [dbo].[LandLots] CHECK CONSTRAINT [CK_Status]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [CK__Payments__Status__03F0984C] CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [CK__Payments__Status__03F0984C]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [CK__Payments__Status__4D94879B] CHECK  (([Status]='Failed' OR [Status]='Completed' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [CK__Payments__Status__4D94879B]
GO

ALTER TABLE [SWP391_G3_Project].[dbo].[Auctions]
ALTER COLUMN [StartTime] DATETIME2;
 
ALTER TABLE [SWP391_G3_Project].[dbo].[Auctions]
ALTER COLUMN [EndTime] DATETIME2;
UPDATE [SWP391_G3_Project].[dbo].[Auctions]
SET 
    [StartTime] = DATEADD(HOUR, 9, [StartTime]),  -- Adds 9 AM to existing dates
    [EndTime] = DATEADD(HOUR, 17, [EndTime]);     -- Adds 5 PM to existing dates

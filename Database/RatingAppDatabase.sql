USE [RatingApp]
GO
/****** Object:  Table [dbo].[Bars_Master]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bars_Master](
	[bar_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[city_id] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[details] [xml] NOT NULL,
	[service] [varchar](50) NOT NULL,
	[price] [varchar](30) NOT NULL,
	[reviews] [varchar](5000) NULL,
	[images] [image] NULL,
	[is_active] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Bars_Master] PRIMARY KEY CLUSTERED 
(
	[bar_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BB_Master]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BB_Master](
	[bb_id] [int] IDENTITY(1,1) NOT NULL,
	[property_amenities] [varchar](150) NULL,
	[room_features] [varchar](150) NULL,
	[reviews] [varchar](5000) NULL,
	[meals] [varchar](150) NULL,
	[about] [varchar](5000) NOT NULL,
	[is_active] [bit] NOT NULL,
	[city_id] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_BB_Master] PRIMARY KEY CLUSTERED 
(
	[bb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Bar]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Bar](
	[bar_master_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[reservation_date] [datetime] NOT NULL,
	[no_of_guests] [smallint] NOT NULL,
	[is_status] [bit] NOT NULL,
	[special_request] [varchar](200) NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Book_Bar] PRIMARY KEY CLUSTERED 
(
	[bar_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_BB]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_BB](
	[bb_master_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[from_date] [datetime] NOT NULL,
	[to_date] [datetime] NOT NULL,
	[no_of_adults] [smallint] NOT NULL,
	[no_of_childerns] [smallint] NULL,
	[no_of_rooms] [smallint] NOT NULL,
	[special_request] [varchar](200) NULL,
	[is_status] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Book_BB] PRIMARY KEY CLUSTERED 
(
	[bb_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Club]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Club](
	[club_master_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[reservation_date] [datetime] NOT NULL,
	[no_of_guests] [smallint] NOT NULL,
	[is_status] [bit] NOT NULL,
	[special_request] [varchar](200) NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Book_Club] PRIMARY KEY CLUSTERED 
(
	[club_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Hotel]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Hotel](
	[hotel_master_id] [int] IDENTITY(1,1) NOT NULL,
	[from_date] [datetime] NOT NULL,
	[to_date] [datetime] NOT NULL,
	[user_id] [int] NOT NULL,
	[no_of_adults] [smallint] NOT NULL,
	[no_of_childerns] [smallint] NULL,
	[no_of_rooms] [smallint] NOT NULL,
	[special_request] [varchar](200) NULL,
	[is_status] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Book_Hotel] PRIMARY KEY CLUSTERED 
(
	[hotel_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book_Restaurant]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_Restaurant](
	[rest_master_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[reservation_date] [datetime] NOT NULL,
	[no_of_adults] [smallint] NOT NULL,
	[no_of_childerns] [smallint] NULL,
	[is_status] [bit] NOT NULL,
	[special_request] [varchar](200) NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Book_Restaurant] PRIMARY KEY CLUSTERED 
(
	[rest_master_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_code] [varchar](10) NOT NULL,
	[city_name] [varchar](50) NOT NULL,
	[is_active] [varchar](10) NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_City] UNIQUE NONCLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clubs_Master]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clubs_Master](
	[club_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[city_id] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[details] [xml] NOT NULL,
	[service] [varchar](50) NOT NULL,
	[price] [varchar](30) NOT NULL,
	[reviews] [varchar](5000) NULL,
	[images] [image] NULL,
	[is_active] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Clubs_Master] PRIMARY KEY CLUSTERED 
(
	[club_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotels_Master]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotels_Master](
	[hotel_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[city_id] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[details] [xml] NOT NULL,
	[service] [varchar](50) NOT NULL,
	[price] [varchar](30) NOT NULL,
	[reviews] [varchar](5000) NULL,
	[images] [image] NULL,
	[is_active] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Hotels_Master] PRIMARY KEY CLUSTERED 
(
	[hotel_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants_Master]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants_Master](
	[rest_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[city_id] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[details] [xml] NULL,
	[service] [varchar](50) NOT NULL,
	[price] [varchar](30) NOT NULL,
	[reviews] [varchar](5000) NULL,
	[images] [image] NULL,
	[is_active] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Restaurants_Master] PRIMARY KEY CLUSTERED 
(
	[rest_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review_Report]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review_Report](
	[review_report_id] [int] IDENTITY(1,1) NOT NULL,
	[review_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Review_Report] PRIMARY KEY CLUSTERED 
(
	[review_report_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] NOT NULL,
	[role_code] [varchar](20) NOT NULL,
	[role_name] [varchar](20) NOT NULL,
	[created_date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Review]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[report_count] [smallint] NOT NULL,
	[is_active] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
	[like_count] [smallint] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_User_Review] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10-04-2021 18:08:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[token] [varchar](500) NOT NULL,
	[password] [varbinary](200) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[avatar_img] [image] NULL,
	[email_id] [varchar](50) NOT NULL,
	[contact_number] [varchar](11) NOT NULL,
	[roles_id] [int] NOT NULL,
	[is_deleted] [bit] NOT NULL,
	[modified_date] [datetime] NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bars_Master]  WITH CHECK ADD  CONSTRAINT [FK_Bars_Master_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Bars_Master] CHECK CONSTRAINT [FK_Bars_Master_City]
GO
ALTER TABLE [dbo].[BB_Master]  WITH CHECK ADD  CONSTRAINT [FK_BB_Master_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[BB_Master] CHECK CONSTRAINT [FK_BB_Master_City]
GO
ALTER TABLE [dbo].[Book_Bar]  WITH CHECK ADD  CONSTRAINT [FK_Book_Bar_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Book_Bar] CHECK CONSTRAINT [FK_Book_Bar_Users]
GO
ALTER TABLE [dbo].[Book_BB]  WITH CHECK ADD  CONSTRAINT [FK_Book_BB_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Book_BB] CHECK CONSTRAINT [FK_Book_BB_Users]
GO
ALTER TABLE [dbo].[Book_Club]  WITH CHECK ADD  CONSTRAINT [FK_Book_Club_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Book_Club] CHECK CONSTRAINT [FK_Book_Club_Users]
GO
ALTER TABLE [dbo].[Book_Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Book_Hotel_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Book_Hotel] CHECK CONSTRAINT [FK_Book_Hotel_Users]
GO
ALTER TABLE [dbo].[Book_Restaurant]  WITH CHECK ADD  CONSTRAINT [FK_Book_Restaurant_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Book_Restaurant] CHECK CONSTRAINT [FK_Book_Restaurant_Users]
GO
ALTER TABLE [dbo].[Clubs_Master]  WITH CHECK ADD  CONSTRAINT [FK_Clubs_Master_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Clubs_Master] CHECK CONSTRAINT [FK_Clubs_Master_City]
GO
ALTER TABLE [dbo].[Hotels_Master]  WITH CHECK ADD  CONSTRAINT [FK_Hotels_Master_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Hotels_Master] CHECK CONSTRAINT [FK_Hotels_Master_City]
GO
ALTER TABLE [dbo].[Restaurants_Master]  WITH CHECK ADD  CONSTRAINT [FK_Restaurants_Master_City] FOREIGN KEY([city_id])
REFERENCES [dbo].[City] ([city_id])
GO
ALTER TABLE [dbo].[Restaurants_Master] CHECK CONSTRAINT [FK_Restaurants_Master_City]
GO
ALTER TABLE [dbo].[Review_Report]  WITH CHECK ADD  CONSTRAINT [FK_Review_Report_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Review_Report] CHECK CONSTRAINT [FK_Review_Report_Users]
GO
ALTER TABLE [dbo].[User_Review]  WITH CHECK ADD  CONSTRAINT [FK_User_Review_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[User_Review] CHECK CONSTRAINT [FK_User_Review_Users]
GO

USE `RatingApp`;
 
/* SQLINES DEMO *** le [dbo].[Bars_Master]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Bars_Master(
	`bar_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`city_id` int NOT NULL,
	`address` varchar(100) NOT NULL,
	`details` Longtext NOT NULL,
	`service` varchar(50) NOT NULL,
	`price` varchar(30) NOT NULL,
	`reviews` varchar(5000) NULL,
	`images` Longblob NULL,
	`is_active` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Bars_Master` PRIMARY KEY 
(
	`bar_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON `PRIMARY`
GO
/* SQLINES DEMO *** le [dbo].[BB_Master]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE BB_Master(
	`bb_id` int AUTO_INCREMENT NOT NULL,
	`property_amenities` varchar(150) NULL,
	`room_features` varchar(150) NULL,
	`reviews` varchar(5000) NULL,
	`meals` varchar(150) NULL,
	`about` varchar(5000) NOT NULL,
	`is_active` Tinyint NOT NULL,
	`city_id` int NOT NULL,
	`address` varchar(100) NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_BB_Master` PRIMARY KEY 
(
	`bb_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Book_Bar]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Book_Bar(
	`bar_master_id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`reservation_date` datetime(3) NOT NULL,
	`no_of_guests` smallint NOT NULL,
	`is_status` Tinyint NOT NULL,
	`special_request` varchar(200) NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Book_Bar` PRIMARY KEY 
(
	`bar_master_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Book_BB]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Book_BB(
	`bb_master_id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`from_date` datetime(3) NOT NULL,
	`to_date` datetime(3) NOT NULL,
	`no_of_adults` smallint NOT NULL,
	`no_of_childerns` smallint NULL,
	`no_of_rooms` smallint NOT NULL,
	`special_request` varchar(200) NULL,
	`is_status` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Book_BB` PRIMARY KEY 
(
	`bb_master_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Book_Club]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Book_Club(
	`club_master_id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`reservation_date` datetime(3) NOT NULL,
	`no_of_guests` smallint NOT NULL,
	`is_status` Tinyint NOT NULL,
	`special_request` varchar(200) NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Book_Club` PRIMARY KEY 
(
	`club_master_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Book_Hotel]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Book_Hotel(
	`hotel_master_id` int AUTO_INCREMENT NOT NULL,
	`from_date` datetime(3) NOT NULL,
	`to_date` datetime(3) NOT NULL,
	`user_id` int NOT NULL,
	`no_of_adults` smallint NOT NULL,
	`no_of_childerns` smallint NULL,
	`no_of_rooms` smallint NOT NULL,
	`special_request` varchar(200) NULL,
	`is_status` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Book_Hotel` PRIMARY KEY 
(
	`hotel_master_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Book_Restaurant]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Book_Restaurant(
	`rest_master_id` int AUTO_INCREMENT NOT NULL,
	`user_id` int NOT NULL,
	`reservation_date` datetime(3) NOT NULL,
	`no_of_adults` smallint NOT NULL,
	`no_of_childerns` smallint NULL,
	`is_status` Tinyint NOT NULL,
	`special_request` varchar(200) NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Book_Restaurant` PRIMARY KEY 
(
	`rest_master_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[City]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE City(
	`city_id` int AUTO_INCREMENT NOT NULL,
	`city_code` varchar(10) NOT NULL,
	`city_name` varchar(50) NOT NULL,
	`is_active` varchar(10) NOT NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_City` PRIMARY KEY 
(
	`city_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT `IX_City` UNIQUE NONCLUSTERED 
(
	`city_id` ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Clubs_Master]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Clubs_Master(
	`club_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`city_id` int NOT NULL,
	`address` varchar(100) NOT NULL,
	`details` Longtext NOT NULL,
	`service` varchar(50) NOT NULL,
	`price` varchar(30) NOT NULL,
	`reviews` varchar(5000) NULL,
	`images` Longblob NULL,
	`is_active` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Clubs_Master` PRIMARY KEY 
(
	`club_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON `PRIMARY`
GO
/* SQLINES DEMO *** le [dbo].[Hotels_Master]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Hotels_Master(
	`hotel_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`city_id` int NOT NULL,
	`address` varchar(100) NOT NULL,
	`details` Longtext NOT NULL,
	`service` varchar(50) NOT NULL,
	`price` varchar(30) NOT NULL,
	`reviews` varchar(5000) NULL,
	`images` Longblob NULL,
	`is_active` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Hotels_Master` PRIMARY KEY 
(
	`hotel_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON `PRIMARY`
GO
/* SQLINES DEMO *** le [dbo].[Restaurants_Master]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Restaurants_Master(
	`rest_id` int AUTO_INCREMENT NOT NULL,
	`name` varchar(50) NOT NULL,
	`city_id` int NOT NULL,
	`address` varchar(100) NOT NULL,
	`details` Longtext NULL,
	`service` varchar(50) NOT NULL,
	`price` varchar(30) NOT NULL,
	`reviews` varchar(5000) NULL,
	`images` Longblob NULL,
	`is_active` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Restaurants_Master` PRIMARY KEY 
(
	`rest_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON `PRIMARY`
GO
/* SQLINES DEMO *** le [dbo].[Review_Report]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Review_Report(
	`review_report_id` int AUTO_INCREMENT NOT NULL,
	`review_id` int NOT NULL,
	`user_id` int NOT NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Review_Report` PRIMARY KEY 
(
	`review_report_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Roles]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Roles(
	`id` int NOT NULL,
	`role_code` varchar(20) NOT NULL,
	`role_name` varchar(20) NOT NULL,
	`created_date` date NOT NULL
);
/* SQLINES DEMO *** le [dbo].[User_Review]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE User_Review(
	`review_id` int AUTO_INCREMENT NOT NULL,
	`report_count` smallint NOT NULL,
	`is_active` Tinyint NOT NULL,
	`user_id` int NOT NULL,
	`like_count` smallint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_User_Review` PRIMARY KEY 
(
	`review_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/* SQLINES DEMO *** le [dbo].[Users]    Script Date: 10-04-2021 18:08:16 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
CREATE TABLE Users(
	`user_id` int AUTO_INCREMENT NOT NULL,
	`token` varchar(500) NOT NULL,
	`password` varbinary(200) NOT NULL,
	`name` varchar(30) NOT NULL,
	`avatar_img` Longblob NULL,
	`email_id` varchar(50) NOT NULL,
	`contact_number` varchar(11) NOT NULL,
	`roles_id` int NOT NULL,
	`is_deleted` Tinyint NOT NULL,
	`modified_date` datetime(3) NULL,
	`created_date` datetime(3) NOT NULL,
 CONSTRAINT `PK_Users` PRIMARY KEY 
(
	`user_id` ASC
)  OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON `PRIMARY`
GO
ALTER TABLE `dbo`.`Bars_Master`  ADD  CONSTRAINT `FK_Bars_Master_City` FOREIGN KEY(`city_id`)
REFERENCES City (`city_id`);
 
ALTER TABLE `dbo`.`Bars_Master` CHECK CONSTRAINT [FK_Bars_Master_City];
 
ALTER TABLE `dbo`.`BB_Master`  ADD  CONSTRAINT `FK_BB_Master_City` FOREIGN KEY(`city_id`)
REFERENCES City (`city_id`);
 
ALTER TABLE `dbo`.`BB_Master` CHECK CONSTRAINT [FK_BB_Master_City];
 
ALTER TABLE `dbo`.`Book_Bar`  ADD  CONSTRAINT `FK_Book_Bar_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Book_Bar` CHECK CONSTRAINT [FK_Book_Bar_Users];
 
ALTER TABLE `dbo`.`Book_BB`  ADD  CONSTRAINT `FK_Book_BB_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Book_BB` CHECK CONSTRAINT [FK_Book_BB_Users];
 
ALTER TABLE `dbo`.`Book_Club`  ADD  CONSTRAINT `FK_Book_Club_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Book_Club` CHECK CONSTRAINT [FK_Book_Club_Users];
 
ALTER TABLE `dbo`.`Book_Hotel`  ADD  CONSTRAINT `FK_Book_Hotel_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Book_Hotel` CHECK CONSTRAINT [FK_Book_Hotel_Users];
 
ALTER TABLE `dbo`.`Book_Restaurant`  ADD  CONSTRAINT `FK_Book_Restaurant_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Book_Restaurant` CHECK CONSTRAINT [FK_Book_Restaurant_Users];
 
ALTER TABLE `dbo`.`Clubs_Master`  ADD  CONSTRAINT `FK_Clubs_Master_City` FOREIGN KEY(`city_id`)
REFERENCES City (`city_id`);
 
ALTER TABLE `dbo`.`Clubs_Master` CHECK CONSTRAINT [FK_Clubs_Master_City];
 
ALTER TABLE `dbo`.`Hotels_Master`  ADD  CONSTRAINT `FK_Hotels_Master_City` FOREIGN KEY(`city_id`)
REFERENCES City (`city_id`);
 
ALTER TABLE `dbo`.`Hotels_Master` CHECK CONSTRAINT [FK_Hotels_Master_City];
 
ALTER TABLE `dbo`.`Restaurants_Master`  ADD  CONSTRAINT `FK_Restaurants_Master_City` FOREIGN KEY(`city_id`)
REFERENCES City (`city_id`);
 
ALTER TABLE `dbo`.`Restaurants_Master` CHECK CONSTRAINT [FK_Restaurants_Master_City];
 
ALTER TABLE `dbo`.`Review_Report`  ADD  CONSTRAINT `FK_Review_Report_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`Review_Report` CHECK CONSTRAINT [FK_Review_Report_Users];
 
ALTER TABLE `dbo`.`User_Review`  ADD  CONSTRAINT `FK_User_Review_Users` FOREIGN KEY(`user_id`)
REFERENCES Users (`user_id`);
 
ALTER TABLE `dbo`.`User_Review` CHECK CONSTRAINT [FK_User_Review_Users];
 
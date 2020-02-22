USE [master]
GO

/****** Object:  Database [MyJoinsDBLesson6]    Script Date: 22.02.2020 21:22:37 ******/
CREATE DATABASE [MyJoinsDBLesson6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyJoinsDBLesson6', FILENAME = N'C:\Repositories\SQLEssential\Lesson6\MyJoinsDBLesson6.mdf' , SIZE = 30720KB , MAXSIZE = 102400KB , FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'LogMyJoinsDB', FILENAME = N'C:\Repositories\SQLEssential\Lesson6\MyJoinsDBLesson6.ldf' , SIZE = 5120KB , MAXSIZE = 30720KB , FILEGROWTH = 5120KB )
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyJoinsDBLesson6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ARITHABORT OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET  ENABLE_BROKER 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET RECOVERY FULL 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET  MULTI_USER 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [MyJoinsDBLesson6] SET DB_CHAINING OFF 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [MyJoinsDBLesson6] SET QUERY_STORE = OFF
GO

ALTER DATABASE [MyJoinsDBLesson6] SET  READ_WRITE 
GO

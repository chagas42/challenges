BEGIN TRY

BEGIN TRAN;

-- CreateTable
CREATE TABLE [dbo].[User] (
    [id] INT NOT NULL IDENTITY(1,1),
    [email] NVARCHAR(1000) NOT NULL,
    [password] NVARCHAR(1000) NOT NULL,
    [name] NVARCHAR(1000) NOT NULL,
    CONSTRAINT [User_pkey] PRIMARY KEY CLUSTERED ([id]),
    CONSTRAINT [User_email_key] UNIQUE NONCLUSTERED ([email])
);

-- CreateTable
CREATE TABLE [dbo].[Hero] (
    [id] INT NOT NULL IDENTITY(1,1),
    [name] NVARCHAR(1000) NOT NULL,
    [class] NVARCHAR(1000) NOT NULL CONSTRAINT [Hero_class_df] DEFAULT 'C',
    [lati] FLOAT(53) NOT NULL,
    [longi] FLOAT(53) NOT NULL,
    [battle_end_timestamp] DATETIME2,
    [active] BIT NOT NULL CONSTRAINT [Hero_active_df] DEFAULT 1,
    CONSTRAINT [Hero_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateTable
CREATE TABLE [dbo].[History] (
    [id] INT NOT NULL IDENTITY(1,1),
    [heroId] INT NOT NULL,
    [threatName] NVARCHAR(1000) NOT NULL,
    [threatRank] NVARCHAR(1000) NOT NULL,
    [duration] INT NOT NULL,
    [createdAt] DATETIME2 NOT NULL CONSTRAINT [History_createdAt_df] DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT [History_pkey] PRIMARY KEY CLUSTERED ([id])
);

-- CreateIndex
CREATE NONCLUSTERED INDEX [History_heroId_idx] ON [dbo].[History]([heroId]);

-- AddForeignKey
ALTER TABLE [dbo].[History] ADD CONSTRAINT [History_heroId_fkey] FOREIGN KEY ([heroId]) REFERENCES [dbo].[Hero]([id]) ON DELETE NO ACTION ON UPDATE CASCADE;

COMMIT TRAN;

END TRY
BEGIN CATCH

IF @@TRANCOUNT > 0
BEGIN
    ROLLBACK TRAN;
END;
THROW

END CATCH

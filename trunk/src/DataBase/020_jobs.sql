declare @idProgramming integer;
declare @idDesign integer;

SELECT @idProgramming = Category.CategoryId  FROM Category
WHERE Category.Name = 'Programming';

SELECT @idDesign = Category.CategoryId  FROM Category
WHERE Category.Name = 'Design';

INSERT INTO Job (CateroryId, Company, CreateAt, Description, Email, ExpiresAt,
HowToApply, IsActivated, IsPublic, Location, Logo, Position, Token, Type, UpdateAt, Url)
VALUES (
@idDesign,
'Sensio Labs',
GETDATE(),
'You''ve already developed websites with symfony and you want to
work with Open-Source technologies. You have a minimum of 3
years experience in web development with PHP or Java and you
wish to participate to development of Web 2.0 sites using the
best frameworks available.',
'job@example.com',
'2010-10-10',
'Send your resume to fabien.potencier [at] sensio.com',
1,
1,
'Paris, France',
'sensio-labs.gif',
'Web Developer',
'job_sensio_labs',
'full-time',
GETDATE(),
'http://www.sensiolabs.com/'
);

declare @n integer
set @n = 100
set nocount on
while @n < 130
BEGIN

INSERT INTO Job (CateroryId, Company, CreateAt, Description, Email, ExpiresAt,
HowToApply, IsActivated, IsPublic, Location, Position, Token, UpdateAt)
VALUES (
@idProgramming,
'Company '+CAST(@n as CHAR),
GETDATE(),
'Lorem ipsum dolor sit amet, consectetur adipisicing elit.',
'job@example.com',
'2010-10-10',
'Send your resume to lorem.ipsum [at] company_'+CAST(@n as CHAR)+'.sit',
1,
1,
'Paris, France',
'Web Developer',
'job_'+CAST(@n as CHAR),
GETDATE()
);
SET @n = @n + 1
END
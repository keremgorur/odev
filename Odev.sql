CREATE FUNCTION Telefonayar(@telefon VARCHAR(17))
RETURNS VARCHAR(17) 
BEGIN 
DECLARE @Sonuc VARCHAR(17) 
SET @Sonuc = SUBSTRING(@Telefon, 1, 1) + ' ('+ SUBSTRING(@Telefon, 2, 3) + ') ' + SUBSTRING(@Telefon, 5, 3) + ' ' + SUBSTRING(@Telefon, 8, 2) + ' ' + SUBSTRING(@Telefon, 10, 2)
RETURN @Sonuc 

END

select dbo.Telefonayari('05544487740') as TelefonNo 




DECLARE @mail NVARCHAR(150)= 'kerem.gorur@gmail.com' , @isimc NVARCHAR(150), @soyisimc NVARCHAR(150),
@domainc nvarchar(150) , @uzanti nvarchar(150), @isim nvarchar(150), @soyisim nvarchar(500), @domain nvarchar(150)

set @isimc =LEFT(@mail,CHARINDEX('.', @mail)-1)

set @soyisimc = SUBSTRING(@mail, LEN(@isimc)+2, len(SUBSTRING(@mail, len(@isimc), CHARINDEX('@', @mail)-len(@isimc)-2)))

set @domainc = left((SUBSTRING(@mail, LEN(@isimc+'.'+@soyisimc)+2,29)),CHARINDEX('.', SUBSTRING(@mail, LEN(@isimc+'.'+@soyisimc)+3,100)))

set @uzanti = right(@mail ,len(@mail) - len(@isimc+'.'+@soyisimc+'@'+@domainc+'.'))

set @isim = upper(left(@isimc,1)) + lower(right(@isimc, len(@isimc)-1))

set @soyisim = upper(left(@soyisimc,1)) + lower(right(@soyisimc, len(@soyisimc)-1))

set @domain = upper(left(@domainc,1)) + lower(right(@domainc, len(@domainc)-1))

	print 'Mail-)'+'     '+ @mail
	print '�sim-)'+'     '+ @isim
	print 'Soyad-)'+'    '+ @soyisim
	print 'Alan ad�-)'+' '+ @domain
	print 'Uzant�-)'+'   '+ @uzanti


	-- group by �dev
-- Toplam tutari 2500 ile 3500 arasinda olan sipari�lerin gruplanmas� 

-- Her bir sipari�teki toplam �r�n sayisi 200'den az olanlar

-- Kategorilere g�re toplam stok miktar�n� bulunuz.

-- Her bir �al��an toplam ne kadarl�k sat�� yapm��t�r.




-- join �dev

-- Bir sipari�in hangi �al��an taraf�ndan hangi m��teriye hangi kategorideki �r�nden hangi fiyattan ka� adet sat�ld���n� listeleyiniz.
-- �al��an�n ad�, soyad�, �nvan�, g�revi, i�e ba�lama tarihi
-- M��terinin firma ad�n�, temsilcisini ve telefonunu
-- �r�n�n ad�n�, stok miktar�n�, birim fiyat�n�
-- Sipari�in adetini ve sat�� fiyat�n�
-- Kategori ad�n�

-- Orders, Order_Details, Customers,Categories,Products, Employees


select OrderID, (UnitPrice*Quantity) Toplam from [Order Details]
where UnitPrice*Quantity between 2500 and 3500
group by OrderID, UnitPrice*Quantity
order by 2

select c.CategoryName, p.UnitsInStock from Products p join Categories c on p.CategoryID = c.CategoryID
group by p.UnitsInStock,c.CategoryName
order by 2 desc


select e.FirstName+' ' + E.LastName as Cal�san, count(o.OrderID) 'Toplam Sat�s say�s�', sum(Freight) 'Toplam Sat�s Tutar�' from Employees E
join Orders o on o.EmployeeID = E.EmployeeID
group by E.FirstName,E.LastName
order by 2 desc



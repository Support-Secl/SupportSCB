UPDATE c SET
    c.[disType] = CASE 
         WHEN L.[lonReferralCode] = 'HOM CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOM ECREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'Home ceedit SaadiqOne' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (CONVERSION)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'home credit , Mortgage one' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT ref pw-1216221' THEN 'Home Credit ref pw-1216221'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(1655940)' THEN 'HOME CREDIT REF PWID (1655940)'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(REF:1188879)' THEN 'Home Credit (REF:1188879)'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(STAF REF:2007065)' THEN 'HOME CREDIT RM(STAF REF:2007065)'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REF PWID-1278411' THEN 'HOME CREDIT STAFF REF PWID-1278411'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TAKEOVER(1217501)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TOP UOP' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TOPUP' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME FINANCE moa' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE REF PWID-1288076' THEN 'Saadiq Home Credit REF PWID-1288076'
        WHEN L.[lonReferralCode] = 'HOME FINANCE REFFERRAL PWID-1429154' THEN 'Saadiq Home Credit REFFERRAL PWID-1429154'
        WHEN L.[lonReferralCode] = 'HOME FINANCE TPA' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'HOME FINANCE(CONVERSION)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME FINANCE,PWID-1273296' THEN 'Saadiq Home Credit ,PWID-1273296'
        WHEN L.[lonReferralCode] = 'HOME LAON' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME LOAN(conversion)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME LOAN(REF CODE-1149496)' THEN 'Home Credit (REF CODE-1149496)'
        WHEN L.[lonReferralCode] = 'REG MORT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REG MORT/TP' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REG MORTGAGE' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISTERRD ML' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGMORT(SD)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SD/TPA' THEN 'SD/TPA'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS REF CODE PWID-1149528' THEN 'Home Loan SD EF CODE PWID-1149528'
        WHEN L.[lonReferralCode] = 'simultaneously' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'Staff(home credit)' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'TAKE OVER/REG MORT' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER/RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER\' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'Takeover CREDIT' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER RM, REFERRAL PWID-1620130' THEN 'Takeover Reg REFERRAL PWID-1620130'
        WHEN L.[lonReferralCode] = 'TAKEOVER STAF REF PWID-1149496' THEN 'Saadiq Takeover Reg REF PWID-1149496'
        WHEN L.[lonReferralCode] = 'TO FINAL DISB' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'TO/SOA' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TOP UP HOME CREDIT' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'TPA BUC' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA, PARTIAL' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA/CRD' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA/TO' THEN 'Takeover TPA'
        WHEN L.[lonReferralCode] = 'uc home finance' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'HL' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOME' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOME CRDIT TAKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'home credir' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT MORTGAGEONE' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERREL PWID-1288031' THEN 'Home Credit REFERREL PWID-1288031'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REF PWID-1469413' THEN 'Home Credit STAFF REF PWID-1469413'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TAKE OVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'Home Credit Top-up' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'HOME CREDIT( TAKE OVER)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT(reffaral rel:1329920)' THEN 'Home Credit reffaral rel:1329920)'
        WHEN L.[lonReferralCode] = 'HOME CREDIT(TAKE OVER)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT, STAFF PWID-1552307' THEN 'Home Credit STAFF PWID-1552307'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/REF#1407392' THEN 'Home Credit REF#1407392'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/REGISTERED' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANACE' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'HOME FINANCE RAJUK' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'home finance SD' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'home finance,sd' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'HOME LOAN RAJUK' THEN 'Home Loan Rajuk'
        WHEN L.[lonReferralCode] = 'HOME LOAN/MOA' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME LOAN/SD/TPA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOMW CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOOME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'MORT/TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'MORTGAGE/TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'part disb.' THEN 'part disb.'
        WHEN L.[lonReferralCode] = 'Ref-1567359' THEN 'Ref-1567359'
        WHEN L.[lonReferralCode] = 'REGIS MORT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISD (PART)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISTERED/TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'REGISTGERED' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'RGM/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'Saadiq Home finance' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'SAIMULTANEOUE' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULATANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'simultaneoous' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTINEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'STAFF HOME' THEN 'Staff TPA'
        WHEN L.[lonReferralCode] = 'STAFF HOME finance' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER (CREDIT)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER (N)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER (HOME CREDIT)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'takeover home credit REF PWID-1446314' THEN 'Takeover Reg REF PWID-1446314'
        WHEN L.[lonReferralCode] = 'TAKEOVER RM staff referral pwid-1293588' THEN 'Takeover Reg taff referral pwid-1293588'
        WHEN L.[lonReferralCode] = 'TAKEOVER STAFF REFERRALPWID-1393592' THEN 'Staff Takeover'
        WHEN L.[lonReferralCode] = 'TAKEOVER staff referralpwid-1618075' THEN 'Takeover Reg taff referralpwid-1618075'
        WHEN L.[lonReferralCode] = 'TAKEOVER TPA' THEN 'Takeover TPA'
        WHEN L.[lonReferralCode] = 'TAKEOVER(1450518)' THEN 'Takeover Reg(1450518)'
        WHEN L.[lonReferralCode] = 'takeover, home credit' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'Takover home credit' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TO 2ND PART' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TPA TAKEOVER' THEN 'Takeover TPA'
        WHEN L.[lonReferralCode] = 'TPA(PARTIAL)' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'Home Loan TPA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'UC SaadiqOne' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'CONVERTION' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'FPA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HEOME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOM CREDIT (CONVERSION)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME CEEDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit , sd' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit moa' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERRAL PWID-1162748' THEN 'Home Credit REFERRAL PWID-1162748'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM CROSS' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(CROSS)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF PWID-1458263' THEN 'Home Credit STAFF PWID-1458263'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REFERRAL PWID-1293588' THEN 'Home Credit STAFF REFERRAL PWID-1293588'
        WHEN L.[lonReferralCode] = 'home credit Taheover' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'Home Credit Top-up staff pwid-1217420' THEN 'Home Credit staff pwid-1217420'
        WHEN L.[lonReferralCode] = 'HOME CREDIT(RM)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT,staff ref pwid-1552307' THEN 'Home Credit staff ref pwid-1552307'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/ADDITIONAL' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/REGISERED' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TP' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FIN (TP)' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'HOME FINANCE TO' THEN 'Saadiq Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME FINANCE TPA/SD' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'home finance, TO' THEN 'Saadiq Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME FINANCE/TPA/SD' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'HOME LOAN' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOME LOAN (conversion)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME LOAN REFERREL PWID-1450518' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOME LOAN TAKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'MOA' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'MORTGAGE' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REF CODE#1617194 HOME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REG MORT/SD' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISTERED MO' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISTERED TAKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'REGISTERERD' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'SIMULTANEIOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTENWOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMUNLANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMUNTANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'TAKEO OVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVE RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER (RM)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER stff pwid-1165725' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER(HOME CREDIT)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVET' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TEKEOVER RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TP(SD)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'TPA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'UN HOME FINANCE' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'CASH SECURED' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'DEBT CONSOLI' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HEME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOM FINANCE' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME   CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (CONVERSTION)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (PWID REF: 1139655)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (RM)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (TAKE OVER)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERRAL PWID-1329920' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERRAL PWID-1450518' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERRAL PWID-1655940' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM RAJUK' THEN 'HOME CREDIT RM RAJUK'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(1329920)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(CONVERSION)' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REFERRAL PWID-1285829' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REFPWID-1619419' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TAKE OVER(1655940)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TO (ref:1165725)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT''' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit(1166341)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit, take over' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit-to' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/STAFF ML' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TAKE OVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TOPUP' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'home finance, PWID: 1285829' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE, SD' THEN 'Saadiq Home Finance SD'
        WHEN L.[lonReferralCode] = 'HOME FINANCE/TPA' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'HOME LOAN (REFFERAL 1288076)' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'Home Loan SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOME LOAN, TPA/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOME LOAN/TPA/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOME REDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'Mortgage One Home credit' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGMORT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS CONVERSION' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS DIBURSED' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS(REF PWID-1216221)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANIOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTENEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'simutaneous' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'Staff' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'Staff home credit' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'STEFF HOME CREDIT' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'TAEKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER/REG' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER 2nd' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER HOMECREDIT' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TKEOVER RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TOP UP' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'TOPUP/SD' THEN 'Home Credit Top-up'
        WHEN L.[lonReferralCode] = 'TPA (FULL)' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA (PARTIAL)' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA(SD)' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA/PARTIAL' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA/SHF' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'CONVERSION' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'ERG MORT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HC' THEN 'HC'
        WHEN L.[lonReferralCode] = 'HOEM CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (MOA)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit , takeover' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT CONVERTION' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME CREDIT REFERRAL STAFF PWID-1288076' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit soa' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF PWID-1331406' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TAKEOVER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TO (REF PWID:1293588)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TO (ref:1288076)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TO(1429154)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TOP UP' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT,refferel pwid-1420320' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/CRS' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/RGM' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TPA' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDTI TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME ECREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE (1531871)' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE/TPA SD' THEN 'Saadiq Home Finance TPA'
        WHEN L.[lonReferralCode] = 'HOME LOAN TPA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'HOME LOAN TPA/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOME LOAN/ TPA SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'HOMR CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'MOA/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'MORT/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'REG MORT/TO' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REGISTERD(SD)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'REGISTERED' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'RGM' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'SaadiqOne   home credit' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'SaadiqOne HOME CREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'SD DISBURSED' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SD(N)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SHBL, HOME LO' THEN 'Staff SD'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS DISBURSED' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANEOUS(ref id-420026133)' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTANNEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTENEOUS REFERRAL PWID-1149574' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMUMTANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'STAFF LOAN' THEN 'Staff SD'
        WHEN L.[lonReferralCode] = 'STAFF TAKEOVE' THEN 'Staff Takeover'
        WHEN L.[lonReferralCode] = 'TAKE OVER HOME CREDIT' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKE OVER RM STAFREFERRAL PW ID-1520631' THEN 'TAKE OVER RM STAFREFERRAL PW ID-1520631'
        WHEN L.[lonReferralCode] = 'TAKEOVER HOME CREDIT' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER RM STAFF REFERRAL-1139642' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER staff pwid-1423945' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVER,STAFF REF PWID-1273296' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAKEOVRE' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'takerover' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TAOEOVER RM' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TPA/SD' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'CONVERTED' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'HOME   CREDIT TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT (ref:1149574)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT referral  pwid-1446314' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM STAFFREF PWID-1285829' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT RM(1188879)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT STAFF REFERRAL PWID-1446314' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TAKEOBER' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOME CREDIT TOPUOP' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT(referral ID: 1154147)' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'home credit, Takeover' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREDIT/TAKEOVER' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME CREIDT,STAFF PWID-1423945' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE (1655940)' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME FINANCE SOA' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'HOME LOAN TO' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'HOMECREDIT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOMECREDIT 2N' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOMECREDIT RM' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOMECREDIT SOA' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'HOMELOAN' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'PART DISB' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'PARTIAL' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'REG. MORT' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'SaadiqOne home finance' THEN 'Saadiq Home Credit'
        WHEN L.[lonReferralCode] = 'SAIMULTANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SIMULTEANEOUS' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'Simultenous' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'SOA/SD' THEN 'Home Credit'
        WHEN L.[lonReferralCode] = 'STAFF CONVERT' THEN 'Conversion'
        WHEN L.[lonReferralCode] = 'STAFF MORT' THEN 'STAFF Home Credit'
        WHEN L.[lonReferralCode] = 'TAKE OVER RM REFERRAL PW ID-1524480-' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'Takeover(RM)' THEN 'Takeover Reg'
        WHEN L.[lonReferralCode] = 'TPA - SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'TPA SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'TPA/MOA' THEN 'Home Loan TPA'
        WHEN L.[lonReferralCode] = 'TPA/MOA/SD' THEN 'Home Loan SD'
        WHEN L.[lonReferralCode] = 'UC HOME CREDIT' THEN 'Home Loan TPA'
        
        -- Keep original value if no match found
        ELSE L.[lonReferralCode]
    END
FROM
    [CBRM].[dbo].[IDTP_ReportDisbursInfo] c
    INNER JOIN IDTP_Report.[dbo].[tbl_App_LoanApplication] LA ON c.llid = LA.lapLLID
    LEFT JOIN IDTP_Report.[dbo].[tbl_App_Loan] L ON LA.[lapLLID] = L.[lonLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Dis_Disbursement] DIS ON LA.[lapLLID] = DIS.[disLLID]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_Product] PROD ON LA.[lapProduct] = PROD.[proCode]
    LEFT JOIN IDTP_Report.[dbo].[tbl_Conf_ProductCategory] PCAT ON PROD.[proProductCategory] = PCAT.[pctCode]
    OUTER APPLY (
        SELECT TOP 1 T.trnPONumber
        FROM IDTP_Report.[dbo].[tbl_Dis_Transaction] T
        WHERE T.trnDisbursement = DIS.disNo
          AND T.trnPONumber IS NOT NULL
    ) TRN
WHERE
    PCAT.[pctCategory] = 'Mortgage'


	--AND (dis.disType = 'Take-Over' 
 --        OR dis.disType = 'Simultaneous'
 --        OR dis.disType LIKE '%Takeover%'
 --        OR dis.disType LIKE '%SD%')  



INSERT INTO UploadFileNames([fileName],[alias],[extention],[codeName],[userType],[makerRole],[checkerRole],[operationName],[isNeed],[importantFor],[prioritySeq],[createdOn],[createdBy],[editedOn],[editedBy],[reqApproval],[frequency],[sysType],[newFileName],[oid],[jsonConfigName])VALUES('securityRB.xlsx','SECURITY','xlsx','ImpCdbsCibSecurityImf','consumer','Consumer-Maker','Consumer-Checker','cdbsImfSecurity','1',NULL,'0','Oct 29 2016 12:00AM','admin',NULL,NULL,'1','M','MANUAL_CORE','securityRB.XLSX','BE856B3A-EFD5-4A88-987F-2D75ED235EC8','CDBS_SECURITY_IMF.json')







CREATE TABLE [dbo].[ImpCdbsCibSecurityImf](

	[id] [bigint] IDENTITY(1,1) NOT NULL,

	[customerNo] [varchar](50) NULL,

	[accountNo] [varchar](20) NULL,

	[securityValue] [float] NULL,

	[month] [int] NULL,

	[year] [int] NULL,

	[status] [int] NOT NULL,

	[createdOn] [datetime] NULL,

	[createdBy] [varchar](32) NULL,

	[makerRemarks] [varchar](max) NULL,

	[checkedOn] [datetime] NULL,

	[checkedBy] [varchar](32) NULL,

	[checkerRemarks] [varchar](max) NULL,

	[ouName] [varchar](20) NULL,

	[importDate] [datetime] NULL,

 CONSTRAINT [pk_ImpCdbsCibSecurityImf] PRIMARY KEY CLUSTERED 

(

	[id] ASC

)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO




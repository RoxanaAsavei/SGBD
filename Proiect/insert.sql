
INSERT INTO calificare_ras
VALUES (1, 'rezident');

INSERT INTO calificare_ras
VALUES (2, 'specialist');

INSERT INTO calificare_ras
VALUES (3, 'primar');

INSERT INTO calificare_ras
VALUES (4, 'generalist');

INSERT INTO calificare_ras
VALUES (5, 'fizioterapeut');
---------------------------------------------------------------------
INSERT INTO limba_ras
VALUES (1, 'RO');

INSERT INTO limba_ras
VALUES (2, 'EN');

INSERT INTO limba_ras
VALUES (3, 'FR');

INSERT INTO limba_ras
VALUES (4, 'ES');

INSERT INTO limba_ras
VALUES (5, 'DE');

--------------------------------------------------

INSERT INTO analize_ras
VALUES (1, 'Vitamina B12', 73.0, 12);

INSERT INTO analize_ras
VALUES (2, 'Homocisteina', 199.99, 14);

INSERT INTO analize_ras
VALUES (3, 'Osteocalcin', 75.0, 17);

INSERT INTO analize_ras
VALUES (4, 'Imunoglobulina A', 97.0, 3);

INSERT INTO analize_ras
VALUES (5, 'Helicobacter pylori Ac', 100.0, 1);

INSERT INTO analize_ras
VALUES (6, 'Numaratoare reticulocite', 129.99, 1);

INSERT INTO analize_ras
VALUES (7, 'Determinare grup sangvin', 30.0, 1);

INSERT INTO analize_ras
VALUES (8, 'Glicemie', 85, 2);
---------------------------------------------------------------------

INSERT INTO etaj_ras
VALUES (1, 'Subsol');

INSERT INTO etaj_ras
VALUES (2, 'Parter');

INSERT INTO etaj_ras
VALUES (3, 'Etajul 1');

INSERT INTO etaj_ras
VALUES (4, 'Etajul 2');

INSERT INTO etaj_ras
VALUES (5, 'Etajul 3');

INSERT INTO etaj_ras
VALUES (6, 'Mansarda');
--------------------------------------------

INSERT INTO sectie_ras
VALUES (1, 'Cardiologie');

INSERT INTO sectie_ras
VALUES (2, 'Dermatologie');

INSERT INTO sectie_ras
VALUES (3, 'Urologie');

INSERT INTO sectie_ras
VALUES (4, 'Medicina interna');

INSERT INTO sectie_ras
VALUES (5, 'Pediatrie');

INSERT INTO sectie_ras
VALUES (6, 'Endocrinologie');

-----------------------------------------------------

INSERT INTO proceduri_ras
VALUES (1, 'Hollywood Carbon Peel', 2, 1000, '20 min');

INSERT INTO proceduri_ras
VALUES (2, 'Dermapen 4', 2, 1150, '35 min');

INSERT INTO proceduri_ras
VALUES (3, 'Vasectomie', 3, 5500, '1 zi');

INSERT INTO proceduri_ras
VALUES (4, 'Cistoscopie diagnostica', 3, 1000, '6 ore');

INSERT INTO proceduri_ras
VALUES (5, 'Transplant incrucisat de rinichi', 3, 66000, '15 zile');

INSERT INTO proceduri_ras
VALUES (6, 'Coronarografie', 1, 4000, '24 ore');

INSERT INTO proceduri_ras
VALUES (7, ' Implantare de stimulator cardiac (pacemaker)', 1, 25000, '3 zile');

INSERT INTO proceduri_ras
VALUES (8, 'Colonoscopie', 4, 450, '60 min');

INSERT INTO proceduri_ras
VALUES (9, 'Punctie lombara', 5, 600, '2 zile');

INSERT INTO  proceduri_ras
VALUES (10, 'Bronhoscopie', 5, 1300, '1 zi');

INSERT INTO proceduri_ras
VALUES (11, 'Toracentez?', 5, 500, '1 zi');

INSERT INTO proceduri_ras
VALUES (12, 'Test de stimulare cu TRH', 6, 450, '3 ore');

INSERT INTO proceduri_ras
VALUES (13, 'Biopsie tiroidian? cu ac fin', 6, 450, '30 min');
-----------------------------------------------------------

CREATE SEQUENCE secv_id_angajat
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

---------------------------------------------------------
-- medici
INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Popescu', 'Miruna', TO_DATE('1974/12/23', 'yyyy/mm/dd'), '0702703707', TO_DATE('2002/06/01', 'yyyy/mm/dd'), 12500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Tacu', 'Oleg', TO_DATE('1982/05/21', 'yyyy/mm/dd'), '0795121428', TO_DATE('2010/11/19', 'yyyy/mm/dd'), 10000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Popescu', 'Diana', TO_DATE('1980/02/12', 'yyyy/mm/dd'), '0754753426', TO_DATE('2010/10/21', 'yyyy/mm/dd'), 12500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Botez', 'Catalin', TO_DATE('1988/02/10', 'yyyy/mm/dd'), '0721905168', TO_DATE('2022/05/16', 'yyyy/mm/dd'), 9900);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Carp', 'Lucia', TO_DATE('1987/05/13', 'yyyy/mm/dd'), '0785795744', TO_DATE('2022/05/18', 'yyyy/mm/dd'), 10000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Popa', 'Raluca', TO_DATE('1982/07/17', 'yyyy/mm/dd'), '0710405579', TO_DATE('2020/06/12', 'yyyy/mm/dd'), 11500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Munteanu', 'Romulus', TO_DATE('1988/07/17', 'yyyy/mm/dd'), '0741068396', TO_DATE('2022/05/11', 'yyyy/mm/dd'), 12500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Patrascu', 'Florin', TO_DATE('1983/04/17', 'yyyy/mm/dd'), '0745196482', TO_DATE('2022/04/13', 'yyyy/mm/dd'), 11000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Ochiana', 'Simona', TO_DATE('1986/02/13', 'yyyy/mm/dd'), '0782587299', TO_DATE('2022/11/02', 'yyyy/mm/dd'), 14000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Popa', 'Cezara', TO_DATE('1990/09/21', 'yyyy/mm/dd'), '0751074467', TO_DATE('2023/12/02', 'yyyy/mm/dd'), 14000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Castravet', 'Ion', TO_DATE('1992/02/12', 'yyyy/mm/dd'), '0751281457', TO_DATE('2024/05/12', 'yyyy/mm/dd'), 17000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Iordache', 'Flavius', TO_DATE('1989/07/18', 'yyyy/mm/dd'), '0784632757', TO_DATE('2024/05/12', 'yyyy/mm/dd'), 12500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Besliu', 'Geanina', TO_DATE('1987/02/24', 'yyyy/mm/dd'), '0736332588', TO_DATE('2023/06/13', 'yyyy/mm/dd'), 15000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Besliu', 'Madalina', TO_DATE('1983/04/26', 'yyyy/mm/dd'), '0776298452', TO_DATE('2022/04/10', 'yyyy/mm/dd'), 15000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Atanasoae', 'Ionut', TO_DATE('1989/05/19', 'yyyy/mm/dd'), '0712559796', TO_DATE('2021/03/12', 'yyyy/mm/dd'), 12500);
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- asistent medicali
INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Bujor', 'Iuliana', TO_DATE('1989/06/19', 'yyyy/mm/dd'), '0715214364', TO_DATE('2021/03/12', 'yyyy/mm/dd'), 5000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Cojocaru', 'Camelia', TO_DATE('1989/03/17', 'yyyy/mm/dd'), '0790361357', TO_DATE('2020/05/09', 'yyyy/mm/dd'), 4800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Tomac', 'Iurie', TO_DATE('1976/03/04', 'yyyy/mm/dd'), '0726634107', TO_DATE('2008/09/01', 'yyyy/mm/dd'), 4800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Ilie', 'Marian', TO_DATE('1989/02/14', 'yyyy/mm/dd'), '0731537535', TO_DATE('2021/03/16', 'yyyy/mm/dd'), 6000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Lazar', 'Tudor', TO_DATE('1987/10/08', 'yyyy/mm/dd'), '0755346116', TO_DATE('2024/11/11', 'yyyy/mm/dd'), 6500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Luca', 'Alexandru', TO_DATE('1991/10/09', 'yyyy/mm/dd'), '0741088619', TO_DATE('2024/05/13', 'yyyy/mm/dd'), 5000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Maftei', 'Radu', TO_DATE('1991/07/02', 'yyyy/mm/dd'), '0748058812', TO_DATE('2023/02/23', 'yyyy/mm/dd'), 6800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Mogos', 'Raluca', TO_DATE('1990/05/12', 'yyyy/mm/dd'), '0760668971', TO_DATE('2022/12/22', 'yyyy/mm/dd'), 5400);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Toma', 'Bogdan', TO_DATE('1992/10/11', 'yyyy/mm/dd'), '0768992237', TO_DATE('2021/10/11', 'yyyy/mm/dd'),5000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Rosu', 'Radu', TO_DATE('1990/07/12', 'yyyy/mm/dd'), '0765982894', TO_DATE('2022/11/21', 'yyyy/mm/dd'), 4800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Tanase', 'Adina', TO_DATE('1992/08/02', 'yyyy/mm/dd'), '0728257769', TO_DATE('2021/09/01', 'yyyy/mm/dd'), 4800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Boboc', 'Andreea', TO_DATE('1987/03/12', 'yyyy/mm/dd'), '0718714101', TO_DATE('2021/09/16', 'yyyy/mm/dd'), 5000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Toma', 'Loredana', TO_DATE('1984/02/09', 'yyyy/mm/dd'), '0773060228', TO_DATE('2022/10/21', 'yyyy/mm/dd'), 6000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Vieru', 'Razvan', TO_DATE('1989/02/12', 'yyyy/mm/dd'), '0781905483', TO_DATE('2022/08/30', 'yyyy/mm/dd'), 6000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Vasile', 'Cristina', TO_DATE('1993/12/12', 'yyyy/mm/dd'), '0798360671', TO_DATE('2022/03/02', 'yyyy/mm/dd'), 6000);
-------------------------------------------------------------------------------------------------------------------------------------------------------
-- personal nemedical
INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Visli', 'Mariana', TO_DATE('1994/11/22', 'yyyy/mm/dd'), '0775383475', TO_DATE('2008/09/01', 'yyyy/mm/dd'), 3800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Acsinte', 'Vlad', TO_DATE('1993/12/21', 'yyyy/mm/dd'), '0738800993', TO_DATE('2010/01/10', 'yyyy/mm/dd'), 4000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Adam', 'Mihaela', TO_DATE('1990/10/10', 'yyyy/mm/dd'), '0736908403', TO_DATE('2023/07/22', 'yyyy/mm/dd'), 3800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Lupu', 'Ana', TO_DATE('1989/03/08', 'yyyy/mm/dd'), '0736848609', TO_DATE('2023/07/22', 'yyyy/mm/dd'), 3500);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Alexa', 'Laura', TO_DATE('1983/08/02', 'yyyy/mm/dd'), '0722053435', TO_DATE('2019/08/02', 'yyyy/mm/dd'), 4000);
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- personal administrativ
INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Alexa', 'Rodica', TO_DATE('1991/05/17', 'yyyy/mm/dd'), '0752491721', TO_DATE('2018/10/11', 'yyyy/mm/dd'), 17000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Cozorici', 'Monica', TO_DATE('1990/10/19', 'yyyy/mm/dd'), '0718452815', TO_DATE('2024/03/01', 'yyyy/mm/dd'), 6300);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Stan', 'Iuliana', TO_DATE('1991/01/10', 'yyyy/mm/dd'), '0756968017', TO_DATE('2024/03/01', 'yyyy/mm/dd'), 10000);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Banu', 'Corina', TO_DATE('1990/01/11', 'yyyy/mm/dd'), '0798400266', TO_DATE('2020/10/21', 'yyyy/mm/dd'), 7800);

INSERT INTO angajati_ras
VALUES (secv_id_angajat.NEXTVAL, 'Berea', 'Grigore', TO_DATE('1991/09/04', 'yyyy/mm/dd'), '0755641392', TO_DATE('2021/08/17', 'yyyy/mm/dd'), 9900);


------------------------------------------------------------------------------------
CREATE SEQUENCE secv_id_medic
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
NOCACHE;

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 4);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 2, 4);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 1);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 1, 1);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 2, 3);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 3);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 3);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 2, 2);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 2);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 5);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 5);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 6);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 4, 1);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 4);

INSERT INTO medici_ras
VALUES (secv_id_medic.NEXTVAL, 3, 1);
-----------------------------------------------------------------------------
CREATE SEQUENCE secv_id_asis
START WITH 16
INCREMENT BY 1
MINVALUE 16
MAXVALUE 30
NOCYCLE
NOCACHE;

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 1);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 1);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 1);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 1);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 2);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 2);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 3);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 3);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 3);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 4);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 4);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 4);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 5);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 5);

INSERT INTO asistenti_medicali_ras
VALUES (secv_id_asis.NEXTVAL, 6);

------------------------------------------------------------------------

CREATE SEQUENCE secv_id_nemed
START WITH 31
INCREMENT BY 1
MINVALUE 31
MAXVALUE 35
NOCYCLE
NOCACHE;

INSERT INTO personal_nemedical_ras
VALUES (secv_id_nemed.NEXTVAL);

INSERT INTO personal_nemedical_ras
VALUES (secv_id_nemed.NEXTVAL);

INSERT INTO personal_nemedical_ras
VALUES (secv_id_nemed.NEXTVAL);

INSERT INTO personal_nemedical_ras
VALUES (secv_id_nemed.NEXTVAL);

INSERT INTO personal_nemedical_ras
VALUES (secv_id_nemed.NEXTVAL);

-------------------------------------------------------------------------------------

CREATE SEQUENCE secv_id_adm
START WITH 36
INCREMENT BY 1
MINVALUE 36
MAXVALUE 40
NOCYCLE
NOCACHE;

INSERT INTO  personal_administrativ_ras
VALUES (secv_id_adm.NEXTVAL);

INSERT INTO  personal_administrativ_ras
VALUES (secv_id_adm.NEXTVAL);

INSERT INTO  personal_administrativ_ras
VALUES (secv_id_adm.NEXTVAL);

INSERT INTO  personal_administrativ_ras
VALUES (secv_id_adm.NEXTVAL);

INSERT INTO  personal_administrativ_ras
VALUES (secv_id_adm.NEXTVAL);

------------------------------------------------------------------------------

INSERT INTO camere_ras
VALUES (1, 1, 1);

INSERT INTO camere_ras
VALUES (2, 6, 1);

INSERT INTO camere_ras
VALUES (3, 6, 1);

INSERT INTO camere_ras
VALUES (1, 1, 2);

INSERT INTO camere_ras
VALUES (2, 3, 2);

INSERT INTO camere_ras
VALUES (3, 4, 2);

INSERT INTO camere_ras
VALUES (1, 1, 3);

INSERT INTO camere_ras
VALUES (2, 1, 3);

INSERT INTO camere_ras
VALUES (3, 2, 3);

INSERT INTO camere_ras
VALUES (1, 2, 4);

INSERT INTO camere_ras
VALUES (2, 5, 4);

INSERT INTO camere_ras
VALUES (3, 5, 4);

INSERT INTO camere_ras
VALUES (1, 3, 5);

INSERT INTO camere_ras
VALUES (2, 3, 5);

INSERT INTO camere_ras
VALUES (3, 4, 5);

INSERT INTO camere_ras
VALUES (1, 3, 6);

INSERT INTO camere_ras
VALUES (2, 1, 6);

INSERT INTO camere_ras
VALUES (3, 2, 6);
-----------------------------------------------------------------------------------------

INSERT INTO personal_resp_etaj_ras
VALUES (31, 1, TO_DATE('2023/10/23', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (31, 4, TO_DATE('2024/12/13', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (31, 6, TO_DATE('2024/03/04', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (32, 2, TO_DATE('2022/05/17', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (32, 3, TO_DATE('2021/02/21', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (33, 3, TO_DATE('2024/08/09', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (33, 4, TO_DATE('2024/09/03', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (33, 5, TO_DATE('2024/10/25', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (34, 2, TO_DATE('2024/08/02', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (34, 4, TO_DATE('2024/11/26', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (34, 1, TO_DATE('2024/09/22', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (35, 3, TO_DATE('2023/10/22', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (35, 2, TO_DATE('2023/07/02', 'yyyy/mm/dd'));
INSERT INTO personal_resp_etaj_ras
VALUES (35, 5, TO_DATE('2024/09/22', 'yyyy/mm/dd'));

---------------------------------------------------------------------------------

INSERT INTO pacienti_ras
VALUES (1, '5241226155713', 'Sava', 'Ion', TO_DATE('2000/07/02', 'yyyy/mm/dd'), '0722568199');

INSERT INTO pacienti_ras
VALUES (2, '5241226152670', 'Preda', 'Maria', TO_DATE('2012/04/22', 'yyyy/mm/dd'), '0750232000');

INSERT INTO pacienti_ras
VALUES (3, '5170326156302', 'Enache', 'Ana', TO_DATE('1987/11/24', 'yyyy/mm/dd'), '0721886095');

INSERT INTO pacienti_ras
VALUES (4, '5170326155650', 'Pop', 'Alina', TO_DATE('1995/04/19', 'yyyy/mm/dd'), '0723355309');

INSERT INTO pacienti_ras
VALUES (5, '5170326157865', 'Pop', 'Alex', TO_DATE('2000/08/28', 'yyyy/mm/dd'), '0745337969');

INSERT INTO pacienti_ras
VALUES (6, '5170326156322', 'Pop', 'Alex', TO_DATE('1997/12/14', 'yyyy/mm/dd'), '0753662812');

INSERT INTO pacienti_ras
VALUES (7, '5170826156322', 'Popa', 'Miruna', TO_DATE('1999/09/23', 'yyyy/mm/dd'), '0758962812');
-----------------------------------------------------------------------------------------------------------

INSERT INTO pacienti_aleg_analize_ras
VALUES (1, 1, TO_DATE('2024/12/23', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (1, 3, TO_DATE('2024/12/23', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (1, 5, TO_DATE('2023/08/20', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (1, 7, TO_DATE('2022/10/29', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 2, TO_DATE('2024/10/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 4, TO_DATE('2024/10/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 6, TO_DATE('2024/10/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 2, TO_DATE('2024/12/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 4, TO_DATE('2024/12/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 6, TO_DATE('2024/12/14', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 2, TO_DATE('2023/03/09', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 4, TO_DATE('2023/02/08', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (2, 6, TO_DATE('2023/04/12', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (3, 7, TO_DATE('2024/11/04', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (3, 3, TO_DATE('2024/11/04', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (3, 6, TO_DATE('2024/08/12', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (4, 1, TO_DATE('2022/07/10', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (4, 1, TO_DATE('2024/03/22', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (4, 6, TO_DATE('2024/12/28', 'yyyy/mm/dd'));

INSERT INTO pacienti_aleg_analize_ras
VALUES (4, 4, TO_DATE('2024/08/07', 'yyyy/mm/dd'));

-------------------------------------------------------------------------------------------------

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (1, 1, 10);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (1, 2, 8);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (1, 3, 7);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (2, 1, 10);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (2, 5, 4);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (2, 4, 8);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (3, 3, 7);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (3, 2, 3);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (3, 4, 9);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (4, 1, 6);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (4, 2, 10);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (4, 5, 4);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (5, 5, 10);

INSERT INTO pacienti_vorbesc_limbi_ras
VALUES (5, 1, 2);

----------------------------------------------------------------------------------------

INSERT INTO istoric_medical_ras
VALUES (1, 1, 'amigdalita', 'tratat');

INSERT INTO istoric_medical_ras
VALUES (2, 1, 'anemie', 'sub observatie');

INSERT INTO istoric_medical_ras
VALUES (3, 1, 'apnee', 'sub observatie');

INSERT INTO istoric_medical_ras
VALUES (4, 2, 'apendicita', 'tratat');

INSERT INTO istoric_medical_ras
VALUES (5, 3, 'dermatita seboreica', 'sub observatie');

INSERT INTO istoric_medical_ras
VALUES (6, 3, 'acnee vulgara', 'tratat');

INSERT INTO istoric_medical_ras
VALUES (7, 5, 'raceala', 'tratat');

----------------------------------------------------------------------------------

DECLARE
    i NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO angajati_vorbesc_limbi_ras
        VALUES (i, 1, 10);
        i := i + 1;
        EXIT WHEN i > 40;
    END LOOP;
END;
/

DECLARE
    i NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO angajati_vorbesc_limbi_ras
        VALUES (i, 2, 9);
        i := i + 3;
        EXIT WHEN i > 40;
    END LOOP;
END;
/

DECLARE
    i NUMBER := 2;
BEGIN
    LOOP
        INSERT INTO angajati_vorbesc_limbi_ras
        VALUES (i, 2, 8);
        i := i + 3;
        EXIT WHEN i > 40;
    END LOOP;
END;
/

DECLARE
    i NUMBER := 3;
BEGIN
    LOOP
        INSERT INTO angajati_vorbesc_limbi_ras
        VALUES (i, 5, 9);
        i := i + 3;
        EXIT WHEN i > 40;
    END LOOP;
END;
/


INSERT INTO angajati_vorbesc_limbi_ras
VALUES (1, 5, 10);

INSERT INTO angajati_vorbesc_limbi_ras
VALUES (36, 4, 10);

INSERT INTO angajati_vorbesc_limbi_ras
VALUES (39, 4, 7);

--------------------------------------------------------------------------------------

INSERT INTO pacient_medic_proced_ras
VALUES (1, 1, 6, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 1, 7, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 3, 6, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 3, 7, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 4, 6, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 4, 7, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 5, 6, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (1, 5, 7, 5, TO_DATE('2024/08/17', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (2, 2, 9, 1, TO_DATE('2024/11/03', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (3, 3, 15, 7, TO_DATE('2024/03/04', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (4, 3, 3, 7, TO_DATE('2024/03/04', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (5, 3, 4, 7, TO_DATE('2024/03/04', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (6, 3, 13, 7, TO_DATE('2024/03/04', 'yyyy/mm/dd'));

INSERT INTO pacient_medic_proced_ras
VALUES (7, 3, 9, 2, SYSDATE);

INSERT INTO pacient_medic_proced_ras
VALUES (7, 3, 9, 1, SYSDATE);


COMMIT;

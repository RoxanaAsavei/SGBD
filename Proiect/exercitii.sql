-- cerinta 4

CREATE TABLE analize_ras 
            (id NUMBER PRIMARY KEY,
             denumire VARCHAR2(50) NOT NULL,
             pret NUMBER NOT NULL,
             timp_prelucrare NUMBER);
             
CREATE TABLE calificare_ras
            (id NUMBER PRIMARY KEY,
            denumire VARCHAR2(30) NOT NULL);

CREATE TABLE limba_ras
            (id NUMBER PRIMARY KEY,
             acronim VARCHAR2(3) NOT NULL);
             
CREATE TABLE sectie_ras
            (id NUMBER PRIMARY KEY,
            denumire VARCHAR2(30) NOT NULL);
            
CREATE TABLE proceduri_ras
            (id NUMBER PRIMARY KEY,
            denumire VARCHAR2(50) NOT NULL,
            id_sectie NUMBER CONSTRAINT fk_proced_sectie REFERENCES sectie_ras(id) ON DELETE CASCADE,
            pret NUMBER DEFAULT 100,
            durata NUMBER);
            
CREATE TABLE pacienti_ras
            (id NUMBER PRIMARY KEY,
             cnp VARCHAR2(13) UNIQUE NOT NULL,
             nume VARCHAR2(30),
             prenume VARCHAR2(30),
             data_nasterii DATE,
             telefon VARCHAR2(15));
             
CREATE TABLE angajati_ras
            (id NUMBER PRIMARY KEY,
            nume VARCHAR2(30),
            prenume VARCHAR2(30),
            data_nasterii DATE,
            telefon VARCHAR2(15),
            data_angajarii DATE DEFAULT SYSDATE,
            salariu NUMBER);
            
CREATE TABLE medici_ras
            (id NUMBER PRIMARY KEY CONSTRAINT fk_medici_ang REFERENCES angajati_ras(id) ON DELETE CASCADE,
            id_calificare CONSTRAINT fk_medici_calif REFERENCES calificare_ras(id) ON DELETE SET NULL,
            id_sectie CONSTRAINT fk_medici_sectie REFERENCES sectie_ras(id) ON DELETE SET NULL);

CREATE TABLE asistenti_medicali_ras
            (id NUMBER PRIMARY KEY CONSTRAINT fk_asist_medicali REFERENCES angajati_ras(id) ON DELETE CASCADE,
            id_sectie CONSTRAINT fk_asist_medicali_sectie REFERENCES sectie_ras(id) ON DELETE SET NULL);
            
CREATE TABLE personal_nemedical_ras
            (id NUMBER PRIMARY KEY CONSTRAINT fk_nemedical REFERENCES angajati_ras(id) ON DELETE CASCADE);

CREATE TABLE personal_administrativ_ras
            (id NUMBER PRIMARY KEY CONSTRAINT fk_adminsitrativ REFERENCES angajati_ras(id) ON DELETE CASCADE);

CREATE TABLE angajati_vorbesc_limbi_ras
            (id_angajat CONSTRAINT fk_anglimba_ang REFERENCES angajati_ras(id) ON DELETE CASCADE,
            id_limba CONSTRAINT fk_anglimba_limba REFERENCES limba_ras(id) ON DELETE CASCADE,
            nivel NUMBER CHECK (nivel >= 1 AND nivel <= 10),
            CONSTRAINT pk_ang_vorbesc_limbi PRIMARY KEY (id_angajat, id_limba)
            );
            
CREATE TABLE pacienti_vorbesc_limbi_ras
            (id_pacient CONSTRAINT fk_pacientlimba_ang REFERENCES pacienti_ras(id) ON DELETE CASCADE,
            id_limba CONSTRAINT fk_pacientlimba_limba REFERENCES limba_ras(id) ON DELETE CASCADE,
            nivel NUMBER CHECK (nivel >= 1 AND nivel <= 10),
            CONSTRAINT pk_pacienti_vorbesc_limbi PRIMARY KEY (id_pacient, id_limba)
            );
            
CREATE TABLE pacienti_aleg_analize_ras
            (id_pacient CONSTRAINT fk_pacientanalize_pacient REFERENCES pacienti_ras(id) ON DELETE CASCADE,
             id_analiza CONSTRAINT fk_pacientanalize_analiza REFERENCES analize_ras(id) ON DELETE CASCADE,
             data DATE DEFAULT SYSDATE,
             CONSTRAINT pk_pacienti_analize PRIMARY KEY (id_pacient, id_analiza, data)
            );

CREATE TABLE pacient_medic_proced_ras
            (id NUMBER,
             id_pacient CONSTRAINT fk_pacientproced_pacient REFERENCES pacienti_ras(id)ON DELETE CASCADE,
             id_medic CONSTRAINT fk_pacientproced_medic REFERENCES medici_ras(id) ON DELETE CASCADE, 
             id_proced CONSTRAINT fk_pacienproced_proced REFERENCES proceduri_ras(id) ON DELETE CASCADE,
             data DATE DEFAULT SYSDATE,
             CONSTRAINT pk_pacient_medic_proced PRIMARY KEY (id, id_pacient, id_medic, id_proced)
            );
            
CREATE TABLE etaj_ras
            (id NUMBER PRIMARY KEY,
             nume VARCHAR2(30) NOT NULL);
             
CREATE TABLE personal_resp_etaj_ras
            (id_personal CONSTRAINT fk_personaletaj_personal REFERENCES personal_nemedical_ras(id) ON DELETE CASCADE,
            id_etaj CONSTRAINT fk_personaletaj_etaj REFERENCES etaj_ras(id) ON DELETE CASCADE,
            data_repartizarii DATE DEFAULT SYSDATE,
            CONSTRAINT pk_personaletaj PRIMARY KEY(id_personal, id_etaj));
            
CREATE TABLE camere_ras -- entitate dependenta de etaj
            (id NUMBER,
             id_sectie CONSTRAINT fk_camere_sectie REFERENCES sectie_ras(id) ON DELETE SET NULL,
             id_etaj CONSTRAINT fk_camere_etaj REFERENCES etaj_ras(id) ON DELETE CASCADE,
             CONSTRAINT pk_camere PRIMARY KEY (id, id_etaj));
             
CREATE TABLE istoric_medical_ras
            (id NUMBER PRIMARY KEY,
             id_pacient CONSTRAINT fk_istoric_pacient REFERENCES pacienti_ras(id) ON DELETE CASCADE,
             afectiune VARCHAR2(50),
             status VARCHAR2(30));

ALTER TABLE  proceduri_ras
DROP COLUMN durata;

ALTER TABLE proceduri_ras
ADD (durata VARCHAR2(10));

-- cerinta 5

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

-- cerinta 6
/*
Scrie?i un program stocat care, pe baza unui id al unei limbi, insereaz?
în tabelul compatibili_lingvistic (nume_sectie, lista_medici, lista_asistenti_medicali).
Tabelul re?ine pentru fiecare sec?ie lista medicilor, respectiv a asisten?ilor medicali
(numele lor) care vorbesc limba cu id-ul dat ca parametru. În cazul în care pentru o 
sec?ie nu exist? niciun medic / asistent medical care vorbe?te limba respectiv? tabelul 
va con?ine, textul ‘Niciun medic / asistent nu vorbeste limba’, dup? caz.
*/

SET SERVEROUTPUT ON;

CREATE OR REPLACE TYPE tablou_pers IS TABLE OF VARCHAR2(100);
/

CREATE TABLE compatibili_lingvistic 
             (nume_sectie VARCHAR2(50),
             lista_medici tablou_pers,
             lista_asistenti_medicali tablou_pers
             )
             NESTED TABLE lista_medici STORE AS tabl_medici
             NESTED TABLE lista_asistenti_medicali STORE AS tabl_asist;
/

CREATE OR REPLACE PROCEDURE cer6_ras(v_id limba_ras.id%TYPE)
IS
    TYPE tablou_sectii IS TABLE OF sectie_ras%ROWTYPE INDEX BY PLS_INTEGER;  
    sectii tablou_sectii;
    medici tablou_pers := tablou_pers();
    asistenti tablou_pers := tablou_pers();
    niciun_medic tablou_pers := tablou_pers();
    niciun_asist tablou_pers := tablou_pers();
    ct_medici NUMBER;
    ct_asist NUMBER;
    TYPE niciun_vorbitor IS VARRAY(10) OF sectie_ras.denumire%TYPE;
    sectii_neacces niciun_vorbitor := niciun_vorbitor();
    linie limba_ras%ROWTYPE;
BEGIN
    -- verificam daca codul dat ca parametru exista in baza de date
    SELECT *
    INTO linie
    FROM limba_ras
    WHERE  id = v_id;
    
    niciun_medic.EXTEND;
    niciun_medic(1) := 'Niciun medic nu vorbeste limba';
    
    niciun_asist.EXTEND;
    niciun_asist(1) := 'Niciun asistent nu vorbeste limba';

    -- luam toate sectiile
    SELECT *
    BULK COLLECT INTO sectii
    FROM sectie_ras;
    
    -- pentru fiecare sectie luam medicii care vorbesc limba respectiva
    FOR i IN 1..sectii.COUNT LOOP
        -- numaram medicii de pe sectie care vorbesc limba data
        SELECT COUNT(a.nume)
        INTO ct_medici
        FROM medici_ras m JOIN angajati_vorbesc_limbi_ras ang ON (m.id = ang.id_angajat)
             JOIN angajati_ras a ON (a.id = m.id)
        WHERE m.id_sectie = sectii(i).id AND ang.id_limba = v_id;
        
        IF ct_medici > 0 THEN 
            SELECT a.nume
            BULK COLLECT INTO medici
            FROM medici_ras m JOIN angajati_vorbesc_limbi_ras ang ON (m.id = ang.id_angajat)
                 JOIN angajati_ras a ON (a.id = m.id)
            WHERE m.id_sectie = sectii(i).id AND ang.id_limba = v_id;
        ELSE 
            medici := niciun_medic;
        END IF;
        
        -- numaram asistentii de pe sectie care vorbesc limba data
        SELECT COUNT (a.nume)
        INTO ct_asist
        FROM asistenti_medicali_ras asist JOIN angajati_vorbesc_limbi_ras ang ON (asist.id = ang.id_angajat)
             JOIN angajati_ras a ON (a.id = asist.id)
        WHERE asist.id_sectie = sectii(i).id AND ang.id_limba = v_id;
        
        IF ct_asist > 0 THEN
            SELECT a.nume
            BULK COLLECT INTO asistenti
            FROM asistenti_medicali_ras asist JOIN angajati_vorbesc_limbi_ras ang ON (asist.id = ang.id_angajat)
                 JOIN angajati_ras a ON (a.id = asist.id)
            WHERE asist.id_sectie = sectii(i).id AND ang.id_limba = v_id;
        ELSE 
            asistenti := niciun_asist;
        END IF;
        
        -- inseram in tabel
        INSERT INTO compatibili_lingvistic
        VALUES (sectii(i).denumire, medici, asistenti);
        
        IF ct_medici = 0 AND ct_asist = 0 THEN
            sectii_neacces.EXTEND;
            sectii_neacces(sectii_neacces.LAST) := sectii(i).denumire;
        END IF;
        
    END LOOP;
    
    -- daca exista sectii neaccesibile, le afisam
    IF sectii_neacces.COUNT > 0 THEN 
    DBMS_OUTPUT.PUT_LINE('La urmatoarele sectii nu exista niciun vorbitor al limbii date: ');
        FOR i IN  sectii_neacces.FIRST..sectii_neacces.LAST LOOP 
            DBMS_OUTPUT.PUT_LINE(sectii_neacces(i) || ' ');
        END LOOP;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002,'Codul dat nu exista');
END cer6_ras;
/


BEGIN
    cer6_ras(2);
END;
/

SELECT *
FROM compatibili_lingvistic;

-- stergem inserarile anterioare
DELETE FROM compatibili_lingvistic;

BEGIN
    cer6_ras(3);
END;
/

SELECT *
FROM compatibili_lingvistic;

-- stergem inseratile anterioare
DELETE FROM compatibili_lingvistic;

BEGIN
    cer6_ras(10);
END;
/

-- cerinta 7
/*
Se cite?te de la tastatur? o calificare. S? se afi?eze medicii care
au calificarea respectiv? ?i pentru fiecare medic, lista pacien?ilor 
asupra c?rora au realizat proceduri. În cazul în care un medic nu a 
realizat proceduri asupra niciunui pacient, se va afi?a textul ‘Niciun pacient’.
*/

SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION exista_calificare(calif calificare_ras.denumire%TYPE) RETURN NUMBER
IS
    ct NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO ct
    FROM calificare_ras
    WHERE UPPER(calif) = UPPER(denumire);
    
    IF ct > 0 THEN 
        RETURN 1;
    ELSE 
        RETURN 0;
    END IF;
END exista_calificare;
/

CREATE OR REPLACE PROCEDURE cer7_ras
IS
    TYPE lista_medici IS REF CURSOR;
    medici lista_medici;
    v_calificare calificare_ras.denumire%TYPE := '&p_calificare';
    CURSOR pacienti(v_id_medic pacient_medic_proced_ras.id_medic%TYPE) IS
        SELECT DISTINCT p.id, p.nume, p.prenume
        FROM pacient_medic_proced_ras asoc JOIN pacienti_ras p ON (asoc.id_pacient = p.id)
        WHERE asoc.id_medic = v_id_medic;
    v_id_m medici_ras.id%TYPE;
    v_nume_m angajati_ras.nume%TYPE;
    v_prenume_m angajati_ras.prenume%TYPE;
    v_id_p pacienti_ras.id%TYPE;
    v_nume_p pacienti_ras.nume%TYPE;
    v_prenume_p pacienti_ras.prenume%TYPE;
    calif_inex EXCEPTION;
    zero_medici EXCEPTION;
    exista NUMBER;
BEGIN
    exista := exista_calificare(v_calificare);
    IF  exista = 0 THEN
        RAISE calif_inex;
    END IF;
    -- selectam medicii cu calificarea data
    OPEN medici FOR
        'SELECT m.id, a.nume, a.prenume
        FROM medici_ras m JOIN angajati_ras a ON (m.id = a.id)
             JOIN calificare_ras c ON (m.id_calificare = c.id)
        WHERE UPPER(c.denumire) = UPPER(:v)'
        USING v_calificare;
     FETCH medici INTO v_id_m, v_nume_m, v_prenume_m;
     IF medici%NOTFOUND THEN 
        RAISE zero_medici;
     END IF;
    --- parcurgem medicii 
    LOOP
        DBMS_OUTPUT.PUT('Medicul ' || v_nume_m || ' ' || v_prenume_m);
        OPEN pacienti(v_id_m);
        FETCH pacienti INTO v_id_p, v_nume_p, v_prenume_p;
        IF pacienti%NOTFOUND THEN 
            DBMS_OUTPUT.PUT_LINE(' nu a facut proceduri asupra niciunui pacient');
        ELSE 
            DBMS_OUTPUT.PUT_LINE(' a facut proceduri asupra urmatorilor pacienti: ');
            WHILE pacienti%FOUND LOOP
                DBMS_OUTPUT.PUT_LINE(v_nume_p || ' ' || v_prenume_p);
                FETCH pacienti INTO v_id_p, v_nume_p, v_prenume_p;
            END LOOP; 
        END IF;
        CLOSE pacienti;
        DBMS_OUTPUT.PUT_LINE('------------------------------------------------');
        FETCH medici INTO v_id_m, v_nume_m, v_prenume_m;
        EXIT WHEN medici%NOTFOUND;
    END LOOP;
    CLOSE medici;
EXCEPTION
    WHEN calif_inex THEN
        RAISE_APPLICATION_ERROR(-20002, 'Calificarea nu exista');
    WHEN zero_medici THEN 
        RAISE_APPLICATION_ERROR(-20003, 'Nu exista medici cu calificarea data');
END cer7_ras;
/

BEGIN 
    cer7_ras;
END;
/

-- cerinta 8
/*
Scrie?i o func?ie care prime?te numele unei analize ?i returneaz? numele
?i prenumele pacientului ?i-a f?cut analiza respectiv? de un num?r maxim
de ori. Se vor trata cazul în care analiza nu exist?, analiza nu a fost 
aleas? de nimeni, dar ?i cazul în care mai mul?i pacien?i au ales analiza
de un num?r maxim de ori.
*/

SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE FUNCTION cer8_ras(v_nume_analiza analize_ras.denumire%TYPE)
        RETURN VARCHAR2
IS
    nume_p pacienti_ras.nume%TYPE;
    prenume_p pacienti_ras.prenume%TYPE;
    val_max NUMBER;
    ans VARCHAR2(100);
    v_id analize_ras.id%TYPE;
    nimeni EXCEPTION;
    ct NUMBER;
BEGIN 
    
    SELECT id
    INTO v_id
    FROM analize_ras
    WHERE UPPER(denumire) = UPPER(v_nume_analiza);
    
    SELECT COUNT(*)
    INTO ct 
    FROM pacienti_aleg_analize_ras
    WHERE id_analiza = v_id;
    
    IF ct = 0 THEN
        RAISE nimeni;
    END IF;
    -- calculam maximul
    SELECT MAX(COUNT(*))
    INTO val_max
    FROM analize_ras a JOIN pacienti_aleg_analize_ras asoc ON (a.id = asoc.id_analiza)
    WHERE UPPER(a.denumire) = UPPER(v_nume_analiza)
    GROUP BY asoc.id_pacient;
    
    -- selectam pacientul care a facut analiza de un numar maxim de ori 
    SELECT p.nume, p.prenume
    INTO nume_p, prenume_p
    FROM analize_ras a JOIN pacienti_aleg_analize_ras asoc ON (a.id = asoc.id_analiza)
         JOIN pacienti_ras p ON (asoc.id_pacient = p.id)
    WHERE UPPER(a.denumire) = UPPER(v_nume_analiza) 
    GROUP BY p.id, p.nume, p.prenume
    HAVING COUNT(a.id) = val_max;

    ans := nume_p || ' ' || prenume_p;
    RETURN ans;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Nu exista analiza data');
    WHEN nimeni THEN
        RAISE_APPLICATION_ERROR(-20003, 'Niciun pacient nu a ales analiza data');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Mai multi pacienti au ales analiza de un numar maxim de ori');
END cer8_ras;
/

-- Preda Maria
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pacientul care a ales analiza de un numar maxim de ori este ' || cer8_ras('Numaratoare reticulocite'));
END;
/

-- mai multi pacienti
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pacientul care a ales analiza de un numar maxim de ori este ' || cer8_ras('Osteocalcin'));
END;
/

-- analiza nu exista
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pacientul care a ales analiza de un numar maxim de ori este ' || cer8_ras('Colesterol'));
END;
/

-- analiza nu a fost aleasa de nimeni 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Pacientul care a ales analiza de un numar maxim de ori este ' || cer8_ras('Glicemie'));
END;
/

-- cerinta 9
/*
Fiind date numele ?i prenumele unui pacient, s? se afi?eze numele tuturor
etajelor corespunz?toare sec?iilor la care a realizat proceduri.
*/

SET SERVEROUTPUT ON;
SET VERIFY OFF;

CREATE OR REPLACE PROCEDURE cer9_ras (v_nume pacienti_ras.nume%TYPE, v_prenume pacienti_ras.prenume%TYPE)
IS
    v_id pacienti_ras.id%TYPE;
    TYPE tablou_imbr IS TABLE OF etaj_ras.nume%TYPE;
    etaje tablou_imbr := tablou_imbr();
    zero_proceduri EXCEPTION;
    date_invalide EXCEPTION;
    ct NUMBER;
BEGIN

    IF LENGTH(v_nume) < 3 OR LENGTH(v_prenume) < 3 THEN
        RAISE date_invalide;
    END IF;
    -- selectam id-ul pacientului
    SELECT id
    INTO v_id
    FROM pacienti_ras
    WHERE UPPER(nume) = UPPER(v_nume) AND UPPER(prenume) = UPPER(v_prenume);
    
    -- verificam daca pacientul a facut vreo procedura
    SELECT COUNT(*)
    INTO ct
    FROM pacient_medic_proced_ras
    WHERE id_pacient = v_id;
    
    IF ct = 0 THEN 
        RAISE zero_proceduri;
    END IF;
    
    SELECT DISTINCT e.nume
    BULK COLLECT INTO etaje
    FROM pacient_medic_proced_ras asoc JOIN proceduri_ras p ON (asoc.id_proced = p.id)
        JOIN sectie_ras s ON (p.id_sectie = s.id)
        JOIN  camere_ras c ON (s.id = c.id_sectie)
        JOIN etaj_ras e ON (e.id = c.id_etaj)
    WHERE asoc.id_pacient = v_id;
    
    FOR i IN etaje.FIRST..etaje.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(etaje(i) || ' ');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Nu exista niciun pacient cu numele dat');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Exista mai multi pacienti cu acest nume');
    WHEN zero_proceduri THEN
        RAISE_APPLICATION_ERROR(-20004, 'Pacientul nu a avut nicio procedura');
    WHEN date_invalide THEN 
        RAISE_APPLICATION_ERROR(-20005, 'Numele / prenumele introdus este prea scurt!');
END cer9_ras;
/

BEGIN 
    cer9_ras('Enache', 'Ana');
END;
/

BEGIN 
    cer9_ras('Pop', 'Alex');
END;
/

BEGIN
    cer9_ras('Popa', 'Miruna');
END;
/

BEGIN
    cer9_ras('Dumitrescu', 'Ni');
END;
/

BEGIN 
    cer9_ras('Sava', 'Matei');
END;
/

-- cerinta 10
/*
Implementa?i, cu ajutorul triggerilor, urm?toarea restric?ie: 
o sec?ie nu poate avea mai mult de 3 camere pe un etaj.
*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE pachet_ras
AS 
    TYPE linie IS RECORD 
    (id_sectie camere_ras.id_sectie%TYPE,
    id_etaj camere_ras.id_etaj%TYPE,
     ct_camere NUMBER);
     TYPE tabl_ind IS TABLE OF linie 
            INDEX BY PLS_INTEGER;
    info tabl_ind;
    contor NUMBER := 0;
END pachet_ras;
/

CREATE OR REPLACE TRIGGER max_3camere_comanda
BEFORE INSERT OR UPDATE OF id_etaj, id_sectie ON camere_ras
BEGIN
        pachet_ras.contor := 0;
        -- cate camere are sectia aia pe etajul dat
        SELECT id_sectie, id_etaj, COUNT(*)
        BULK COLLECT INTO pachet_ras.info
        FROM camere_ras
        GROUP BY id_sectie, id_etaj;
        
        DBMS_OUTPUT.PUT_LINE('S-a activat triggerul la nivel de comanda');
    
END;
/

CREATE OR REPLACE TRIGGER max_3camere_linie
BEFORE INSERT OR UPDATE OF id_etaj, id_sectie ON camere_ras
FOR EACH ROW

DECLARE
    -- verificari input
    ct_etaj NUMBER;
    etaj_inexistent EXCEPTION;
    ct_sectie NUMBER;
    sectie_inexistenta EXCEPTION;
    -- variabile trigger    
    nume_sectie sectie_ras.denumire%TYPE;
    mesaj_trigger VARCHAR2(100);
    nr_maxim EXCEPTION;

BEGIN 
    
    DBMS_OUTPUT.PUT_LINE('S-a activat triggerul la nivel de linie');
    SELECT COUNT(*)
    INTO ct_etaj
    FROM etaj_ras
    WHERE id = :NEW.id_etaj;
    
    IF ct_etaj = 0 THEN
        RAISE etaj_inexistent;
    END IF;
    
    IF :NEW.id_sectie IS NOT NULL THEN
        SELECT COUNT(*)
        INTO ct_sectie
        FROM sectie_ras
        WHERE id = :NEW.id_sectie;
        
        IF ct_sectie = 0 THEN
            RAISE sectie_inexistenta;
        END IF;
    
        FOR i IN 1..pachet_ras.info.LAST LOOP
            IF pachet_ras.info(i).id_sectie = :NEW.id_sectie AND pachet_ras.info(i).id_etaj = :NEW.id_etaj
            AND pachet_ras.info(i).ct_camere + pachet_ras.contor = 3 THEN 
                -- luam numele sectiei
                SELECT denumire
                INTO nume_sectie
                FROM sectie_ras
                WHERE id = :NEW.id_sectie;
                
                mesaj_trigger := 'Sectia ' || nume_sectie || ' are deja numarul maxim de camere permise pe acest etaj';
                RAISE nr_maxim;
            END IF;
        END LOOP;
        pachet_ras.contor := pachet_ras.contor + 1;        
    END IF;
EXCEPTION
    WHEN etaj_inexistent THEN
        RAISE_APPLICATION_ERROR(-20001, 'Etajul dat nu exista');
    WHEN sectie_inexistenta THEN 
        RAISE_APPLICATION_ERROR(-20002, 'Sectia data nu exista');
    WHEN nr_maxim THEN
        RAISE_APPLICATION_ERROR(-20003, mesaj_trigger);
END;
/

-- sectia 1 ia camera 4 de la etajul 3 (momentan are doar 2 camere la etajul 3)
INSERT INTO camere_ras
VALUES(4, 1, 3);

-- sectia 1 are deja 3 camere la etajul 3 => eroare
INSERT INTO camere_ras
VALUES (5, 1, 3);

ROLLBACK;

-- nu exista etajul cu id-ul dat => eroare
INSERT INTO camere_ras
VALUES (1, 2, 7);

-- nu exista sectia data => eroare
INSERT INTO camere_ras
VALUES (5, 8, 1);

-- insert into ... select ... => merge
INSERT INTO camere_ras
SELECT 4, 1, 3
FROM DUAL;

ROLLBACK;

-- sectia 6 are 2 camere la etajul 1
-- sectia 5 nu are nicio camera la etajul 1
-- => operatia ar trebui sa poata fi executata
UPDATE camere_ras
SET id_sectie = 5
WHERE id_sectie = 6;

ROLLBACK;

-- exemplul 7
INSERT INTO camere_ras
VALUES(4, NULL, 1);

INSERT INTO camere_ras
VALUES(5, NULL, 1);

INSERT INTO camere_ras
VALUES(6, NULL, 1);

UPDATE camere_ras
SET id_sectie = 6
WHERE id_sectie IS NULL AND id_etaj = 1;

ROLLBACK;

ALTER TRIGGER max_3camere_comanda DISABLE;
ALTER TRIGGER max_3camere_linie DISABLE;

-- cerinta 11
/*
S? se adauge o nou? coloan? tabelului pacienti, nr_analize NUMBER, 
care va re?ine num?rul de analize realizate de un pacient. Coloana
va fi actualizat? de fiecare dat? când se fac modific?ri în tabela
pacienti_aleg_analize.
*/

ALTER TABLE pacienti_ras
ADD nr_analize NUMBER;

UPDATE pacienti_ras p
SET nr_analize = (SELECT COUNT(*)
                  FROM pacienti_aleg_analize_ras
                  WHERE id_pacient = p.id);
                  
SELECT *
FROM pacienti_ras;

CREATE OR REPLACE TRIGGER verif_update_analize_ras
BEFORE INSERT OR UPDATE OF id_pacient ON pacienti_aleg_analize_ras
FOR EACH ROW
DECLARE
    pacient_inexistent EXCEPTION;
    ct_pacient NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO ct_pacient
    FROM pacienti_ras
    WHERE id = :NEW.id_pacient;
    
    IF ct_pacient = 0 THEN 
        RAISE pacient_inexistent;
    END IF;

EXCEPTION
    WHEN pacient_inexistent THEN
        RAISE_APPLICATION_ERROR(-20001, 'Pacientul ' || :NEW.id_pacient || ' nu exista in baza de date!');

END;
/

CREATE OR REPLACE PROCEDURE actualizeaza_analize (id_pacient pacienti_ras.id%TYPE, ct NUMBER)
IS
BEGIN
    UPDATE pacienti_ras
    SET nr_analize = nr_analize + ct
    WHERE id = id_pacient;
END actualizeaza_analize;
/

CREATE OR REPLACE TRIGGER update_analize_ras
AFTER INSERT OR DELETE OR UPDATE OF id_pacient ON pacienti_aleg_analize_ras
FOR EACH ROW
BEGIN
    IF DELETING THEN
        actualizeaza_analize(:OLD.id_pacient, -1);
    ELSIF INSERTING THEN
        actualizeaza_analize(:NEW.id_pacient, 1);
    ELSE -- update
        actualizeaza_analize(:OLD.id_pacient, -1);
        actualizeaza_analize(:NEW.id_pacient, 1);
    END IF;
END;
/

-- pacientul 2 a facut de 3 ori analiza 4
-- are un total de 9 analize
-- => 9 - 3 = 6
DELETE FROM pacienti_aleg_analize_ras
WHERE id_pacient = 2 AND id_analiza = 4;

SELECT *
FROM pacienti_ras;

ROLLBACK;

-- pacientul 8 nu exista => eroare
INSERT INTO pacienti_aleg_analize_ras
VALUES (8, 1, SYSDATE);

ROLLBACK;

-- pacientul 1 are initial 4 analize
-- => 5 analize
INSERT INTO pacienti_aleg_analize_ras
VALUES (1, 4, TO_DATE('2024/12/31', 'yyyy/mm/dd'));

SELECT *
FROM pacienti_ras;

ROLLBACK;

-- initial pacientul 3 are 3 analize, pacientul 4 are 4 analize
-- dupa => pacientul 3 = 0, pacientul 4 = 7
UPDATE pacienti_aleg_analize_ras
SET id_pacient = 4
WHERE id_pacient = 3;

SELECT *
FROM pacienti_ras
WHERE id = 3 OR id = 4;

ROLLBACK;

-- cerinta 12
/*
Crea?i tabelul istoric_ras cu urm?toarea structur?: 
utilizator (numele utilizatorului), nume_bd (numele bazei de date), 
eveniment (evenimentul sistem), nume_obiect (numele obiectului), 
tip_obiect (tipul obiectului), data (data producerii evenimentului).

Popularea acestui tabel se va face cu ajutorul unui trigger, care la 
fiecare comand? de tip LDD (CREATE, ALTER, DROP), insereaz? în tabel
o înregistrare cu detaliile opera?iei.
*/

CREATE TABLE istoric_ras (utilizator VARCHAR2(50),
                        nume_bd VARCHAR2(50),
                        eveniment VARCHAR2(50),
                        nume_obiect VARCHAR2(50),
                        tip_obiect VARCHAR2(50),
                        data DATE);

CREATE OR REPLACE TRIGGER update_istoric
AFTER CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    INSERT INTO istoric_ras
    VALUES (SYS.LOGIN_USER, SYS.DATABASE_NAME, SYS.SYSEVENT, SYS.DICTIONARY_OBJ_NAME, 
    SYS.DICTIONARY_OBJ_TYPE, SYSDATE);   
END;
/


-- creare de view
CREATE OR REPLACE VIEW info_pacienti_analize
AS
SELECT p.nume, p.prenume, a.denumire, asoc.data
       FROM pacienti_ras p JOIN pacienti_aleg_analize_ras asoc ON (p.id = asoc.id_pacient)
                       JOIN analize_ras a ON (asoc.id_analiza = a.id);
-- stergere de view                       
DROP VIEW info_pacienti_analize;

-- creare de tabel
CREATE TABLE info_sectie (nume_sectie VARCHAR2(50),
                          nr_medici NUMBER);
                          
-- nu e comanda LDD, nu insereaza nimic in tabel
INSERT INTO info_sectie
SELECT s.denumire, COUNT(*) 
FROM sectie_ras s JOIN medici_ras m ON (s.id = m.id_sectie)
GROUP BY s.denumire;

-- alter pe tabel
ALTER TABLE info_sectie
ADD nr_asistenti NUMBER;

-- drop pe tabel
DROP TABLE info_sectie;

SELECT *
FROM istoric_ras;

-- cerinta 13
/*
Afi?a?i pentru fiecare sec?ie num?rul de medici, num?rul de pacien?i
care au realizat proceduri specifice sec?iei, lista medicilor, 
dar ?i lista pacien?ilor, al?turi de procedurile medicale 
realizate în cadrul sec?iei.
*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PACKAGE cer13_ras AS
    -- tipuri de date
    TYPE rec_sectie IS RECORD (id sectie_ras.id%TYPE, 
                               nume sectie_ras.denumire%TYPE);
    TYPE info_sectii IS TABLE OF rec_sectie;
    TYPE tabl_id_pacienti IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    TYPE rec_pacient IS RECORD (id pacienti_ras.id%TYPE,
                                nume pacienti_ras.nume%TYPE,
                                prenume pacienti_ras.prenume%TYPE);
    TYPE info_pacienti IS TABLE OF rec_pacient;
    
    CURSOR nume_proceduri (v_id_pacient pacienti_ras.id%TYPE, v_id_sectie sectie_ras.id%TYPE)
    IS
    SELECT DISTINCT proc.denumire
    FROM pacient_medic_proced_ras asoc JOIN proceduri_ras proc ON (asoc.id_proced = proc.id)
    WHERE  asoc.id_pacient = v_id_pacient AND proc.id_sectie = v_id_sectie;
    
    CURSOR lista_medici(v_id_sectie sectie_ras.id%TYPE)
    IS 
    SELECT nume, prenume
    FROM medici_ras m JOIN angajati_ras a ON (m.id = a.id)
    WHERE id_sectie = v_id_sectie;
    
    -- functii & proceduri
    FUNCTION nr_medici (v_id_sectie sectie_ras.id%TYPE)
            RETURN NUMBER;
            
    FUNCTION nr_pacienti (v_id_sectie sectie_ras.id%TYPE)
            RETURN NUMBER;
    -- ret id, nume, prenume pentru pacientii care au avut proceduri la sectia respectiva        
    FUNCTION selecteaza_pacienti(v_id sectie_ras.id%TYPE)
            RETURN info_pacienti;
    -- functia main a pachetului         
    PROCEDURE afiseaza_info_sectii;
    -- ret id,  nume sectie
    FUNCTION selecteaza_sectii 
            RETURN info_sectii;
    PROCEDURE afiseaza_info_generale(id_sectie sectie_ras.id%TYPE);
    PROCEDURE afiseaza_info_pacienti(id_sectie sectie_ras.id%TYPE);
    PROCEDURE afiseaza_medici(id_sectie sectie_ras.id%TYPE); 
END cer13_ras;
/

CREATE OR REPLACE PACKAGE BODY cer13_ras AS
    FUNCTION nr_medici (v_id_sectie sectie_ras.id%TYPE)
            RETURN NUMBER
    IS
        ct NUMBER;
    BEGIN
        SELECT COUNT(*)
        INTO ct
        FROM medici_ras
        WHERE v_id_sectie = id_sectie;
        
        RETURN ct;
    END nr_medici;
    
    FUNCTION nr_pacienti(v_id_sectie sectie_ras.id%TYPE)
            RETURN NUMBER
    IS
        lista_pacienti tabl_id_pacienti;
    BEGIN
        -- selectam pacientii care au realizat proceduri la sectia respectiva
        SELECT DISTINCT asoc.id_pacient
        BULK COLLECT INTO lista_pacienti
        FROM pacient_medic_proced_ras asoc JOIN proceduri_ras proc ON (asoc.id_proced = proc.id)
        WHERE proc.id_sectie = v_id_sectie;
        
        -- returnam numarul de pacienti
        RETURN lista_pacienti.COUNT;  
    END nr_pacienti;
    
    PROCEDURE afiseaza_medici(id_sectie sectie_ras.id%TYPE)
    IS
        v_nume angajati_ras.nume%TYPE;
        v_prenume angajati_ras.prenume%TYPE;
    BEGIN
        OPEN lista_medici(id_sectie);
        DBMS_OUTPUT.PUT_LINE('...........................................');
        DBMS_OUTPUT.PUT_LINE('Lista medicilor: ');
        LOOP 
            FETCH lista_medici INTO v_nume, v_prenume;
            EXIT WHEN lista_medici%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(v_nume || ' ' || v_prenume);
        END LOOP;
        CLOSE lista_medici;
    END afiseaza_medici;
    
    
    PROCEDURE afiseaza_info_generale(id_sectie sectie_ras.id%TYPE)
    IS
        v_medici NUMBER;
        v_pacienti NUMBER;
    BEGIN
        v_medici := nr_medici(id_sectie);
        v_pacienti := nr_pacienti(id_sectie);
        DBMS_OUTPUT.PUT_LINE('Nr medici: ' || v_medici || ' Nr pacienti: ' || v_pacienti);
        IF v_medici > 0 THEN
            afiseaza_medici(id_sectie);
        END IF;
    END afiseaza_info_generale;
    
    FUNCTION selecteaza_sectii 
        RETURN info_sectii
    IS
        lista_sectii info_sectii;
    BEGIN
        SELECT id, denumire
        BULK COLLECT INTO lista_sectii
        FROM sectie_ras;
    
        RETURN lista_sectii;
    END selecteaza_sectii;
    
    FUNCTION selecteaza_pacienti(v_id sectie_ras.id%TYPE)
            RETURN info_pacienti
    IS
        lista info_pacienti;
    BEGIN 
        SELECT DISTINCT p.id, p.nume, p.prenume
        BULK COLLECT INTO lista
        FROM pacient_medic_proced_ras asoc JOIN proceduri_ras proc ON (asoc.id_proced = proc.id)
             JOIN pacienti_ras p ON (asoc.id_pacient = p.id)
        WHERE proc.id_sectie = v_id;
        
        RETURN lista;
    END selecteaza_pacienti;
    
    PROCEDURE afiseaza_info_pacienti(id_sectie sectie_ras.id%TYPE)
    IS
        lista_pacienti info_pacienti;
        nume_proc proceduri_ras.denumire%TYPE;
    BEGIN
        lista_pacienti := selecteaza_pacienti(id_sectie);
        IF lista_pacienti.COUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('...............................................');
                DBMS_OUTPUT.PUT_LINE('Lista pacientilor:');
                FOR i IN lista_pacienti.FIRST..lista_pacienti.LAST LOOP
                    DBMS_OUTPUT.PUT_LINE(lista_pacienti(i).nume || ' ' || lista_pacienti(i).prenume);
                    OPEN nume_proceduri(lista_pacienti(i).id ,id_sectie);
                    LOOP
                        FETCH nume_proceduri INTO nume_proc;
                        EXIT WHEN nume_proceduri%NOTFOUND;
                        DBMS_OUTPUT.PUT_LINE(' ' || nume_proc);
                    END LOOP;
                    CLOSE nume_proceduri;
                END LOOP;
        END IF;
    END afiseaza_info_pacienti;
    
    PROCEDURE afiseaza_info_sectii
    IS
        lista_sectii info_sectii;
    BEGIN
        lista_sectii := selecteaza_sectii;
        FOR  i IN lista_sectii.FIRST..lista_sectii.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
            DBMS_OUTPUT.PUT_LINE('Sectia ' || lista_sectii(i).nume);
            DBMS_OUTPUT.PUT_LINE('............................................');
            afiseaza_info_generale(lista_sectii(i).id);
            afiseaza_info_pacienti(lista_sectii(i).id);
        END LOOP;
    END afiseaza_info_sectii;

END cer13_ras;
/

BEGIN
    cer13_ras.afiseaza_info_sectii;
END; 

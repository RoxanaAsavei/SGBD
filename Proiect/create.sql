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

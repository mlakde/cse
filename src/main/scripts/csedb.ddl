
    create table access_information (
        id bigint not null auto_increment,
        AOAFamiliarization boolean,
        ASM boolean,
        ATC boolean,
        Escort boolean,
        LAXPoliceDrivethruPost boolean,
        RAD varchar(255),
        SponsoredEmployeeOfCONCESSIONAIRE varchar(255),
        USCustomsSeal varchar(255),
        airportSecurityTraining boolean,
        authorityId varchar(255),
        authorizedDate datetime,
        badgeColor varchar(255),
        contact varchar(255),
        criticalIcon varchar(255),
        directCompanyEmployee varchar(255),
        directCompanyEmployeeOfLAWA varchar(255),
        employeeJobTitle varchar(255),
        lawaJobLocation varchar(255),
        restrictedAreaDriverTraining boolean,
        weaponStar varchar(255),
        primary key (id)
    );

    create table application_comments (
        application_id bigint not null,
        authorizedSigner_id bigint,
        comment varchar(255)
    );

    create table application_documents (
        id bigint not null auto_increment,
        application bigint,
        primary key (id)
    );

    create table application_status (
        id bigint not null auto_increment,
        abbreviation varchar(255),
        status varchar(255),
        primary key (id)
    );

    create table application_tokens (
        id bigint not null auto_increment,
        EmailAddress_Primary varchar(255),
        FirstName varchar(255),
        LastName varchar(255),
        SocialSecurityNumber varchar(255),
        active boolean,
        applicationToken varchar(255),
        companyCode varchar(255),
        companyDivision varchar(255),
        companyName varchar(255),
        createdDate datetime,
        expiryDate datetime,
        authorizedSigner_id bigint,
        primary key (id)
    );

    create table application_type (
        id bigint not null auto_increment,
        type varchar(255),
        primary key (id)
    );

    create table applications (
        id bigint not null auto_increment,
        applicationStatus_id bigint,
        applicationToken_id bigint,
        applicationType_id bigint,
        authorizedSigner_id bigint,
        person_id bigint,
        primary key (id)
    );

    create table authorities (
        user_id bigint not null,
        role varchar(255)
    );

    create table criminal_history (
        id bigint not null auto_increment,
        crimeFormSignDate datetime,
        intial varchar(255),
        que1 boolean,
        que10 boolean,
        que11 boolean,
        que12 boolean,
        que13 boolean,
        que14 boolean,
        que15 boolean,
        que16 boolean,
        que17 boolean,
        que18 boolean,
        que19 boolean,
        que2 boolean,
        que20 boolean,
        que21 boolean,
        que22 boolean,
        que23 boolean,
        que24 boolean,
        que25 boolean,
        que26 boolean,
        que27 boolean,
        que28 boolean,
        que29 boolean,
        que3 boolean,
        que30 boolean,
        que31 boolean,
        que32 boolean,
        que33 boolean,
        que34 boolean,
        que35 boolean,
        que36 boolean,
        que4 boolean,
        que5 boolean,
        que6 boolean,
        que7 boolean,
        que8 boolean,
        que9 boolean,
        primary key (id)
    );

    create table messages (
        id bigint not null auto_increment,
        active boolean,
        description varchar(255),
        font_size varchar(255),
        font_style varchar(255),
        message_type varchar(255),
        scroll varchar(255),
        title varchar(255),
        primary key (id)
    );

    create table person_biographics (
        id bigint not null auto_increment,
        FirstName varchar(255),
        LastName varchar(255),
        MiddleName varchar(255),
        USCitizen boolean,
        birthCity varchar(255),
        birthCountry varchar(255),
        birthState varchar(255),
        citizenCountry varchar(255),
        dob datetime,
        employeeId varchar(255),
        ethincity varchar(255),
        eyeColor varchar(255),
        gender varchar(255),
        hairColor varchar(255),
        height varchar(255),
        homeAddress varchar(255),
        id1Expiry datetime,
        id1Number varchar(255),
        id1StateCountry varchar(255),
        id1Type varchar(255),
        id2Expiry datetime,
        id2Number varchar(255),
        id2StateCountry varchar(255),
        id2Type varchar(255),
        primaryPhone varchar(255),
        secondaryPhone varchar(255),
        suffix varchar(255),
        weight varchar(255),
        workAuthozied boolean,
        Person_id bigint,
        primary key (id)
    );

    create table persons (
        id bigint not null auto_increment,
        FirstName varchar(255),
        LastName varchar(255),
        MiddleName varchar(255),
        primary key (id)
    );

    create table refresh_time (
        id bigint not null auto_increment,
        name varchar(255),
        refresh_time varchar(255),
        type varchar(255),
        primary key (id)
    );

    create table tokens (
        id bigint not null auto_increment,
        eta varchar(255),
        station varchar(255),
        token_name varchar(255),
        primary key (id)
    );

    create table users (
        id bigint not null auto_increment,
        email varchar(255),
        enabled boolean not null,
        firstName varchar(255),
        lastName varchar(255),
        password varchar(255),
        primary key (id)
    );

    alter table application_comments 
        add index FK_5rfd9xq8pk00sql57s1m17e6t (authorizedSigner_id), 
        add constraint FK_5rfd9xq8pk00sql57s1m17e6t 
        foreign key (authorizedSigner_id) 
        references users (id);

    alter table application_comments 
        add index FK_lvtdg86fr4y7kp2cnpjed7nxg (application_id), 
        add constraint FK_lvtdg86fr4y7kp2cnpjed7nxg 
        foreign key (application_id) 
        references applications (id);

    alter table application_tokens 
        add index FK_g9cl3f8sjpf0shqjo05gsm5rn (authorizedSigner_id), 
        add constraint FK_g9cl3f8sjpf0shqjo05gsm5rn 
        foreign key (authorizedSigner_id) 
        references users (id);

    alter table applications 
        add index FK_e91vsoq6gcx3njdyaosp69xsu (applicationStatus_id), 
        add constraint FK_e91vsoq6gcx3njdyaosp69xsu 
        foreign key (applicationStatus_id) 
        references application_status (id);

    alter table applications 
        add index FK_cs98ptus6i11odg923j1xjttc (applicationToken_id), 
        add constraint FK_cs98ptus6i11odg923j1xjttc 
        foreign key (applicationToken_id) 
        references application_tokens (id);

    alter table applications 
        add index FK_17nvt1lm1lniwg5lkd1qs4fi (applicationType_id), 
        add constraint FK_17nvt1lm1lniwg5lkd1qs4fi 
        foreign key (applicationType_id) 
        references application_type (id);

    alter table applications 
        add index FK_fxxxlepa02mjfbagk4r09ivhi (authorizedSigner_id), 
        add constraint FK_fxxxlepa02mjfbagk4r09ivhi 
        foreign key (authorizedSigner_id) 
        references users (id);

    alter table applications 
        add index FK_4scsyhn3575wkrt90e0nxcgny (person_id), 
        add constraint FK_4scsyhn3575wkrt90e0nxcgny 
        foreign key (person_id) 
        references persons (id);

    alter table authorities 
        add index FK_s21btj9mlob1djhm3amivbe5e (user_id), 
        add constraint FK_s21btj9mlob1djhm3amivbe5e 
        foreign key (user_id) 
        references users (id);

    alter table person_biographics 
        add index FK_87lqo3fuxc1wf5bm61a8y7gdj (Person_id), 
        add constraint FK_87lqo3fuxc1wf5bm61a8y7gdj 
        foreign key (Person_id) 
        references persons (id);

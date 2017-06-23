
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
        comment longtext,
        createdDate datetime
    );

    create table application_documents (
        application_id bigint not null,
        Country varchar(255),
        DocumentID varchar(255),
        DocumentType varchar(255),
        ExpirationDate datetime,
        State varchar(255),
        createdDate datetime
    );

    create table application_receipts (
        id bigint not null auto_increment,
        active boolean,
        applicationReceipt varchar(255),
        createdDate datetime,
        expiryDate datetime,
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
        applicationType_id bigint,
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
        applicationReceipt_id bigint,
        applicationStatus_id bigint,
        applicationToken_id bigint,
        applicationType_id bigint,
        authorizedSigner_id bigint,
        criminalRecord_id bigint,
        personBiographic_id bigint,
        primary key (id)
    );

    create table authorities (
        user_id bigint not null,
        role varchar(255)
    );

    create table countries (
        id bigint not null auto_increment,
        NCICCountryCode varchar(255),
        _DataChanges_RowID bigint,
        countryCode varchar(255),
        countryDescription varchar(255),
        countrySubdivisionTypeName varchar(255),
        internationalCallPrefix varchar(255),
        isActive boolean,
        sortOrder bigint,
        primary key (id)
    );

    create table country_subdivisions (
        id bigint not null auto_increment,
        NCICCountrySubdivisionCode varchar(255),
        _DataChanges_RowID bigint,
        countrySubdivisionCode varchar(255),
        countrySubdivisionName varchar(255),
        isActive boolean,
        sortOrder bigint,
        country_id bigint,
        primary key (id)
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

    create table document_types (
        id bigint not null auto_increment,
        DocumentTypeCode varchar(255),
        DocumentTypeDescription longtext,
        DocumentTypeNumber varchar(255),
        EntityTypeCode varchar(255),
        Force_CountryCode varchar(255),
        I9Compliant boolean,
        LegalStatusCode varchar(255),
        RequiresExpirationDate boolean,
        RequiresExpirationDate_Optional boolean,
        RequiresIdentificationNumber varchar(255),
        RequiresIssuingAuthority varchar(255),
        RequiresIssuingAuthority_School boolean,
        Requires_CountrySubdivisionCode boolean,
        Requires_CountrySubdivisionCode_Optional boolean,
        _DataChanges_RowID bigint,
        isActive boolean,
        sortOrder bigint,
        primary key (id)
    );

    create table eye_colors (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        eyeColorCode varchar(255),
        eyeColorDescription varchar(255),
        isActive boolean,
        sortOrder bigint,
        primary key (id)
    );

    create table hair_colors (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        hairColorCode varchar(255),
        hairColorDescription varchar(255),
        isActive boolean,
        sortOrder bigint,
        primary key (id)
    );

    create table name_prefixes (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        isActive boolean,
        namePrefixCode varchar(255),
        namePrefixDescription varchar(255),
        sortOrder bigint,
        primary key (id)
    );

    create table name_suffixes (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        isActive boolean,
        nameSuffixCode varchar(255),
        nameSuffixDescription varchar(255),
        sortOrder bigint,
        primary key (id)
    );

    create table person_aliases (
        id bigint not null auto_increment,
        FirstName varchar(255),
        LastName varchar(255),
        MiddleName varchar(255),
        NamePrefixCode varchar(255),
        NameSuffixCode varchar(255),
        personBiographic_id bigint,
        primary key (id)
    );

    create table person_biographics (
        id bigint not null auto_increment,
        Address varchar(255),
        ApartmentNumber varchar(255),
        City varchar(255),
        CountryCode varchar(255),
        CountryCode_Birth varchar(255),
        CountryCode_Citizenship varchar(255),
        CountrySubdivisionCode varchar(255),
        CountrySubdivisionCode_Birth varchar(255),
        DateOfBirth datetime,
        EmailAddress_Alternate varchar(255),
        EmailAddress_Primary varchar(255),
        EyeColorCode varchar(255),
        FirstName varchar(255),
        HairColorCode varchar(255),
        HeightInInches varchar(255),
        HomePhoneNumber varchar(255),
        IsSubmitted boolean,
        LastName varchar(255),
        MiddleName varchar(255),
        NamePrefixCode varchar(255),
        NameSuffixCode varchar(255),
        PostalCode varchar(255),
        RaceCode varchar(255),
        SexCode varchar(255),
        SocialSecurityNumber varchar(255),
        WeightInPounds varchar(255),
        WorkPhoneNumber varchar(255),
        employeeId varchar(255),
        primary key (id)
    );

    create table races (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        isActive boolean,
        raceCode varchar(255),
        raceDescription varchar(255),
        sortOrder bigint,
        primary key (id)
    );

    create table sexes (
        id bigint not null auto_increment,
        _DataChanges_RowID bigint,
        isActive boolean,
        sexCode varchar(255),
        sexDescription varchar(255),
        sortOrder bigint,
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

    alter table application_documents 
        add index FK_d85ql4v8pcne2byskulaeuwmo (application_id), 
        add constraint FK_d85ql4v8pcne2byskulaeuwmo 
        foreign key (application_id) 
        references applications (id);

    alter table application_tokens 
        add index FK_qcuodvc3cqximdk04y52q0yxk (applicationType_id), 
        add constraint FK_qcuodvc3cqximdk04y52q0yxk 
        foreign key (applicationType_id) 
        references application_type (id);

    alter table application_tokens 
        add index FK_g9cl3f8sjpf0shqjo05gsm5rn (authorizedSigner_id), 
        add constraint FK_g9cl3f8sjpf0shqjo05gsm5rn 
        foreign key (authorizedSigner_id) 
        references users (id);

    alter table applications 
        add index FK_ie2m8q1dma2h4khq24x73f6yd (applicationReceipt_id), 
        add constraint FK_ie2m8q1dma2h4khq24x73f6yd 
        foreign key (applicationReceipt_id) 
        references application_receipts (id);

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
        add index FK_f3451irj7oibp2bk5c8nleokd (criminalRecord_id), 
        add constraint FK_f3451irj7oibp2bk5c8nleokd 
        foreign key (criminalRecord_id) 
        references criminal_history (id);

    alter table applications 
        add index FK_cxoyo2l53xca5gejcol2gdfs0 (personBiographic_id), 
        add constraint FK_cxoyo2l53xca5gejcol2gdfs0 
        foreign key (personBiographic_id) 
        references person_biographics (id);

    alter table authorities 
        add index FK_s21btj9mlob1djhm3amivbe5e (user_id), 
        add constraint FK_s21btj9mlob1djhm3amivbe5e 
        foreign key (user_id) 
        references users (id);

    alter table country_subdivisions 
        add index FK_bohp3jw4os8n9esdcx9ra9y0k (country_id), 
        add constraint FK_bohp3jw4os8n9esdcx9ra9y0k 
        foreign key (country_id) 
        references countries (id);

    alter table person_aliases 
        add index FK_m4m54mb66hgym6786nrgbev8w (personBiographic_id), 
        add constraint FK_m4m54mb66hgym6786nrgbev8w 
        foreign key (personBiographic_id) 
        references person_biographics (id);

(:1. Le genre des films sortis entre 1960 et 1970 (inclus):)
doc("FilmsArtistes.xml")//FILM[@annee>=1960 and @annee<=1970]/GENRE

(:2. Le titre des films de type Drame pour lesquels il y a au moins 3 rôles décrits.:)
doc("FilmsArtistes.xml")//FILM[GENRE="Drame" and count(ROLES/ROLE) >= 3]/TITRE

(:3. Le nom des acteurs dirigés par Ridley Scott:)
doc("FilmsArtistes.xml")//FILM[MES[@idref=/FILMS/ARTISTE[ACTNOM="Scott" and ACTPNOM="Ridley"]/@id]]/ROLES/ROLE/NOM
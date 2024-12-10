(:ex1 Le titre, genre et pays pour tous les films avant 1970 :)
(:for $x in doc("films.xml")/FILMS/FILM
where $x/@annee<1970
return ($x/TITRE,$x/GENRE,$x/PAYS):)



(:ex2 Les rôles joués par Bruce Willis:)
(:for $role in doc("films.xml")//ROLE
where $role/PRENOM="James" and $role/NOM="Stewart"
return $role/INTITULE:)

(:doc("films.xml")//ROLE[PRENOM="James" and NOM="Stewart"]/INTITULE:)



(:ex3 Les rôles joués par Bruce Willis sous 
forme d’élément role contenant comme sous-éléments 
le titre du film le nom du personnage:)
(:for $film in doc("films.xml")/FILMS/FILM
for $role in $film//ROLE
where $role/PRENOM="James" and $role/NOM="Stewart"
return <role>
            {$film/TITRE}
            {$role/INTITULE}
        </role>:)
        
        
        
(:ex4 Le nom du metteur en scène du film Vertigo.:)
for $f in doc("films.xml")//FILM,$a in doc("artistes.xml")//ARTISTE
where $f/TITRE="Vertigo" and $a/@id=$f/MES/@idref
return <realisateur>
            {data($a/ARTNOM),data($a/ARTPNOM)}
            {$f/@annee}
</realisateur>









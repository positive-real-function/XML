(:1. Pour chaque artiste, retourner une balise acteur, avec le nom complet comme attribut
et l’ensemble des metteurs en scène qui l’ont dirigé. Chaque metteur en scène
apparaitra sous forme de balise realisateur, avec le nom complet comme texte:)



for $acteur in doc("FilmsArtistes.xml")//ROLE
let $nomActeur := concat($acteur/PRENOM, " ", $acteur/NOM)
let $filmsActeur := doc("FilmsArtistes.xml")//FILM[ROLES/ROLE/PRENOM = $acteur/PRENOM and ROLES/ROLE/NOM=$acteur/NOM]
let $metteursEnScene := distinct-values(
  for $film in $filmsActeur
  return $film/MES/@idref
)
return 
    <acteur nom="{$nomActeur}">
    {
      for $idMetteurEnScene in $metteursEnScene
      let $realisateur := doc("FilmsArtistes.xml")//ARTISTE[@id = $idMetteurEnScene]
      return <realisateur>{concat($realisateur/ACTPNOM, " ", $realisateur/ACTNOM)}</realisateur>
    }
  </acteur>



(:2. Pour chaque genre de film, produire un élément genre ayant pour attribut le nom du genre 
en question et contenant la liste des films de ce genre par ordre croissant de l’année. 
Pour chaque film on produit un élément film avec l’année en attribut et le titre du film en texte.  :)
(:
for $genre in distinct-values(doc("FilmsArtistes.xml")//GENRE)
return <genre nom="{$genre}">
           {
               for $film in doc("FilmsArtistes.xml")//FILM[GENRE = $genre]
               order by $film/@annee ascending
               return <film annee="{$film/@annee}">{data($film/TITRE)}</film>
           }
       </genre>:)
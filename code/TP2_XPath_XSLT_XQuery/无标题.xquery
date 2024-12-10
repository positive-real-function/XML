for $genre in distinct-values(doc("FilmsArtistes.xml")//GENRE)
return <genre nom="{$genre}">
           {
               for $film in doc("FilmsArtistes.xml")//FILM[GENRE = $genre]
               order by $film/@annee ascending
               return <film annee="{$film/@annee}">{data($film/TITRE)}</film>
           }
       </genre>
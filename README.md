# CHINOOK

## Réponses aux questions posées :

1. Niveau facile
  - Quel est le nombre total d'objets Album contenus dans la base (sans regarder les id bien sûr) ?
    ```ruby
      Album.count
        > 347
    ```
  - Qui est l'auteur de la chanson "White Room" ?
    ```ruby
      Track.select(:artist).where(title:"White Room")
        > Eric Clapton
    ```
  - Quelle chanson dure exactement 188133 milliseconds ?
    ```ruby
      Track.select(:title, :artist).where(duration:188133)
        > "Perfect" par "Alanis Morissette"
    ```
  - Quel groupe a sorti l'album "Use Your Illusion II" ?
    ```ruby
      Album.select(:artist).where(title:"Use Your Illusion II")
        > "Guns N Roses"
    ```

2. Niveau Moyen
  - Combien y a t'il d'albums dont le titre contient "Great" ? (indice)
    ```ruby
      Album.count.where("title LIKE ?", "%Great%")
        > 13
    ```
  - Supprime tous les albums dont le nom contient "music".
    ```ruby
      Album.delete(Album.select(:id).where("title LIKE ?", "%music%"))
        > 4 albums effacés
    ```
  - Combien y a t'il d'albums écrits par AC/DC ?
    ```ruby
      Track.where(artist:"AC/DC").count
        > 18
    ```
  - Combien de chanson durent exactement 158589 millisecondes ?
    ```ruby
      Track.where(duration:158589).count
        > 0
    ```

3. Niveau Difficile
  - puts en console tous les titres de AC/DC.
    ```ruby
      Track.select(:title).where(artist:"AC/DC").each do |piste| puts piste.title end
        > For Those About To Rock (We Salute You)
        > Put The Finger On You
        > Lets Get It Up
        > Inject The Venom
        > Snowballed
        > Evil Walks
        > C.O.D.
        > Breaking The Rules
        > Night Of The Long Knives
        > Spellbound
        > Go Down
        > Dog Eat Dog
        > Let There Be Rock
        > Bad Boy Boogie
        > Problem Child
        > Overdose
        > Hell Aint A Bad Place To Be
        > Whole Lotta Rosie
    ```
  - puts en console tous les titres de l'album "Let There Be Rock".
    ```ruby
      Track.select(:title).where(album:"Let There Be Rock").each do |piste| puts piste.title end
        > Go Down
        > Dog Eat Dog
        > Let There Be Rock
        > Bad Boy Boogie
        > Problem Child
        > Overdose
        > Hell Aint A Bad Place To Be
        > Whole Lotta Rosie
    ```
  - Calcule le prix total de cet album ainsi que sa durée totale.
    ```ruby
      puts "Prix total : #{Track.where(album:'Let There Be Rock').sum(:price)} - Durée totale : #{Track.where(album:'Let There Be Rock').sum(:duration)}"
        > Prix total : 7.920000000000001 - Durée totale : 2453259
    ```
  - Calcule le coût de l'intégralité de la discographie de "Deep Purple".
    ```ruby
      puts "Prix discographie de Deep Purple : #{Track.where(artist:'Deep Purple').sum(:price)}"
        > Prix discographie de Deep Purple : 90.0899999999999
    ```
  - Modifie (via une boucle) tous les titres de "Eric Clapton" afin qu'ils soient affichés avec "Britney Spears" en artist.
    ```ruby
      Track.where(artist:"Eric Clapton").count
        > 32
      Track.where(artist:"Britney Spears").count
        > 0
      Track.where(artist:"Eric Clapton").each {|piste| piste.update(artist:"Britney Spears")}
        > 32 updates
      Track.where(artist:"Eric Clapton").count
        > 0
      Track.where(artist:"Britney Spears").count
        > 32 
    ```

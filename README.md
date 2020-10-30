
   ## [jean.bertiazar.com](http://jean.bertiazar.com)
   
## Summary 

-  [TOOLS](#introduction)
1. [CONTACTS COMMENTS & LOGIN](#feature1eng)
2. [OPENWEATHER](#feature2eng)
3. [CHATROOM](#feature3eng)
4. [CURRICULUM VITAE](#feature4eng)
5. [CONSULTED DOCUMENTATION](#docueng)

Pour lire ce texte en Français cliquez [ici](#french)
 #
 
*Before anything else, I would like to thank you for your interest in my work.
After having done the boot-camp "Le Wagon", I wanted to start a personal project in order to highlight my newly acquired skills and to realize a new challenge by implementing more complex features not covered during my training. In order to carry out my project, I wanted to give it a professional process, for this, I called upon a senior developer, Timothée L., who I thank infinitely for the time he devoted to me. He reviewed, validated, and highlighted my mistakes and the best practices to follow regarding my pull requests, before merging them with the master branch.*

#

## **`This project was developed using:`** <a name="introduction"></a>

>           • Ruby 2.7 & Ruby on Rails 6 
>           • PostgreSQL
>           • Sidekiq
>           • Sidekiq-cron
>           • Redis
>           • JavaScript & jQuery
>           • HTML5 & CSS
>           • Bootstrap
>           • Cloudniary
>           • Devise
>           • Action Cable
>           • Action Mailer
>           • GitHub

	

	- Ruby 2.7 & Ruby on Rails 6

 RoR allows me to interact with the database via
 Active Record, consume APIs thanks to Sidekiq.
 I use Devise to generate and manage users ; 
 Action Mailer for mailing; as well as Action Cable as 
 a Websockets framework.






	- PostgreSQL
            
 Through my Rails projects, I entrust the data
 base part of my work to postegreSQL, with which I 
 interacted thanks to Active Record. Sometimes I 
 also request directly postregreSQL to respond to 
 specific problems.






	- JavaScript & jQuery

Javascript complements the HTML & CSS of my
page in order to make it dynamic. I use JS Vanilla, 
but according to my needs, also jQuery, in order 
to handle easily the DOM.
			




	- HTML5 & CSS            

HTML5 allows me to structure my page; 
thanks to Ruby on Rails, the HTML is 
generated automatically according to my 
request. CSS in order to apply style 
rules. I also use Bootstrap in order to 
implement components easily.






	- GitHub

GitHub allows me to work by branches, 
compare the code before merging it into 
the 'Master' branch;  which is essential
to avoid any conflict in the branch of production. 
It also allows me to share my code with you :)







## 1- CONTACTS, COMMENTS & LOGIN <a name="feature1eng"></a>

After having generated a first VMC, I first created a first form to add contacts to whom I let the possibility to write a comment; I then used "Devise" to create and manage users. This way, I was able to allow only registered users to leave me a comment. I added an admin column to the users table to allow the administrator to reply to comments.

In the same vein, I implemented "Action Mailer" which allows to manage the mailing when creating an account or after a password change. An e-mail notification is also sent to me when a comment is posted, as well as an e-mail notification to the user following my reply.

I wanted to create an interaction between the "comments" and my Slack channel, so I implemented "slack-ruby-client" and its use "Web Client". 
A message is sent to my slack channel with the information about the user, his subject, and his message, I have the possibility to reply directly via a slack modal, or to open the contact page and reply directly via my application.






## 2- OPENWEATHER <a name="feature2eng"></a>

After adding a navbar thanks to Bootstrap, I wanted to consume a second API; in the middle of a heat wave, I had the idea to implement a feature that displays the weather, it would allow me to collect the temperature and humidity in Lille, and follow its evolution over time thanks to a chart. I turned to OpenWeather, after having configured the token, and parsed the information collected, I used jQuery to dynamically display the information collected in real time. I first implemented chart.js which was later changed to Google Chart.
Thanks to Sidekiq-cron, I configured a schedule-job to consume the API once per hour (Currently my project is hosted for free at Heroku and the server goes into standby mode if there are no requests, so the cron-job can't do its job as desired).



## 3- CHATROOM <a name="feature3eng"></a>

As a new challenge, I wanted to create a dynamic chat, so I followed a tutorial to implement it with jQuery, but I wanted to push the challenge and use Websockets, so I switched to Action Cable.
First the creation of the Rooms as well as the display of the available ones.
Then I configured the message transmission using Action Cable; to make this feature more optimal, I segmented it using Services, Helpers & Channels. The messages are displayed dynamically using JavaScript.
I also used the same system to display the users online on each of the Rooms, and give the possibility to create a private Room.

Wishing to continue working with Websockets, thanks to Action Cable and a Bootstrap modal, I implemented a function that handles all notifications. Be it those related to account creation or login; or those related to the CRUD of the Rooms, and cv/competency cards. 



## 4- CURRICULUM VITAE <a name="feature4eng"></a>

 

I wanted to push the simple creation of my resume, for that I created a MVC and applied a CRUD for jobs, skills, and education. I implemented a form thanks to bootstrap, the information received is saved in my PostgreSQL database, which I then display in cards. 


##  **Consulted documentation** <a name="docueng"></a>




	Ruby 2.7 & Ruby on Rails 6
>
> -Getting started 
> > [https://guides.rubyonrails.org/getting_started.html](https://guides.rubyonrails.org/getting_started.html)
>
 > -Action Cable
> > [https://guides.rubyonrails.org/action_cable_overview.html](https://guides.rubyonrails.org/action_cable_overview.html)
>
 > -Active Records
> > [https://guides.rubyonrails.org/active_record_basics.html](https://guides.rubyonrails.org/active_record_basics.html)
>
> > [https://guides.rubyonrails.org/active_record_migrations.html](https://guides.rubyonrails.org/active_record_migrations.html)
>
> > [https://guides.rubyonrails.org/active_record_validations.html](https://guides.rubyonrails.org/active_record_validations.html)
>
> -Active Job
> > [https://guides.rubyonrails.org/active_job_basics.html](https://guides.rubyonrails.org/active_job_basics.html)
>
> -Action Mailer
> > [https://guides.rubyonrails.org/action_mailer_basics.html](https://guides.rubyonrails.org/action_mailer_basics.html)
>
> -Layer & Rendering 
> > [https://guides.rubyonrails.org/layouts_and_rendering.html](https://guides.rubyonrails.org/layouts_and_rendering.html)
>
> -Action View
> > [https://guides.rubyonrails.org/form_helpers.html](https://guides.rubyonrails.org/form_helpers.html)
>

	

       Sidekiq & Sidekiq-cron

> -Getting started
> > [https://github.com/mperham/sidekiq/wiki/Getting-Started](https://github.com/mperham/sidekiq/wiki/Getting-Started)
>
> -Sidekiq-cron
> > [https://github.com/ondrejbartas/sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron)
>

	

        Redis

> -Redis Rails
> > [https://github.com/redis-store/redis-rails](https://github.com/redis-store/redis-rails)
>


	Bootstrap

> -General documentation
> > [https://getbootstrap.com/docs/4.5/](https://getbootstrap.com/docs/4.5/)
>
     
	Cloudniary

> -Integrating Cloudinary
> > [https://cloudinary.com/documentation/how_to_integrate_cloudinary](https://cloudinary.com/documentation/how_to_integrate_cloudinary)
>
	
        Slack

> -Web Client 
> > [https://github.com/slack-ruby/slack-ruby-client#web-client](https://github.com/slack-ruby/slack-ruby-client#web-client)
>
> -Modal
> > [https://api.slack.com/surfaces/modals/using#handling_submissions](https://api.slack.com/surfaces/modals/using#handling_submissions)
>
	

        Open Weather

> -General documentation 
> > https://openweathermap.org/api](https://openweathermap.org/api)
>
	
        Chat

> -Rails chat application 
> > [https://github.com/iridakos/rails-chat-tutorial](https://github.com/iridakos/rails-chat-tutorial)
>







# 

# FRANCAIS <a name="french"></a>

## Sommaire

-  [OUTILS](#introductionfr)
1. [CONTACTS COMMENTAIRES & LOGIN](#feature1fr)
2. [OPENWEATHER](#feature2fr)
3. [CHATROOM](#feature3fr)
4. [CURRICULUM VITAE](#feature4fr)
5. [DOCUMENTATIONS CONSULTÉES](#docufr)

#


*Avant toute chose, je souhaite vous remercier pour l’intérêt que vous portez à mon travail.
Après avoir effectué le boot-camp “Le Wagon”, j’ai souhaité démarrer un projet personnel afin de mettre en avant mes compétences nouvellement acquises et de réaliser un nouveau challenge en implémentant des fonctionnalités plus complexes non-abordées lors de ma formation. Afin de mener à bien mon projet, j’ai souhaité lui donner un processus professionnel, pour cela, j’ai fait appel à un développeur senior, Timothée L., qui je remercie infiniment pour le temps qu’il m’a consacré. Il révisait, validait, et mettait en avant mes erreurs et les bonnes pratiques à suivre suite à mes pull requests, avant de les fusionner avec la branche master.*
#

## **`Ce projet a été développé grâce à:`** <a name="introductionfr"></a>

>           • Ruby 2.7 & Ruby on Rails 6 
>           • PostgreSQL
>           • Sidekiq
>           • Sidekiq-cron
>           • Redis
>           • JavaScript & jQuery
>           • HTML5 & CSS
>           • Bootstrap
>           • Cloudniary
>           • Devise
>           • Action Cable
>           • Action Mailer
>           • GitHub


    - Ruby 2.7 & Ruby on Rails 6
RoR me permets d'interagir avec la base de données via
Active Record, consommer des APIs grâce à Sidekiq.
J'utilise Devise pour générer et gérer des utilisateurs ;
Action Mailer pour le mailing ; ainsi que Action Cable
comme framework Websockets.

    

    - PostgreSQL

Au travers de mes projets Rails, je confie la partie base
de donnée à postegreSQL, avec laquelle j'intéragis grâce
à Active Record. Il m'arrive également de requêter
directement postregreSQL pour répondre à des
problématques précises.

    - JavaScript & jQuery

JavaScript vient compléter l'HTML & le CSS de ma page
afin de la rendre dynamique. J'utilise JavaScript Vanilla,
mais selon mes besoins, également jQuery, afin de manipuler
facilement le DOM.

    - HTML5 & CSS

HTML5 me permet de structurer ma page ; grâce à Ruby
on Rails, l'HTML est généré automatiquement selon mes
requête. Le CSS afin d'appliquer des règles de style.
J'utilise également Bootstrap afin d’implémenter
facilement des composants.

	- GitHub
GitHub me permet de travailler par branches, comparer
le code avant de le fusionner dans la branche 'Master';
ce qui est essentiel pour éviter tout conflit dans la
branche de production. Il me permets aussi de partager
mon code avec vous, n’hésitez pas à visiter ma page de
dépôt GitHub afin d'examiner mes projets.
                  


					  

## 1- CONTACTS, COMMENTAIRES & LOGIN <a name="feature1fr"></a>

Après avoir généré un premier MVC, j’ai d’abord créé un premier formulaire afin d’ajouter des contacts à qui je laisse la possibilité d’écrire un commentaire; j’ai par la suite utilisé Devise pour créer et gérer des utilisateurs. J’ai ainsi pu autoriser uniquement les utilisateurs enregistrés à me laisser un commentaire. J’ai ajouté une colonne admin à la table utilisateurs pour permettre  à l’administrateur de répondre aux commentaires.

Dans le même élan, j’ai implémenté «Action Mailer» qui permet de gérer le mailing lors de la création du compte ou suite à un changement de mot de passe. Une notification par e-mail m’est également envoyée lorsqu’un commentaire est déposé, ainsi qu’une notification par e-mail à l’utilisateur suite à ma réponse.

J’ai voulu créer une interaction entre les «commentaires» et ma chaîne Slack, pour cela j’ai implémenté «slack-ruby-client» et son utilisation «Web Client». 
Un message est envoyé sur ma chaîne Slack avec les informations concernant l’utilisateur, son sujet, et son message, j’ai la possibilité de répondre directement via un Modal Slack, ou d’ouvrir la page du contact et de répondre directement via mon application.


## 2- OPENWEATHER <a name="feature2fr"></a>

Après avoir ajouté un navbar grâce à Bootstrap, j’ai souhaité consommer une deuxième API; en pleine canicule, l’idée m’est venue d’implémenter une fonctionnalité qui affiche la météo, elle permettrait de récolter la température et l’humidité à Lille, et suivre son évolution dans le temps grâce à un graphique. Je me suis orienté vers OpenWeather, après avoir configuré le token, et parsé les informations récoltées, j’ai utilisé jQuery afin d’afficher dynamiquement les informations récoltées en temps réel. J’ai d’abord implémenté chart.js qui a été changée par la suite pour Google Chart.
Grâce à Sidekiq-cron, j’ai configuré un schedule-job afin de consommer l’API une fois par heure. (Actuellement mon projet est hébergé gratuitement chez Heroku et le serveur se met en veille s’il n’y a aucune requête, le cron-job ne peut donc effectuer son travail comme souhaité)


## 3- CHATROOM <a name="feature3fr"></a>

Comme nouveau challenge, j’ai eu la volonté de créer un chat dynamique, pour cela j’ai suivi un tutoriel afin de l’implémenter avec jQuery, mais je voulais pousser le challenge et utiliser les Websockets, pour cela j’ai fait appel à Action Cable.
D’abord la création des Rooms ainsi que l’affichage, de celles qui sont disponibles.
J’ai ensuite configuré la transmission des messages grâce à Action Cable; afin de rendre cette fonctionnalité plus optimale, je l’ai segmenté en utilisant des Services, Helpers & Channels. Les messages s’affichent dynamiquement grâce à JavaScript.
J’ai également utilisé le même système afin d’afficher les utilisateurs en ligne sur chacune des Rooms, et donner la possibilité de créer une Room privée.

Souhaitant continuer à travailler avec les Websockets, grâce à Action Cable et un modal de Bootstrap, j’ai implémenté une fonction qui gère toutes les notifications. Que ce soit celles liées à la création de compte ou de connexion ; ou celles liées au CRUD des Rooms, et des cartes cv/compétences. 



## 4- CURRICULUM VITAE <a name="feature4fr"></a>

 

I wanted to push the simple creation of my CV, for that I created a VMC and applied a CRUD for trades, skills, and training. I implemented a form thanks to bootstrap, the information received is saved in my postgreSQL database, which I then display in cards.



##  **Documentations consultées** <a name="docufr"></a>


	Ruby 2.7 & Ruby on Rails 6
>
> -Getting started 
> > [https://guides.rubyonrails.org/getting_started.html](https://guides.rubyonrails.org/getting_started.html)
>
 > -Action Cable
> > [https://guides.rubyonrails.org/action_cable_overview.html](https://guides.rubyonrails.org/action_cable_overview.html)
>
 > -Active Records
> > [https://guides.rubyonrails.org/active_record_basics.html](https://guides.rubyonrails.org/active_record_basics.html)
>
> > [https://guides.rubyonrails.org/active_record_migrations.html](https://guides.rubyonrails.org/active_record_migrations.html)
>
> > [https://guides.rubyonrails.org/active_record_validations.html](https://guides.rubyonrails.org/active_record_validations.html)
>
> -Active Job
> > [https://guides.rubyonrails.org/active_job_basics.html](https://guides.rubyonrails.org/active_job_basics.html)
>
> -Action Mailer
> > [https://guides.rubyonrails.org/action_mailer_basics.html](https://guides.rubyonrails.org/action_mailer_basics.html)
>
> -Layer & Rendering 
> > [https://guides.rubyonrails.org/layouts_and_rendering.html](https://guides.rubyonrails.org/layouts_and_rendering.html)
>
> -Action View
> > [https://guides.rubyonrails.org/form_helpers.html](https://guides.rubyonrails.org/form_helpers.html)
>

	

        Sidekiq & Sidekiq-cron

> -Getting started
> > [https://github.com/mperham/sidekiq/wiki/Getting-Started](https://github.com/mperham/sidekiq/wiki/Getting-Started)
>
> -Sidekiq-cron
> > [https://github.com/ondrejbartas/sidekiq-cron](https://github.com/ondrejbartas/sidekiq-cron)
>

	

        Redis

> -Redis Rails
> > [https://github.com/redis-store/redis-rails](https://github.com/redis-store/redis-rails)
>


	 Bootstrap

> -General documentation
> > [https://getbootstrap.com/docs/4.5/](https://getbootstrap.com/docs/4.5/)
>
     
	Cloudniary

> -Integrating Cloudinary
> > [https://cloudinary.com/documentation/how_to_integrate_cloudinary](https://cloudinary.com/documentation/how_to_integrate_cloudinary)
>
        
        Slack

> -Web Client 
> > [https://github.com/slack-ruby/slack-ruby-client#web-client](https://github.com/slack-ruby/slack-ruby-client#web-client)
>
> -Modal
> > [https://api.slack.com/surfaces/modals/using#handling_submissions](https://api.slack.com/surfaces/modals/using#handling_submissions)
>
	

        Open Weather

> -General documentation 
> > https://openweathermap.org/api](https://openweathermap.org/api)
>

        Chat

> -Rails chat application 
> > [https://github.com/iridakos/rails-chat-tutorial](https://github.com/iridakos/rails-chat-tutorial)
>





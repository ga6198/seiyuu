# seiyuu

App for seiyuu information.
## Ideas	
- Feed. Should it be focused on Instagram and Twitter, or similar to Pinterest?
- Seiyuu birthplace map (will store birthplace as text, but may need to store another value as a geopoint)
- Fun Facts section on details page + voice samples (Can be played by pressing audio symbol) 
- Home page should just show most viewed pages (+ other stats). Group seiyuu from shortest to tallest and group by birthplace

## TODO
- (Done) Need to add image modal for seiyuu pictures. Can use the following pages:
	- https://pub.dev/packages/photo_view
	- https://stackoverflow.com/questions/60047676/flutter-display-photo-or-image-as-modal-popup
- Need to change navigation animation (https://stackoverflow.com/questions/50196913/how-to-change-navigation-animation-using-flutter)
- (Done) In the seiyuu class, calculate the age, and print on the seiyuu details page
- Add search


## Issues
- In the Carousel, the bottom shadow is cut off a little bit. Could just set a default shadow offset in decoration.darte, but give these images a smaller shadow
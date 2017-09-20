## Contributing

Thank you for reading the guidelines and helping us with our project.

Following any guidelines will help everybody work together more smoothly, if you have aay suggestions please let us know!

If you want to contribute, submitting issues is always helpful (bugs, reccomendations, ideas), if you'd like to contribute to the code or art than you can check our project board of what needs to be done.

Feel free to download the code and make any changes, but any major design changes or deviations from the desired project won't be considered.

#### Getting Started

In order to make a contribution please follow these steps,
- fork / clone the repository
- create a new branch (git checkout -b [relevant-branch-name])
- if you make changes you want to submit, make sure you have followed and code specifications or guidelines
- send a pull request

If the contribution is simple (spelling / grammar fixes, typo correction, white space and formatting changes, comment clean up) please just submit a issue on github

If you make a pull request, we'll check it and make sure it aligns with a wanted change, we might ask you to change things to comform to standards. Also always make sure your commit messages are desciptive!

#### Report a bug

If you find a security vulnerability, do NOT open an issue. Email joe.scot.marshall@gmail.com instead.

When submitting an issue please answer at least these 3 questions:
- What did you do?
- What did you expect to see?
- What did you see instead?

#### Style Conventions

Code style
- please use functions with clear name for any public access to the node / scene
- add comments directly before the functions describing what they do, what values they take and what they return
- any functions for internal use or that won't need to interact with other nodes / scenes start with an underscore '\_'

Example:
	# this function is called when something damages it
	# takes a damage value (float), and an optional DAMAGE type
	# returns null
	func damage( value, type=DAMAGE.REGULAR ):
		health -= value

#### Community

You can chat with the core team on Discord (at some point).
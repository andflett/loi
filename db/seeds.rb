# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Type.delete_all
Event.delete_all
Resource.delete_all

Type.create([
  { title: 'Article' },
  { title: 'Podcast' },
  { title: 'Video' },
  { title: 'Link' }
])

Resource.create([
	{
		title: "The Social Intrapreneur: A Field Guide for Corporate Changemakers",
		url: "http://www.sustainability.com/library/the-social-intrapreneur#.UQp0xImLLek",
		body: "The first published work on the topic, SustainAbility's Field Guide for Corporate Changemakers, provides an overview of the emerging field social intrapreneurship with some inspiring case examples. Published in 2008, some content is a bit dated, but definitely worth a read."
	},
	{
		title: "Social Intrapreneurs - An Extra Force for Sustainability",
		url: "http://www.som.cranfield.ac.uk/som/dinamic-content/media/social%20intrapreneurs%20occasional%20paper.pdf",
		body: "David Grayson and his team at the Doughty Centre have been diving into the conditions required to support intrapreneurs. This occasional report provides interesting case examples and is useful reading for HR and leadership teams seeking to create space intrapreneurs to thrive."
	},
	{
		title: "Net Impact - Impact at Work",
		url: "http://netimpact.org/impact-at-work",
		body: "Net Impact has created a suite of resources to support professionals seeking to make a difference with their work."
	},
	{
		title: "The Aspen Institute's First Mover's Program",
		url: "http://www.aspeninstitute.org/policy-work/business-society/corporate-programs/first-movers-fellowship-program",
		body: "A wonderful mentoring opportunity for intrapreneurs seeking to take their work to the next level. It provides a chance to develop your ideas and to connect with other like-minded professionals"
	},
	{
		title: "Ashoka Changemakers",
		url: "http://www.changemakers.com/intrapreneurs",
		body: "Ashoka has applied its competition platform to begin sourcing leading intrapreneurs. While the competition has closed, you can still check out the innovative and inspiring entries from around the world."
	},
  {
		title: " Cubicle Warrior Series",
		url: "/inspiration/cubicle-warrior-series/",
		body: "A series of podcasts with intrapreneurs."
	}
])

Event.create([
	{
		title: "The Skoll World Forum, Oxford UK",
		body: "The Skoll World Forum is the premier international platform for accelerating entrepreneurial approaches to addressing social and environmental challenges. While the Forum has historically focused on social entrepreneurs, it is increasing its emphasis on corporate partnerships and social intrapreneurs. This year, Aspen Institute will be hosting a luncheon on the 12th April to bring leading intrapreneurs together.",
		url: "http://skollworldforum.org/",
		date: Date.new(2013,4,10)
	},
	{
		title: "OXJAM, Oxford UK ",
		body: "We know that the price tag for events like Skoll can be steep - even for corporate executives! So, here's an amazing sister event in Oxford that you can attend for FREE! Running in parallel to the Skoll World Forum on Social Entrepreneurship in Oxford, OxfordJam is a three-day fringe event that creates a space for the nurturing of social economy and social finance projects the world over.",
		url: "http://www.oxfordjam.org.uk/",
		date: Date.new(2013,4,10)
	},
	{
		title: "DO Lectures, Wales UK",
		body: "Ok, first, the downside to DO. You have to apply (and it's not cheap). But, the upside - you get to be part of a hand-selected group of amazing people meeting in an incredible place to take on the world. DO Lectures is hosting two main events this year - one in Wales and the other in California. They also host other workshops and forums on entrepreneurship that are well worth checking out.",
		url: "http://dolectures.com/the-event/",
		date: Date.new(2013,5,28)
	},
	{
		title: "Sustainable Brands, San Diego, California",
		body: "Many intrapreneurs leverage the power of brands to make positive impact with their work. So, it's no surprise that you'll connect with like-minded individuals at Sustainable Brands - an international community of learning and action focused on understanding and leveraging the role of brands in shaping a flourishing future.",
		url: "http://www.sustainablebrands.com/",
		date: Date.new(2013,6,3)
	},
	{
		title: "BASE Forum, Medellin, Colombia,",
		body: "The BASE Form, hosted by The Opportunities for the Majority Initiative (OMJ) and the Inter-American Development Bank, brings together hundreds of practitioners from	across sectors to explore base of pyramid business models and their potential for business strategy and poverty reduction. This year, they are planning a workshop focused entirely on intrapreneurship.",
		url: "http://www.iadb.org/en/topics/opportunities-for-the-majority/base-forum-2013,7659.html",
		date: Date.new(2013,6,6)
	},
	{
		title: "PODER Awards, Location TBD",
		body: "The PODER Business Awards celebrate excellence and leadership in the Americas by	recognizing those men and women who have demonstrated remarkable strategy, vision and execution in their respective businesses and organizations; those who are changing or can change the region's development dynamics on several fronts. Intrapreneurs from the Americas will be recognized at these awards.",
		url: "http://poderawards.com/",
		date: Date.new(2013,11,6)
	}
])

Toolkit.create([
	{
	  priority: 1,
		title: "Making the Business Case",
		subtitle: "How to combine the rational and emotional to win over your decision makers.",
		description: "Don’t raise your voice, improve your argument."
	},
	{
	  priority: 2,
		title: "Negotiating the System",
		subtitle: "How to navigate the intense politics and personalities of the corporate ecosystem.",
		description: "Attempt to re-express your target’s position so clearly, vividly and fairly that your target says, ‘Thanks I wish I’d thought of putting it that way’."
	},
	{
	  priority: 3,
		title: "Building Community",
		subtitle: "How to rally support for your idea near and far.",
		description: "Collaboration is the human face of systems thinking."
	},
	{
	  priority: 4,
		title: "Unlocking Resources",
		subtitle: "How to bring your ideas to life on a shoestring budget.",
		description: "A good prototype is worth a thousand pictures."
	},
	{
	  priority: 5,
		title: "Fostering Personal Resilience",
		subtitle: "How to ensure you not only endure, but also enjoy the journey.",
		description: "A good half of the art of living is resilience."
	}
])

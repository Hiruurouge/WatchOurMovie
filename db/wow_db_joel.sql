-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2023 at 06:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wow`
--

-- --------------------------------------------------------

--
-- Table structure for table `be`
--

CREATE TABLE `be` (
  `id_genre` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `belong`
--

CREATE TABLE `belong` (
  `id_user` int(11) NOT NULL,
  `id_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `belong`
--

INSERT INTO `belong` (`id_user`, `id_group`) VALUES
(1, 1),
(2, 1),
(3, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `uid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`uid`, `name`) VALUES
(1, 'Drame'),
(2, 'Action'),
(3, 'Aventure'),
(4, 'Romance'),
(5, 'Comédie Musicale'),
(6, 'Thriller'),
(7, 'Sci-Fi');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `uid` int(11) NOT NULL,
  `tmdb_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `release_year` int(11) NOT NULL,
  `overview` text DEFAULT NULL,
  `poster` text DEFAULT NULL,
  `popularity` float DEFAULT NULL,
  `genres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`uid`, `tmdb_id`, `title`, `release_year`, `overview`, `poster`, `popularity`, `genres`) VALUES
(252, 135397, 'Jurassic World', 2015, 'Twenty-two years after the events of Jurassic Park, Isla Nublar now features a fully functioning dinosaur theme park, Jurassic World, as originally envisioned by John Hammond.', 'https://image.tmdb.org/t/p/w500//A0LZHXUzo5C60Oahvt7VxvwuzHw.jpg', 32.9858, 'Action,Adventure,Science Fiction,Thriller'),
(253, 76341, 'Mad Max: Fury Road', 2015, 'An apocalyptic story set in the furthest reaches of our planet, in a stark desert landscape where humanity is broken, and most everyone is crazed fighting for the necessities of life. Within this world exist two rebels on the run who just might be able to restore order. There\'s Max, a man of action and a man of few words, who seeks peace of mind following the loss of his wife and child in the aftermath of the chaos. And Furiosa, a woman of action and a woman who believes her path to survival may be achieved if she can make it across the desert back to her childhood homeland.', 'https://image.tmdb.org/t/p/w500//8tZYtuWezp8JbcsvHYO0O46tFbo.jpg', 28.4199, 'Action,Adventure,Science Fiction,Thriller'),
(254, 262500, 'Insurgent', 2015, 'Beatrice Prior must confront her inner demons and continue her fight against a powerful alliance which threatens to tear her society apart.', 'https://image.tmdb.org/t/p/w500//dP5Fb6YRfzmCQtRbHOr2kO7tJW9.jpg', 13.1125, 'Adventure,Science Fiction,Thriller'),
(255, 140607, 'Star Wars: The Force Awakens', 2015, 'Thirty years after defeating the Galactic Empire, Han Solo and his allies face a new threat from the evil Kylo Ren and his army of Stormtroopers.', 'https://image.tmdb.org/t/p/w500//wqnLdwVXoBjKibFRR5U3y0aDUhs.jpg', 11.1731, 'Action,Adventure,Science Fiction,Fantasy'),
(256, 168259, 'Furious 7', 2015, 'Deckard Shaw seeks revenge against Dominic Toretto and his family for his comatose brother.', 'https://image.tmdb.org/t/p/w500//wurKlC3VKUgcfsn0K51MJYEleS2.jpg', 9.33501, 'Action,Crime,Thriller'),
(257, 281957, 'The Revenant', 2015, 'In the 1820s, a frontiersman, Hugh Glass, sets out on a path of vengeance against those who left him for dead after a bear mauling.', 'https://image.tmdb.org/t/p/w500//ji3ecJphATlVgWNY0B0RVXZizdf.jpg', 9.1107, 'Western,Drama,Adventure,Thriller'),
(258, 87101, 'Terminator Genisys', 2015, 'The year is 2029. John Connor, leader of the resistance continues the war against the machines. At the Los Angeles offensive, John\'s fears of the unknown future begin to emerge when TECOM spies reveal a new plot by SkyNet that will attack him from both fronts; past and future, and will ultimately change warfare forever.', 'https://image.tmdb.org/t/p/w500//oZRVDpNtmHk8M1VYy1aeOWUXgbC.jpg', 8.65436, 'Science Fiction,Action,Thriller,Adventure'),
(259, 286217, 'The Martian', 2015, 'During a manned mission to Mars, Astronaut Mark Watney is presumed dead after a fierce storm and left behind by his crew. But Watney has survived and finds himself stranded and alone on the hostile planet. With only meager supplies, he must draw upon his ingenuity, wit and spirit to subsist and find a way to signal to Earth that he is alive.', 'https://image.tmdb.org/t/p/w500//5BHuvQ6p9kfc091Z8RiFNhCwL4b.jpg', 7.6674, 'Drama,Adventure,Science Fiction'),
(260, 211672, 'Minions', 2015, 'Minions Stuart, Kevin and Bob are recruited by Scarlet Overkill, a super-villain who, alongside her inventor husband Herb, hatches a plot to take over the world.', 'https://image.tmdb.org/t/p/w500//vlOgaxUiMOA8sPDG9n3VhQabnEi.jpg', 7.40416, 'Family,Animation,Adventure,Comedy'),
(261, 150540, 'Inside Out', 2015, 'Growing up can be a bumpy road, and it\'s no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco. Like all of us, Riley is guided by her emotions - Joy, Fear, Anger, Disgust and Sadness. The emotions live in Headquarters, the control center inside Riley\'s mind, where they help advise her through everyday life. As Riley and her emotions struggle to adjust to a new life in San Francisco, turmoil ensues in Headquarters. Although Joy, Riley\'s main and most important emotion, tries to keep things positive, the emotions conflict on how best to navigate a new city, house and school.', 'https://image.tmdb.org/t/p/w500//2H1TmgdfNtsKlU9jKdeNyYL5y8T.jpg', 6.3268, 'Comedy,Animation,Family'),
(262, 206647, 'Spectre', 2015, 'A cryptic message from Bondâ€™s past sends him on a trail to uncover a sinister organization. While M battles political forces to keep the secret service alive, Bond peels back the layers of deceit to reveal the terrible truth behind SPECTRE.', 'https://image.tmdb.org/t/p/w500//672kUEMtTHcaVYSVY4eiHEliHFa.jpg', 6.20028, 'Action,Adventure,Crime'),
(263, 76757, 'Jupiter Ascending', 2015, 'In a universe where human genetic material is the most precious commodity, an impoverished young Earth woman becomes the key to strategic maneuvers and internal strife within a powerful dynastyâ€¦', 'https://image.tmdb.org/t/p/w500//xzQ25m9vrdyvpLX74T3B3KB40Ou.jpg', 6.18937, 'Science Fiction,Fantasy,Action,Adventure'),
(264, 264660, 'Ex Machina', 2015, 'Caleb, a 26 year old coder at the world\'s largest internet company, wins a competition to spend a week at a private mountain retreat belonging to Nathan, the reclusive CEO of the company. But when Caleb arrives at the remote location he finds that he will have to participate in a strange and fascinating experiment in which he must interact with the world\'s first true artificial intelligence, housed in the body of a beautiful robot girl.', 'https://image.tmdb.org/t/p/w500//dmJW8IAKHKxFNiUnoDR7JfsK7Rp.jpg', 6.11885, 'Drama,Science Fiction'),
(265, 257344, 'Pixels', 2015, 'Video game experts are recruited by the military to fight 1980s-era video game characters who\'ve attacked New York.', 'https://image.tmdb.org/t/p/w500//rV5DzghQv6z6Yagak6ysKE77nuf.jpg', 5.98499, 'Action,Comedy,Science Fiction'),
(266, 99861, 'Avengers: Age of Ultron', 2015, 'When Tony Stark tries to jumpstart a dormant peacekeeping program, things go awry and Earthâ€™s Mightiest Heroes are put to the ultimate test as the fate of the planet hangs in the balance. As the villainous Ultron emerges, it is up to The Avengers to stop him from enacting his terrible plans, and soon uneasy alliances and unexpected action pave the way for an epic and unique global adventure.', 'https://image.tmdb.org/t/p/w500//4ssDuvEDkSArWEdyBl2X5EHvYKU.jpg', 5.94493, 'Action,Adventure,Science Fiction'),
(267, 273248, 'The Hateful Eight', 2015, 'Bounty hunters seek shelter from a raging blizzard and get caught up in a plot of betrayal and deception.', 'https://image.tmdb.org/t/p/w500//jIywvdPjia2t3eKYbjVTcwBQlG8.jpg', 5.8984, 'Crime,Drama,Mystery,Western'),
(268, 260346, 'Taken 3', 2015, 'Ex-government operative Bryan Mills finds his life is shattered when he\'s falsely accused of a murder that hits close to home. As he\'s pursued by a savvy police inspector, Mills employs his particular set of skills to track the real killer and exact his unique brand of justice.', 'https://image.tmdb.org/t/p/w500//vzvMXMypMq7ieDofKThsxjHj9hn.jpg', 5.74976, 'Crime,Action,Thriller'),
(269, 102899, 'Ant-Man', 2015, 'Armed with the astonishing ability to shrink in scale but increase in strength, con-man Scott Lang must embrace his inner-hero and help his mentor, Dr. Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.', 'https://image.tmdb.org/t/p/w500//cj2gWN7TdH1iUG6pUQyqv9N2AXc.jpg', 5.57318, 'Science Fiction,Action,Adventure'),
(270, 150689, 'Cinderella', 2015, 'When her father unexpectedly passes away, young Ella finds herself at the mercy of her cruel stepmother and her daughters. Never one to give up hope, Ella\'s fortunes begin to change after meeting a dashing stranger in the woods.', 'https://image.tmdb.org/t/p/w500//ryKwNlAfDXu0do6SX9h4G9Si1kG.jpg', 5.55682, 'Romance,Fantasy,Family,Drama'),
(271, 131634, 'The Hunger Games: Mockingjay - Part 2', 2015, 'With the nation of Panem in a full scale war, Katniss confronts President Snow in the final showdown. Teamed with a group of her closest friends â€“ including Gale, Finnick, and Peeta â€“ Katniss goes off on a mission with the unit from District 13 as they risk their lives to stage an assassination attempt on President Snow who has become increasingly obsessed with destroying her. The mortal traps, enemies, and moral choices that await Katniss will challenge her more than any arena she faced in The Hunger Games.', 'https://image.tmdb.org/t/p/w500//lImKHDfExAulp16grYm8zD5eONE.jpg', 5.47696, 'War,Adventure,Science Fiction'),
(272, 158852, 'Tomorrowland', 2015, 'Bound by a shared destiny, a bright, optimistic teen bursting with scientific curiosity and a former boy-genius inventor jaded by disillusionment embark on a danger-filled mission to unearth the secrets of an enigmatic place somewhere in time and space that exists in their collective memory as \"Tomorrowland.\"', 'https://image.tmdb.org/t/p/w500//iHh0nVGVODAFduF6Q6njdSSCEfX.jpg', 5.46214, 'Action,Family,Science Fiction,Adventure,Mystery'),
(273, 307081, 'Southpaw', 2015, 'Billy \"The Great\" Hope, the reigning junior middleweight boxing champion, has an impressive career, a loving wife and daughter, and a lavish lifestyle. However, when tragedy strikes, Billy hits rock bottom, losing his family, his house and his manager. He soon finds an unlikely savior in Tick Willis, a former fighter who trains the city\'s toughest amateur boxers. With his future on the line, Hope fights to reclaim the trust of those he loves the most.', 'https://image.tmdb.org/t/p/w500//kSQ49Fi3NVTqGGXILmxV2T2pdkG.jpg', 5.33706, 'Action,Drama'),
(274, 254128, 'San Andreas', 2015, 'In the aftermath of a massive earthquake in California, a rescue-chopper pilot makes a dangerous journey across the state in order to rescue his estranged daughter.', 'https://image.tmdb.org/t/p/w500//2Gfjn962aaFSD6eST6QU3oLDZTo.jpg', 4.90783, 'Action,Drama,Thriller'),
(275, 216015, 'Fifty Shades of Grey', 2015, 'When college senior Anastasia Steele steps in for her sick roommate to interview prominent businessman Christian Grey for their campus paper, little does she realize the path her life will take. Christian, as enigmatic as he is rich and powerful, finds himself strangely drawn to Ana, and she to him. Though sexually inexperienced, Ana plunges headlong into an affair -- and learns that Christian\'s true sexual proclivities push the boundaries of pain and pleasure.', 'https://image.tmdb.org/t/p/w500//63kGofUkt1Mx0SIL4XI4Z5AoSgt.jpg', 4.7104, 'Drama,Romance'),
(276, 318846, 'The Big Short', 2015, 'The men who made millions from a global economic meltdown.', 'https://image.tmdb.org/t/p/w500//isuQWbJPbjybBEWdcCaBUPmU0XO.jpg', 4.64805, 'Comedy,Drama'),
(277, 177677, 'Mission: Impossible - Rogue Nation', 2015, 'Ethan and team take on their most impossible mission yet, eradicating the Syndicate - an International rogue organization as highly skilled as they are, committed to destroying the IMF.', 'https://image.tmdb.org/t/p/w500//fRJLXQBHK2wyznK5yZbO7vmsuVK.jpg', 4.56671, 'Action'),
(278, 214756, 'Ted 2', 2015, 'Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he\'s a person in a court of law.', 'https://image.tmdb.org/t/p/w500//220fvwTHqV7nNpRpZItmbVCHLjC.jpg', 4.56455, 'Comedy'),
(279, 207703, 'Kingsman: The Secret Service', 2015, 'The story of a super-secret spy organization that recruits an unrefined but promising street kid into the agency\'s ultra-competitive training program just as a global threat emerges from a twisted tech genius.', 'https://image.tmdb.org/t/p/w500//ay7xwXn1G9fzX9TUBlkGA584rGi.jpg', 4.50379, 'Crime,Comedy,Action,Adventure'),
(280, 314365, 'Spotlight', 2015, 'The true story of how The Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.', 'https://image.tmdb.org/t/p/w500//rBkptJyAMqCfoMwUGQfCpubroec.jpg', 4.06229, 'Drama,Thriller,History'),
(281, 294254, 'Maze Runner: The Scorch Trials', 2015, 'Thomas and his fellow Gladers face their greatest challenge yet: searching for clues about the mysterious and powerful organization known as WCKD. Their journey takes them to the Scorch, a desolate landscape filled with unimaginable obstacles. Teaming up with resistance fighters, the Gladers take on WCKDâ€™s vastly superior forces and uncover its shocking plans for them all.', 'https://image.tmdb.org/t/p/w500//lq9n07JSzdhK5l1TKxQ9SHawNYn.jpg', 3.96889, 'Action,Science Fiction,Thriller'),
(282, 280996, 'Mr. Holmes', 2015, 'The story is set in 1947, following a long-retired Holmes living in a Sussex village with his housekeeper and rising detective son. But then he finds himself haunted by an unsolved 50-year old case. Holmes\' memory isn\'t what it used to be, so he only remembers fragments of the case: a confrontation with an angry husband, a secret bond with his beautiful but unstable wife.', 'https://image.tmdb.org/t/p/w500//iNnHMoj2oldH7O9uL08iGhfHzh.jpg', 3.92733, 'Mystery,Drama'),
(283, 198184, 'Chappie', 2015, 'Every child comes into the world full of promise, and none more so than Chappie: he is gifted, special, a prodigy. Like any child, Chappie will come under the influence of his surroundingsâ€”some good, some badâ€”and he will rely on his heart and soul to find his way in the world and become his own man. But there\'s one thing that makes Chappie different from any one else: he is a robot.', 'https://image.tmdb.org/t/p/w500//hpnuXlKKWznTgbheGe4iQXzkuwJ.jpg', 3.89956, 'Crime,Action,Science Fiction'),
(284, 254470, 'Pitch Perfect 2', 2015, 'The Bellas are back, and they are better than ever. After being humiliated in front of none other than the President of the United States of America, the Bellas are taken out of the Aca-Circuit. In order to clear their name, and regain their status, the Bellas take on a seemingly impossible task: winning an international competition no American team has ever won. In order to accomplish this monumental task, they need to strengthen the bonds of friendship and sisterhood and blow away the competition with their amazing aca-magic! With all new friends and old rivals tagging along for the trip, the Bellas can hopefully accomplish their dreams.', 'https://image.tmdb.org/t/p/w500//fQaEGzFmvTYu3G641WV0Tg9auAt.jpg', 3.87776, 'Comedy,Music'),
(285, 296098, 'Bridge of Spies', 2015, 'During the Cold War, the Soviet Union captures U.S. pilot Francis Gary Powers after shooting down his U-2 spy plane. Sentenced to 10 years in prison, Powers\' only hope is New York lawyer James Donovan, recruited by a CIA operative to negotiate his release. Donovan boards a plane to Berlin, hoping to win the young man\'s freedom through a prisoner exchange. If all goes well, the Russians would get Rudolf Abel, the convicted spy who Donovan defended in court.', 'https://image.tmdb.org/t/p/w500//fmOOjHAQzxr0c1sfcY4qkiSRBH6.jpg', 3.64821, 'Thriller,Drama'),
(286, 257445, 'Goosebumps', 2015, 'A teenager teams up with the daughter of young adult horror author R.L. Stine after the writer\'s imaginary demons are set free on the town of Madison, Delaware.', 'https://image.tmdb.org/t/p/w500//aeZT9pqEgrmXOGdESFkAuVjX6kw.jpg', 3.64454, 'Adventure,Horror,Comedy'),
(287, 264644, 'Room', 2015, 'Jack is a young boy of 5 years old who has lived all his life in one room. He believes everything within it are the only real things in the world. But what will happen when his Ma suddenly tells him that there are other things outside of Room?', 'https://image.tmdb.org/t/p/w500//pCURNjeomWbMSdiP64gj8NVVHTQ.jpg', 3.55785, 'Drama,Thriller'),
(288, 339527, 'Solace', 2015, 'A psychic doctor, John Clancy, works with an FBI special agent in search of a serial killer. After having lived in isolation for two years, since the death of his daughter, Clancy is asked by his friend Joe, an FBI special agent to help him solve several murders committed by a serial killer.', 'https://image.tmdb.org/t/p/w500//pbcXpZgem8kgr90RwIUNAbC2ite.jpg', 3.35832, 'Crime,Drama,Mystery'),
(289, 105864, 'The Good Dinosaur', 2015, 'An epic journey into the world of dinosaurs where an Apatosaurus named Arlo makes an unlikely human friend.', 'https://image.tmdb.org/t/p/w500//8RSkxOO80btfKjyiC5ZiTaCHIT8.jpg', 3.33913, 'Adventure,Animation,Comedy,Family,Fantasy'),
(290, 241554, 'Run All Night', 2015, 'Brooklyn mobster and prolific hit man Jimmy Conlon has seen better days. Longtime best friend of a mob boss, Jimmy is haunted by the sins of his pastâ€”as well as a dogged police detective whoâ€™s been one step behind Jimmy for 30 years. But when Jimmyâ€™s estranged son becomes a target, Jimmy must make a choice between the crime family he chose and the real family he abandoned long ago. Now, with nowhere safe to turn, Jimmy has just one night to figure out exactly where his loyalties lie and to see if he can finally make things right.', 'https://image.tmdb.org/t/p/w500//frzdzHceByAIlwVKvSvY9zqpjyV.jpg', 3.23737, 'Action,Crime,Drama,Mystery,Thriller'),
(291, 167073, 'Brooklyn', 2015, 'In 1950s Ireland and New York, young Ellis Lacey has to choose between two men and two countries.', 'https://image.tmdb.org/t/p/w500//wSYxJKMSpHCLz2zqrRJb9RhxGz6.jpg', 3.22733, 'Drama,Romance'),
(292, 277216, 'Straight Outta Compton', 2015, 'In 1987, five young men, using brutally honest rhymes and hardcore beats, put their frustration and anger about life in the most dangerous place in America into the most powerful weapon they had: their music.  Taking us back to where it all began, Straight Outta Compton tells the true story of how these cultural rebelsâ€”armed only with their lyrics, swagger, bravado and raw talentâ€”stood up to the authorities that meant to keep them down and formed the worldâ€™s most dangerous group, N.W.A.  And as they spoke the truth that no one had before and exposed life in the hood, their voice ignited a social revolution that is still reverberating today.', 'https://image.tmdb.org/t/p/w500//9B63hMwU6iICtNDTISCaZQ5US7R.jpg', 3.20272, 'Drama,Music'),
(293, 274854, 'The Last Witch Hunter', 2015, 'The modern world holds many secrets, but by far the most astounding is that witches still live among us; vicious supernatural creatures intent on unleashing the Black Death upon the world and putting an end to the human race once and for all. Armies of witch hunters have battled this unnatural enemy for centuries, including Kaulder, a valiant warrior who many years ago slayed the all-powerful Witch Queen, decimating her followers in the process. In the moments right before her death, the Queen cursed Kaulder with immortality, forever separating him from his beloved wife and daughter. Today, Kaulder is the last living hunter who has spent his immortal life tracking down rogue witches, all the while yearning for his long-lost family.', 'https://image.tmdb.org/t/p/w500//qXvOpA2nhK5HQ6I95sN3nnMtfjH.jpg', 3.0805, 'Fantasy,Action,Adventure'),
(294, 321697, 'Steve Jobs', 2015, 'Set backstage at three iconic product launches and ending in 1998 with the unveiling of the iMac, Steve Jobs takes us behind the scenes of the digital revolution to paint an intimate portrait of the brilliant man at its epicenter.', 'https://image.tmdb.org/t/p/w500//92vhEJ6xWoDJ8UHECAJaRofaSCZ.jpg', 3.07952, 'History,Drama'),
(295, 203801, 'The Man from U.N.C.L.E.', 2015, 'At the height of the Cold War, a mysterious criminal organization plans to use nuclear weapons and technology to upset the fragile balance of power between the United States and Soviet Union. CIA agent Napoleon Solo and KGB agent Illya Kuryakin are forced to put aside their hostilities and work together to stop the evildoers in their tracks. The duo\'s only lead is the daughter of a missing German scientist, whom they must find soon to prevent a global catastrophe.', 'https://image.tmdb.org/t/p/w500//zkacOORjKJxRswDurffyvkMwriS.jpg', 3.05342, 'Comedy,Action,Adventure'),
(296, 293863, 'The Age of Adaline', 2015, 'After 29-year-old Adaline recovers from a nearly lethal accident, she inexplicably stops growing older. As the years stretch on and on, Adaline keeps her secret to herself  until she meets a man who changes her life.', 'https://image.tmdb.org/t/p/w500//MbILysGhjAbnZi1Okae9wYqLMx.jpg', 3.02585, 'Fantasy,Drama,Romance'),
(297, 325348, 'Hardcore Henry', 2015, 'Henry, a newly resurrected cyborg who must save his wife/creator from the clutches of a psychotic tyrant with telekinetic powers, AKAN, and his army of mercenaries. Fighting alongside Henry is Jimmy, who is Henry\'s only hope to make it through the day. Hardcore takes place over the course of one day, in Moscow, Russia.', 'https://image.tmdb.org/t/p/w500//ik1uZyiMSxF9HqrgRKUNfMCfr3z.jpg', 3.02325, 'Action,Adventure,Science Fiction'),
(298, 228161, 'Home', 2015, 'When Earth is taken over by the overly-confident Boov, an alien race in search of a new place to call home, all humans are promptly relocated, while all Boov get busy reorganizing the planet. But when one resourceful girl, Tip (Rihanna), manages to avoid capture, she finds herself the accidental accomplice of a banished Boov named Oh (Jim Parsons). The two fugitives realize thereâ€™s a lot more at stake than intergalactic relations as they embark on the road trip of a lifetime.', 'https://image.tmdb.org/t/p/w500//ln7DqfqyKosTw1xoa92Q7FRT3Jh.jpg', 2.97644, 'Fantasy,Comedy,Animation,Science Fiction,Family'),
(299, 286565, 'Paper Towns', 2015, 'Quentin Jacobsen has spent a lifetime loving the magnificently adventurous Margo Roth Spiegelman from afar. So when she cracks open a window and climbs back into his life-dressed like a ninja and summoning him for an ingenious campaign of revenge-he follows. After their all-nighter ends and a new day breaks, Q arrives at school to discover that Margo, always an enigma, has now become a mystery. But Q soon learns that there are clues-and they\'re for him. Urged down a disconnected path, the closer he gets, the less Q sees of the girl he thought he knew.', 'https://image.tmdb.org/t/p/w500//eoF6wYVj1vbrCWjL0rBkdZpgrxS.jpg', 2.96825, 'Drama,Mystery,Romance'),
(300, 265208, 'Wild Card', 2015, 'When a Las Vegas bodyguard with lethal skills and a gambling problem gets in trouble with the mob, he has one last playâ€¦ and it\'s all or nothing.', 'https://image.tmdb.org/t/p/w500//zN80Tlly8oMpKbVJv2TfRIj8dHG.jpg', 2.93234, 'Thriller,Crime,Drama'),
(301, 254320, 'The Lobster', 2015, 'In a dystopian near future, single people, according to the laws of The City, are taken to The Hotel, where they are obliged to find a romantic partner in forty-five days or are transformed into beasts and sent off into The Woods.', 'https://image.tmdb.org/t/p/w500//7Y9ILV1unpW9mLpGcqyGQU72LUy.jpg', 2.88513, 'Thriller,Comedy,Drama,Romance,Science Fiction'),
(302, 258480, 'Carol', 2015, 'In 1950s New York, a department-store clerk who dreams of a better life falls for an older, married woman.', 'https://image.tmdb.org/t/p/w500//A8JV3ockAvWOXmcNZyAGqlyTTBw.jpg', 2.88323, 'Romance,Drama'),
(303, 257211, 'The Intern', 2015, '70-year-old widower Ben Whittaker has discovered that retirement isn\'t all it\'s cracked up to be. Seizing an opportunity to get back in the game, he becomes a senior intern at an online fashion site, founded and run by Jules Ostin.', 'https://image.tmdb.org/t/p/w500//9UoAC9tu8kIyRy8AcJnGhnH0gOH.jpg', 2.8148, 'Comedy'),
(304, 253412, 'Everest', 2015, 'Inspired by the incredible events surrounding a treacherous attempt to reach the summit of the world\'s highest mountain, \"Everest\" documents the awe-inspiring journey of two different expeditions challenged beyond their limits by one of the fiercest snowstorms ever encountered by mankind. Their mettle tested by the harshest of elements found on the planet, the climbers will face nearly impossible obstacles as a lifelong obsession becomes a breathtaking struggle for survival.', 'https://image.tmdb.org/t/p/w500//4xmndWnTYTE4bDdlWrkZyaGcZlo.jpg', 2.79802, 'Adventure,Drama'),
(305, 274479, 'Joy', 2015, 'A story based on the life of a struggling Long Island single mom who became one of the country\'s most successful entrepreneurs.', 'https://image.tmdb.org/t/p/w500//drHYguFkQO4nQQFUhRYqIbl45oT.jpg', 2.7933, 'Comedy,Drama'),
(306, 257088, 'Point Break', 2015, 'A young undercover FBI agent infiltrates a gang of thieves who share a common interest in extreme sports. A remake of the 1991 film, \"Point Break\".', 'https://image.tmdb.org/t/p/w500//z7JOvw5Lqs9ezoFTJxmz3nx3av2.jpg', 2.6145, 'Action,Crime,Thriller'),
(307, 295964, 'Burnt', 2015, 'Adam Jones is a Chef who destroyed his career with drugs and diva behavior. He cleans up and returns to London, determined to redeem himself by spearheading a top restaurant that can gain three Michelin stars.', 'https://image.tmdb.org/t/p/w500//iptu4zfvbeULkeuoVkTl2mOqTPS.jpg', 2.58426, 'Drama'),
(308, 238615, 'Self/less', 2015, 'An extremely wealthy elderly man dying from cancer undergoes a radical medical procedure that transfers his consciousness to the body of a healthy young man but everything may not be as good as it seems when he starts to uncover the mystery of the body\'s origins and the secret organization that will kill to keep its secrets.', 'https://image.tmdb.org/t/p/w500//b03zZZTE17iH6klsInFOlrgfYRN.jpg', 2.57892, 'Science Fiction,Mystery,Thriller'),
(309, 210860, 'Mortdecai', 2015, 'Art dealer, Charles Mortdecai, searches for a stolen painting rumored to contain a secret code that gains access to hidden Nazi gold.', 'https://image.tmdb.org/t/p/w500//j7eKGD0n1zRVfKMX6M1kpfavby7.jpg', 2.57571, 'Comedy,Adventure'),
(310, 306819, 'The Danish Girl', 2015, 'When Gerda Wegener asks her husband Einar to fill in as a portrait model, Einar discovers the person she\'s meant to be and begins living her life as Lili Elbe. Having realized her true self and with Gerda\'s love and support, Lili embarks on a groundbreaking journey as a transgender pioneer.', 'https://image.tmdb.org/t/p/w500//mXZZIacI5FC8thzSC0lgQBQ2uAX.jpg', 2.55786, 'Drama'),
(311, 201088, 'Blackhat', 2015, 'A man is released from prison to help American and Chinese authorities pursue a mysterious cyber criminal. The dangerous search leads them from Chicago to Hong Kong.', 'https://image.tmdb.org/t/p/w500//7zu6HPnKPjNA7NuR4DGRdaH0PdX.jpg', 2.55075, 'Mystery,Crime,Action,Thriller,Drama'),
(312, 273481, 'Sicario', 2015, 'A young female FBI agent joins a secret CIA operation to take down a Mexican cartel boss, a job that ends up pushing her ethical and moral values to the limit.', 'https://image.tmdb.org/t/p/w500//lz8vNyXeidqqOdJW9ZjnDAMb5Vr.jpg', 2.48785, 'Action,Crime,Drama,Mystery,Thriller'),
(313, 166424, 'Fantastic Four', 2015, 'Four young outsiders teleport to a dangerous universe, which alters their physical form in shocking ways. Their lives irrevocably upended, the team must learn to harness their daunting new abilities and work together to save Earth from a former friend turned enemy.', 'https://image.tmdb.org/t/p/w500//oeMpEsjmiT9PEJbRM1Fm7TZ1dE0.jpg', 2.48704, 'Action,Adventure,Science Fiction'),
(314, 310131, 'The Witch', 2015, 'New England in the 1630s: William and Katherine lead a devout Christian life with five children, homesteading on the edge of an impassable wilderness. When their newborn son vanishes and crops fail, the family turns on one another. Beyond their worst fears, a supernatural evil lurks in the nearby wood.', 'https://image.tmdb.org/t/p/w500//o384OC1tCV8nCnozkM6y4MiSqsw.jpg', 2.46449, 'Mystery,Horror'),
(315, 238713, 'Spy', 2015, 'A desk-bound CIA analyst volunteers to go undercover to infiltrate the world of a deadly arms dealer, and prevent diabolical global disaster.', 'https://image.tmdb.org/t/p/w500//6On9Ed52fz8W1h9PzaDQ12ZfHdn.jpg', 2.40447, 'Action,Comedy,Crime'),
(316, 256591, 'Focus', 2015, 'A veteran grifter takes a young, attractive woman under his wing, but things get complicated when they become romantically involved.', 'https://image.tmdb.org/t/p/w500//lOzGWjceYTd0kd5HyX7Ch46O9kh.jpg', 2.39537, 'Romance,Comedy,Crime,Drama'),
(317, 249070, 'Hitman: Agent 47', 2015, 'An assassin teams up with a woman to help her find her father and uncover the mysteries of her ancestry.', 'https://image.tmdb.org/t/p/w500//52NXkgvzRYjRnqRPpqjpiwsIgRG.jpg', 2.35465, 'Action,Crime,Thriller'),
(318, 205775, 'In the Heart of the Sea', 2015, 'In the winter of 1820, the New England whaling ship Essex was assaulted by something no one could believe: a whale of mammoth size and will, and an almost human sense of vengeance.  The real-life maritime disaster would inspire Herman Melvilleâ€™s Moby Dick.Â  But that told only half the story.Â  â€œHeart of the Seaâ€ reveals the encounterâ€™s harrowing aftermath, as the shipâ€™s surviving crew is pushed to their limits and forced to do the unthinkable to stay alive.Â  Braving storms, starvation, panic and despair, the men will call into question their deepest beliefs, from the value of their lives to the morality of their trade, as their captain searches for direction on the open sea and his first mate still seeks to bring the great whale down.', 'https://image.tmdb.org/t/p/w500//weVvNPfk6FM9vBg3BXtRtNAmiYM.jpg', 2.34582, 'Thriller,Drama,Adventure,Action,History'),
(319, 334074, 'Survivor', 2015, 'A Foreign Service Officer in London tries to prevent a terrorist attack set to hit New York, but is forced to go on the run when she is framed for crimes she did not commit.', 'https://image.tmdb.org/t/p/w500//npyCpfYyYknFoY2iJPyfqp70FVX.jpg', 2.33164, 'Crime,Thriller,Action'),
(320, 312221, 'Creed', 2015, 'The former World Heavyweight Champion Rocky Balboa serves as a trainer and mentor to Adonis Johnson, the son of his late friend and former rival Apollo Creed.', 'https://image.tmdb.org/t/p/w500//1BfTsk5VWuw8FCocAhCyqnRbEzq.jpg', 2.33157, 'Drama'),
(321, 271718, 'Trainwreck', 2015, 'Having thought that monogamy was never possible, a commitment-phobic career woman may have to face her fears when she meets a good guy.', 'https://image.tmdb.org/t/p/w500//wrY629UTCUAKLJ4CxQXz6DCE7pr.jpg', 2.31767, 'Comedy'),
(322, 333352, 'Eye in the Sky', 2015, 'A military officer in command of a drone operation to capture terrorists in Kenya sees her mission escalate from â€œcaptureâ€ to â€œkillâ€ just as a nine-year old girl enters the kill zone.', 'https://image.tmdb.org/t/p/w500//faRGb9SuyGuZpsNRoIxoVSLLCId.jpg', 2.29573, 'Drama,Thriller,War'),
(323, 276907, 'Legend', 2015, 'Suave, charming and volatile, Reggie Kray and his unstable twin brother Ronnie start to leave their mark on the London underworld in the 1960s. Using violence to get what they want, the siblings orchestrate robberies and murders while running nightclubs and protection rackets. With police Detective Leonard \"Nipper\" Read hot on their heels, the brothers continue their rapid rise to power and achieve tabloid notoriety.', 'https://image.tmdb.org/t/p/w500//4shf5Alq4KWCKqrAAQe0JGJHYp5.jpg', 2.28135, 'Crime,Thriller'),
(324, 284289, 'Beyond the Reach', 2015, 'A high-rolling corporate shark and his impoverished young guide play the most dangerous game during a hunting trip in the Mojave Desert.', 'https://image.tmdb.org/t/p/w500//t6m6ICEG7KrnyYQpROISURkuCD5.jpg', 2.27204, 'Thriller'),
(325, 266647, 'Pan', 2015, 'Living a bleak existence at a London orphanage, 12-year-old Peter finds himself whisked away to the fantastical world of Neverland. Adventure awaits as he meets new friend James Hook and the warrior Tiger Lily. They must band together to save Neverland from the ruthless pirate Blackbeard. Along the way, the rebellious and mischievous boy discovers his true destiny, becoming the hero forever known as Peter Pan.', 'https://image.tmdb.org/t/p/w500//cjcrkPeQkrkEVYrd3lHWJbfBdrv.jpg', 2.23457, 'Adventure,Family,Fantasy'),
(326, 347096, 'Mythica: The Darkspore', 2015, 'When Teelaâ€™s sister is murdered and a powerful relic stolen, Marek and her friends face a sinister new enemy â€“ Kishkumen, a foreign mystic bent on reclaiming the Darkspore for his master Szorlok. Armed with twin maps, Marek and her team race Kishkumen and his horde through creature-infested lands, to a long abandoned underground city â€“ all the while pursued by bounty hunters intent on returning Marek to slavery.', 'https://image.tmdb.org/t/p/w500//2Al0ncYtEh0frfCm52pALJGR7z8.jpg', 2.16543, 'Action,Adventure,Fantasy'),
(327, 308369, 'Me and Earl and the Dying Girl', 2015, 'Greg is coasting through senior year of high school as anonymously as possible, avoiding social interactions like the plague while secretly making spirited, bizarre films with Earl, his only friend. But both his anonymity and friendship threaten to unravel when his mother forces him to befriend a classmate with leukemia.', 'https://image.tmdb.org/t/p/w500//eLjS2bLMjln2n2I73Xu6TaANPDZ.jpg', 2.14151, 'Comedy,Drama'),
(328, 227973, 'The Peanuts Movie', 2015, 'Snoopy embarks upon his greatest mission as he and his team take to the skies to pursue their arch-nemesis, while his best pal Charlie Brown begins his own epic quest back home.', 'https://image.tmdb.org/t/p/w500//dZOcwqxurYhDyjmdnhYcGnn1agL.jpg', 2.1402, 'Adventure,Animation,Comedy,Family'),
(329, 321741, 'Concussion', 2015, 'A dramatic thriller based on the incredible true David vs. Goliath story of American immigrant Dr. Bennet Omalu, the brilliant forensic neuropathologist who made the first discovery of CTE, a football-related brain trauma, in a pro player and fought for the truth to be known. Omalu\'s emotional quest puts him at dangerous odds with one of the most powerful institutions in the world.', 'https://image.tmdb.org/t/p/w500//gseayWAIFt3GQrEUNuUcYxT77Ud.jpg', 2.12188, 'Drama'),
(330, 296100, 'The Night Before', 2015, 'In New York City for their annual tradition of Christmas Eve debauchery, three lifelong best friends set out to find the Holy Grail of Christmas parties since their yearly reunion might be coming to an end.', 'https://image.tmdb.org/t/p/w500//rfeNBaiMBg0UQsBQFv1qsjTjZWn.jpg', 2.09627, 'Comedy'),
(331, 263472, 'Knock Knock', 2015, 'When a devoted husband and father is left home alone for the weekend, two stranded young women unexpectedly knock on his door for help. What starts out as a kind gesture results in a dangerous seduction and a deadly game of cat and mouse.', 'https://image.tmdb.org/t/p/w500//cUC4rUb1Cs2KMaZ6RD4uYUEEwls.jpg', 2.08094, 'Drama,Horror,Thriller'),
(332, 228205, 'The Longest Ride', 2015, 'The lives of a young couple intertwine with a much older man as he reflects back on a lost love while he\'s trapped in an automobile crash.', 'https://image.tmdb.org/t/p/w500//qdUVfvPBvT6cetDDM7rn8y2CNZE.jpg', 2.07071, 'Romance,Drama'),
(333, 159824, 'Hotel Transylvania 2', 2015, 'When the old-old-old-fashioned vampire Vlad arrives at the hotel for an impromptu family get-together, Hotel Transylvania is in for a collision of supernatural old-school and modern day cool.', 'https://image.tmdb.org/t/p/w500//kKFgwQnR5q08UFsAvtoYyTIiHyj.jpg', 2.06016, 'Animation,Comedy,Family'),
(334, 333348, 'Love the Coopers', 2015, 'When four generations of the Cooper clan come together for their annual Christmas Eve celebration, a series of unexpected visitors and unlikely events turn the night upside down, leading them all toward a surprising rediscovery of family bonds and the spirit of the holiday.', 'https://image.tmdb.org/t/p/w500//fPW1BHZhUEViOmDAHFfyLezoQdI.jpg', 2.05557, 'Family,Comedy'),
(335, 285783, 'The Walk', 2015, 'The story of French high-wire artist Philippe Petit\'s attempt to cross the Twin Towers of the World Trade Center in 1974.', 'https://image.tmdb.org/t/p/w500//tiESRqurrZwAC0hpERogOsBhjeg.jpg', 2.04989, 'Adventure,Drama,Thriller'),
(336, 290764, 'Tracers', 2015, 'Wanted by the mafia, a New York City bike messenger escapes into the world of parkour after meeting a beautiful stranger.', 'https://image.tmdb.org/t/p/w500//2XoazCkD4gRlqkJK7q6TOTUx1ta.jpg', 2.02665, 'Action,Crime,Drama'),
(337, 296099, 'Vacation', 2015, 'Hoping to bring his family closer together and to recreate his childhood vacation for his own kids, a grown up Rusty Griswold takes his wife and their two sons on a cross-country road trip to the coolest theme park in America, Walley World. Needless to say, things don\'t go quite as planned.', 'https://image.tmdb.org/t/p/w500//z79MzBerDAW2EOQZCobFTO4dJ7P.jpg', 2.00034, 'Adventure,Comedy'),
(338, 243688, 'Poltergeist', 2015, 'Legendary filmmaker Sam Raimi and director Gil Kenan reimagine and contemporize the classic tale about a family whose suburban home is invaded by angry spirits. When the terrifying apparitions escalate their attacks and take the youngest daughter, the family must come together to rescue her.', 'https://image.tmdb.org/t/p/w500//A1ymtbzatZp94Z49ZOBb8JGXOBB.jpg', 1.98453, 'Horror,Thriller'),
(339, 287424, 'Maggie', 2015, 'There\'s a deadly zombie epidemic threatening humanity, but Wade, a small-town farmer and family man, refuses to accept defeat even when his daughter Maggie becomes infected. As Maggie\'s condition worsens and the authorities seek to eradicate those with the virus, Wade is pushed to the limits in an effort to protect her. Joely Richardson co-stars in this post-apocalyptic thriller.', 'https://image.tmdb.org/t/p/w500//twa9gXjocLM629sJrQYVtmF306R.jpg', 1.98004, 'Horror'),
(340, 301875, 'Equals', 2015, 'A futuristic love story set in a world where emotions have been eradicated.', 'https://image.tmdb.org/t/p/w500//vP1i0dddTbLL3pyddrSCPnJa8S7.jpg', 1.95976, 'Drama,Romance,Science Fiction'),
(341, 181283, 'Child 44', 2015, 'Set in Stalin-era Soviet Union, a disgraced MGB agent is dispatched to investigate a series of child murders -- a case that begins to connect with the very top of party leadership.', 'https://image.tmdb.org/t/p/w500//qqGhMt31HVUN3WnH0L2r0OWq38E.jpg', 1.95632, 'Crime,Thriller'),
(342, 328425, 'The Gift', 2015, 'A husband and wife try to reinvigorate their relationship but their lives are threatened by a \"friend\" from the husband\'s past who holds a horrifying secret about him, sending their world into a tailspin.', 'https://image.tmdb.org/t/p/w500//kH3qLP8pn68Xq5XwvmPkCyaAU7W.jpg', 1.92674, 'Thriller,Mystery'),
(343, 274167, 'Daddy\'s Home', 2015, 'The story of a mild-mannered radio executive (Ferrell) who strives to become the best stepdad ever to his wife\'s two children, but complications ensue when their freewheeling, freeloading real father arrives, forcing stepdad to compete for the affection of the kids.', 'https://image.tmdb.org/t/p/w500//fB9lALk9zKsMYWvf0bJSkJN219Z.jpg', 1.9049, 'Comedy'),
(344, 370687, 'Mythica: The Necromancer', 2015, 'Mallister takes Thane prisoner and forces Marek and her team on a quest.  Marek tracks down the Necromancer for a final showdown for the Darkspore.', 'https://image.tmdb.org/t/p/w500//vlAda6yYXQXXrzSUQC4Wl9QyFV4.jpg', 1.87604, 'Fantasy,Action,Adventure'),
(345, 307663, 'Vice', 2015, 'Julian Michaels has designed the ultimate resort: VICE, where anything goes and the customers can play out their wildest fantasies with artificial inhabitants who look, think and feel like humans. When an artificial becomes self-aware and escapes, she finds herself caught in the crossfire between Julian\'s mercenaries and a cop who is hell-bent on shutting down Vice, and stopping the violence once and for all.', 'https://image.tmdb.org/t/p/w500//cBwZIq1QFasmsC9Wi3HvyEljfYN.jpg', 1.8727, 'Thriller,Science Fiction,Action,Adventure'),
(346, 309809, 'The Little Prince', 2015, 'Based on the best-seller book \'The Little Prince\', the movie tells the story of a little girl that lives with resignation in a world where efficiency and work are the only dogmas. Everything will change when accidentally she discovers her neighbor that will tell her about the story of the Little Prince that he once met.', 'https://image.tmdb.org/t/p/w500//je5Z7gbFTzrs3FPHINo9yGiHoVo.jpg', 1.86501, 'Adventure,Animation,Fantasy'),
(347, 258509, 'Alvin and the Chipmunks: The Road Chip', 2015, 'Through a series of misunderstandings, Alvin, Simon and Theodore come to believe that Dave is going to propose to his new girlfriend in New York City - and dump them. They have three days to get to him and stop the proposal.', 'https://image.tmdb.org/t/p/w500//aQhFoqby8UYq4uGQXOtV7P8JLBl.jpg', 1.84178, 'Adventure,Animation,Comedy,Family'),
(348, 298382, 'The Dressmaker', 2015, 'In 1950s Australia, beautiful, talented dressmaker Tilly returns to her tiny hometown to right wrongs from her past. As she tries to reconcile with her mother, she starts to fall in love while transforming the fashion of the town.', 'https://image.tmdb.org/t/p/w500//o0Og4rsOhdk8KIZdGcSR1cjhj7Q.jpg', 1.82313, 'Drama'),
(349, 272693, 'The DUFF', 2015, 'Bianca\'s universe turns upside down when she learns that her high school refers to her as a â€˜DUFF\' (Designated Ugly Fat Friend). Hoping to erase that label, she enlists the help of a charming jock and her favorite teacher. Together they\'ll face the school\'s mean girl and remind everyone that we are all someone\'s DUFFâ€¦ and that\'s totally fine.', 'https://image.tmdb.org/t/p/w500//nfad87VEmIHUf7LM2sl5RxDQzUS.jpg', 1.75862, 'Romance,Comedy'),
(350, 283445, 'Sinister 2', 2015, 'A young mother and her twin sons move into a rural house that\'s marked for death.', 'https://image.tmdb.org/t/p/w500//jLNUo05tEYaPMTmEoYTld8XYmOt.jpg', 1.74229, 'Horror'),
(351, 256961, 'Paul Blart: Mall Cop 2', 2015, 'Security guard Paul Blart is headed to Las Vegas to attend a Security Guard Expo with his teenage daughter Maya before she departs for college. While at the convention, he inadvertently discovers a heist - and it\'s up to Blart to apprehend the criminals.', 'https://image.tmdb.org/t/p/w500//59NF8vsPV84KLhsWBH7rHZbLpDN.jpg', 1.73518, 'Action,Adventure,Comedy,Family'),
(352, 326359, 'Frozen Fever', 2015, 'On Anna\'s birthday, Elsa and Kristoff are determined to give her the best celebration ever, but Elsa\'s icy powers may put more than just the party at risk.', 'https://image.tmdb.org/t/p/w500//mPrDJ7puYzPLG5kPM96iNszF2sM.jpg', 1.72471, 'Adventure,Animation,Family'),
(353, 254302, 'High-Rise', 2015, 'Dr. Robert Laing is the newest resident of a luxurious apartment in a high-tech concrete skyscraper whose lofty location places him amongst the upper class. Laing quickly settles into high-society life and meets the buildingâ€™s eccentric tenants: Charlotte, his upstairs neighbor and bohemian single mother; Wilder, a charismatic documentarian who lives with his pregnant wife Helen; and Mr. Royal, the enigmatic architect who designed the building. Life seems like paradise to the solitude-seeking Laing. But as power outages become more frequent and building flaws emerge, particularly on the lower floors, the regimented social strata begins to crumble and the building becomes a battlefield in a literal class war.', 'https://image.tmdb.org/t/p/w500//tNBHTOdIoeT5PMnt4TJpTm1nohG.jpg', 1.66179, 'Action,Drama,Science Fiction'),
(354, 241251, 'The Boy Next Door', 2015, 'A recently cheated on married woman falls for a younger man who has moved in next door, but their torrid affair soon takes a dangerous turn.', 'https://image.tmdb.org/t/p/w500//tM0hpWw3GONam6TKcMMciecHjhT.jpg', 1.65108, 'Thriller'),
(355, 292040, 'Spooks: The Greater Good', 2015, 'During a handover to the head of counter-terrorism of MI5 Harry Pearce, terrorist Adam Qasim escapes from MI5 custody. When Harry disappears soon after, his protÃ©gÃ© Will Crombie is tasked with finding out what happened as an impending attack on London looms. Crombie eventually uncovers a deadly conspiracy.', 'https://image.tmdb.org/t/p/w500//bpK63x3M7uFtoIetK5YniHXLE28.jpg', 1.64666, 'Thriller,Action'),
(356, 188222, 'Entourage', 2015, 'Movie star Vincent Chase, together with his boys, Eric, Turtle and Johnny, are backâ€¦and back in business with super agent-turned-studio head Ari Gold. Some of their ambitions have changed, but the bond between them remains strong as they navigate the capricious and often cutthroat world of Hollywood.', 'https://image.tmdb.org/t/p/w500//28dqsx1jCxhR05DfH35ui13ywNZ.jpg', 1.533, 'Comedy'),
(357, 252838, 'The Wedding Ringer', 2015, 'Doug Harris is a loveable but socially awkward groom-to-be with a problem: he has no best man.  With less than two weeks to go until he marries the girl of his dreams, Doug is referred to Jimmy Callahan, owner and CEO of Best Man, Inc., a company that provides flattering best men for socially challenged guys in need.  What ensues is a hilarious wedding charade as they try to pull off the big con, and an unexpected budding bromance between Doug and his fake\n best man Jimmy.', 'https://image.tmdb.org/t/p/w500//nh9VKA4LEPKkoCljnDNHtSIhKbF.jpg', 1.5101, 'Comedy'),
(358, 273477, 'Scouts Guide to the Zombie Apocalypse', 2015, 'Three scouts and lifelong friends join forces with one badass cocktail waitress to become the worldâ€™s most unlikely team of heroes.  When their peaceful town is ravaged by a zombie invasion, theyâ€™ll fight for the badge of a lifetime and put their scouting skills to the test to save mankind from the undead.', 'https://image.tmdb.org/t/p/w500//lUKvvSnjFlazrdh6wyHxHrdMknD.jpg', 1.49961, 'Comedy,Horror'),
(359, 298312, 'The Visit', 2015, 'The terrifying story of a brother and sister who are sent to their grandparents\' remote Pennsylvania farm for a weeklong trip. Once the children discover that the elderly couple is involved in something deeply disturbing, they see their chances of getting back home are growing smaller every day.', 'https://image.tmdb.org/t/p/w500//tpB9RXP9x7Rg59xCghPtOWnYJVl.jpg', 1.49511, 'Horror,Thriller'),
(360, 261023, 'Black Mass', 2015, 'The true story of Whitey Bulger, the brother of a state senator and the most infamous violent criminal in the history of South Boston, who became an FBI informant to take down a Mafia family invading his turf.', 'https://image.tmdb.org/t/p/w500//zfwciv4LIJkNQsfuhYGv0Nkiweg.jpg', 1.48325, 'Crime,Drama'),
(361, 336004, 'Heist', 2015, 'A father is without the means to pay for his daughter\'s medical treatment. As a last resort, he partners with a greedy co-worker to rob a casino. When things go awry they\'re forced to hijack a city bus.', 'https://image.tmdb.org/t/p/w500//eKdz5i9gbzJthAxUZBBj5SVbzKR.jpg', 1.44907, 'Crime,Action,Thriller'),
(362, 287903, 'Krampus', 2015, 'A horror comedy based on the ancient legend about a pagan creature who punishes children on Christmas.', 'https://image.tmdb.org/t/p/w500//bm0DzPPIR7mglpgDIxA3Y7AoEk4.jpg', 1.448, 'Horror,Comedy,Fantasy'),
(363, 182560, 'Dark Places', 2015, 'A woman who survived the brutal killing of her family as a child is forced to confront the events of that day.', 'https://image.tmdb.org/t/p/w500//acJXtT4ZX7nWIhOaCfSAGBxFw71.jpg', 1.44341, 'Drama,Mystery,Thriller'),
(364, 192141, 'No Escape', 2015, 'In their new overseas home, an American family soon finds themselves caught in the middle of a coup, and they frantically look for a safe escape in an environment where foreigners are being immediately executed.', 'https://image.tmdb.org/t/p/w500//6WLnzTG4Hz3lFvfZGSsyB8NFGgM.jpg', 1.41239, 'Action,Thriller'),
(365, 308639, 'Dope', 2015, 'Malcolm is carefully surviving life in a tough neighborhood in Los Angeles while juggling college applications, academic interviews, and the SAT. A chance invitation to an underground party leads him into an adventure that could allow him to go from being a geek, to being dope, to ultimately being himself.', 'https://image.tmdb.org/t/p/w500//n6u00imN7AX2NiyWUc5kTgHXmEf.jpg', 1.40805, 'Crime,Drama,Comedy'),
(366, 261392, 'American Ultra', 2015, 'American Ultra is a fast-paced action comedy about Mike, a seemingly hapless and unmotivated stoner whose small-town life with his live-in girlfriend, Phoebe, is suddenly turned upside down.  Unbeknownst to him, Mike is actually a highly trained, lethal sleeper agent. In the blink of an eye, as his secret past comes back to haunt him, Mike is thrust into the middle of a deadly government operation and is forced to summon his inner action-hero in order to survive.', 'https://image.tmdb.org/t/p/w500//bi2MCDYvrZQPf1uXyvfVYPE57Mz.jpg', 1.38825, 'Comedy,Action'),
(367, 304357, 'Woman in Gold', 2015, 'Maria Altmann, an octogenarian Jewish refugee, takes on the Austrian government to recover a world famous painting of her aunt plundered by the Nazis during World War II, she believes rightfully belongs to her family. She did so not just to regain what was rightfully hers, but also to obtain some measure of justice for the death, destruction, and massive art theft perpetrated by the Nazis.', 'https://image.tmdb.org/t/p/w500//6eoj6bozvgwNuDV3vOrqlvrCrX.jpg', 1.38803, 'Drama'),
(368, 297291, 'The Scorpion King: The Lost Throne', 2015, 'When he is betrayed by a trusted friend, Mathayus must marshal all his strength and cunning to outwit a formidable opponent who will stop at nothing to unlock a supreme ancient power.', 'https://image.tmdb.org/t/p/w500//5GISNwtHWbmYJdbFHMpLoaotYhL.jpg', 1.38032, 'Action,Fantasy,Adventure'),
(369, 266294, 'Sisters', 2015, 'Two disconnected sisters are summoned to clean out their childhood bedrooms before their parents sell their family home.', 'https://image.tmdb.org/t/p/w500//hpvHqAiusQtGNDx48dA3z5ejjon.jpg', 1.37661, 'Comedy'),
(370, 227719, 'Project Almanac', 2015, 'A group of teens discover secret plans of a time machine, and construct one. However, things start to get out of control.', 'https://image.tmdb.org/t/p/w500//r59tzuqi6AoxRKdPHzg3ZBke7aA.jpg', 1.36093, 'Science Fiction,Thriller'),
(371, 86828, 'Absolutely Anything', 2015, 'Eccentric aliens give a man the power to do anything he wants to determine if Earth is worth saving.', 'https://image.tmdb.org/t/p/w500//tnBt9yPCQwnXLwioqfgnL5hqGM6.jpg', 1.36083, 'Comedy,Science Fiction');
INSERT INTO `movie` (`uid`, `tmdb_id`, `title`, `release_year`, `overview`, `poster`, `popularity`, `genres`) VALUES
(372, 287948, 'The Transporter Refueled', 2015, 'The fast-paced action movie is again set in the criminal underworld in France, where Frank Martin is known as The Transporter, because he is the best driver and mercenary money can buy. In this installment, he meets Anna and they attempt to take down a group of ruthless Russian human traffickers who also have kidnapped Frankâ€™s father.', 'https://image.tmdb.org/t/p/w500//71kaQfdrMy0LHSeLRADsvlDGCgb.jpg', 1.35582, 'Thriller,Action,Crime'),
(373, 201085, 'Crimson Peak', 2015, 'In the aftermath of a family tragedy, an aspiring author is torn between love for her childhood friend and the temptation of a mysterious outsider. Trying to escape the ghosts of her past, she is swept away to a house that breathes, bleedsâ€¦ and remembers.', 'https://image.tmdb.org/t/p/w500//s6cFBCAlfFBwBKVgJOme3JpjZLo.jpg', 1.34598, 'Mystery,Thriller,Fantasy,Horror,Drama'),
(374, 277355, 'Everly', 2015, 'After she betrays a powerful mob boss, a woman matches wits and weaponry with a legion of killers who are out to collect the bounty on the heads of her and her family.', 'https://image.tmdb.org/t/p/w500//2As9fPVTZ1jF6uaTweiVw1RRFDD.jpg', 1.34284, 'Thriller,Action'),
(375, 264999, 'Magic Mike XXL', 2015, 'Three years after Mike bowed out of the stripper life at the top of his game, he and the remaining Kings of Tampa hit the road to Myrtle Beach to put on one last blow-out performance.', 'https://image.tmdb.org/t/p/w500//mXWbLqTWziO9aAyWMBzVnDSP57t.jpg', 1.33848, 'Comedy,Drama,Music'),
(376, 146301, 'Paranormal Activity: The Ghost Dimension', 2015, 'Using a special camera that can see spirits, a family must protect their daughter from an evil entity with a sinister plan.', 'https://image.tmdb.org/t/p/w500//4R4DWo10V6CGq9wCRYoOubL1w2q.jpg', 1.33832, 'Horror,Thriller'),
(377, 223485, 'Slow West', 2015, 'In the Old West, a 17-year-old Scottish boy teams up with a mysterious gunman to find the woman with whom he is infatuated.', 'https://image.tmdb.org/t/p/w500//j3PmbRZvf5KpNbapSjn8b0CpD6a.jpg', 1.3297, 'Romance,Thriller,Western'),
(378, 294016, 'Trumbo', 2015, 'The career of screenwriter Dalton Trumbo is halted by a witch hunt in the late 1940s when he defies the anti-communist HUAC committee and is blacklisted.', 'https://image.tmdb.org/t/p/w500//2RERIRnZkROSeHZAIf8PSxhzOqs.jpg', 1.31624, 'Drama'),
(379, 290751, 'Secret in Their Eyes', 2015, 'A tight-knit team of FBI investigators, along with their District Attorney supervisor, is suddenly torn apart when they discover that one of their own teenage daughters has been brutally murdered.', 'https://image.tmdb.org/t/p/w500//gJl4iTxQlazkPCplGmSLGBUwqg9.jpg', 1.31527, 'Crime,Drama,Mystery'),
(380, 309245, 'Mistress America', 2015, 'Tracy, a lonely college freshman in New York, is rescued from her solitude by her soon-to-be stepsister Brooke, an adventurous gal about town who entangles her in alluringly mad schemes. Mistress America is a comedy about dream-chasing, score-settling, makeshift families, and cat-stealing.', 'https://image.tmdb.org/t/p/w500//rvwV64gSgftNFIOkWBZhan17R27.jpg', 1.29314, 'Comedy'),
(381, 228165, 'The SpongeBob Movie: Sponge Out of Water', 2015, 'Burger Beard is a pirate who is in search of the final page of a magical book that makes any evil plan he writes in it come true, which happens to be the Krabby Patty secret formula. When the entire city of Bikini Bottom is put in danger, SpongeBob, Patrick, Mr. Krabs, Squidward, Sandy, and Plankton need to go on a quest that takes them to the surface. In order to get back the recipe and save their city, the gang must retrieve the book and transform themselves into superheroes.', 'https://image.tmdb.org/t/p/w500//2WDmjUlSAPlA27i2OwEC7sRTFw3.jpg', 1.29101, 'Family,Animation'),
(382, 245706, 'True Story', 2015, 'A drama centered around the relationship between journalist Michael Finkel and Christian Longo, an FBI Most Wanted List murderer who for years lived outside the U.S. under Finkel\'s name.', 'https://image.tmdb.org/t/p/w500//ncP8XQ0bXP0xSpJmMsRt8mUcEXd.jpg', 1.28454, 'Crime,Drama,Mystery'),
(383, 272878, 'Max', 2015, 'A dog that helped soldiers in Afghanistan returns to the U.S. and is adopted by his handler\'s family after suffering a traumatic experience.', 'https://image.tmdb.org/t/p/w500//d3ACos3t4YwXML8keTA0wKN8e36.jpg', 1.27893, 'Adventure,Drama,Family'),
(384, 263109, 'Shaun the Sheep Movie', 2015, 'When Shaun decides to take the day off and have some fun, he gets a little more action than he bargained for. A mix up with the Farmer, a caravan and a very steep hill lead them all to the Big City and it\'s up to Shaun and the flock to return everyone safely to the green grass of home.', 'https://image.tmdb.org/t/p/w500//dhVYlfMNc2bfXPB83LLL00I4l9n.jpg', 1.25358, 'Family,Animation,Comedy,Adventure'),
(385, 157827, 'Louder Than Bombs', 2015, 'Three years after his wife, acclaimed photographer Isabelle Reed, dies in a car crash, Gene keeps everyday life going with his shy teenage son, Conrad. A planned exhibition of Isabelleâ€™s photographs prompts Gene\'s older son, Jonah, to return to the house he grew up in - and for the first time in a very long time, the father and the two brothers are living under the same roof.', 'https://image.tmdb.org/t/p/w500//26hoecTKEAXswDwk4nUE4SEcPg2.jpg', 1.25168, 'Drama'),
(386, 321751, 'A Perfect Day', 2015, 'Film about a group of aid workers trying to resolve a crisis in an armed conflict zone in the Balkans.', 'https://image.tmdb.org/t/p/w500//musAGdMpfvxhNvEnxXgmzcjBxWL.jpg', 1.24522, 'Comedy,Drama'),
(387, 266396, 'The Gunman', 2015, 'Eight years after fleeing the Congo following his assassination of that country\'s minister of mining, former assassin Jim Terrier is back, suffering from PTSD and digging wells to atone for his violent past. After an attempt is made on his life, Terrier flies to London to find out who wants him dead -- and why. Terrier\'s search leads him to a reunion with Annie, a woman he once loved, who is now married to an oily businessman with dealings in Africa.', 'https://image.tmdb.org/t/p/w500//lnUozDnDANTsDYEdsNsHC6b8IiS.jpg', 1.22532, 'Action,Drama,Crime'),
(388, 277685, 'Unfriended', 2015, 'While video chatting one night, six high school friends receive a Skype message from a classmate who killed herself exactly one year ago. A first they think it\'s a prank, but when the girl starts revealing the friends\' darkest secrets, they realize they are dealing with something out of this world, something that wants them dead. Told entirely from a young girl\'s computer desktop, Unfriended redefines \'found footage\' for a new generation of teens.', 'https://image.tmdb.org/t/p/w500//8byPxREr3BqBNyyij5WHVSOVtYk.jpg', 1.19114, 'Horror,Thriller'),
(389, 268920, 'Hot Pursuit', 2015, 'An uptight by-the-book cop must protect the widow of a drug boss from crooked cops and gunmen.', 'https://image.tmdb.org/t/p/w500//lobNOBHuJQCP9ZYAf86MBMwRrmZ.jpg', 1.17883, 'Action,Crime,Comedy'),
(390, 280092, 'Insidious: Chapter 3', 2015, 'A twisted new tale of terror begins for a teenage girl and her family, predating the haunting of the Lambert family in the earlier movies and revealing more mysteries of the otherworldly realm The Further.', 'https://image.tmdb.org/t/p/w500//iDdGfdNvY1EX0uDdA4Ru77fwMfc.jpg', 1.16472, 'Drama,Horror,Thriller'),
(391, 193687, 'Z for Zachariah', 2015, 'In the wake of a nuclear war, a young woman survives on her own, fearing she may actually be the proverbial last woman on earth, until she discovers the most astonishing sight of her life: another human being. A distraught scientist, heâ€™s nearly been driven mad by radiation exposure and his desperate search for others. A fragile, imperative strand of trust connects them. But when a stranger enters the valley, their precarious bond begins to unravel.', 'https://image.tmdb.org/t/p/w500//c7rdpZlviWAcOOx5bnzfqPPPNvq.jpg', 1.16181, 'Drama,Science Fiction,Thriller'),
(392, 300803, 'Dragonheart 3: The Sorcerer\'s Curse', 2015, 'When aspiring knight Gareth goes in search of a fallen comet rumored to contain gold, he is shocked to instead find the dragon Drago. After Drago saves Gareth\'s life the two become intricately bonded, and must work together to defeat an evil sorcerer and stop his reign of terror. Along the way, Gareth learns the true meaning of being a knight in this fantasy action-adventure for the ages.', 'https://image.tmdb.org/t/p/w500//mN6B5ITOFelW7OhR7tGd51VhXmH.jpg', 1.14481, 'Action,Adventure,Fantasy'),
(393, 328589, 'The Lady in the Van', 2015, 'The true story of the relationship between Alan Bennett and the singular Miss Shepherd, a woman of uncertain origins who â€˜temporarilyâ€™ parked her van in Bennettâ€™s London driveway and proceeded to live there for 15 years.', 'https://image.tmdb.org/t/p/w500//sqz4CGInI1bysFH674HYWtQSmYn.jpg', 1.14252, 'Comedy,Drama'),
(394, 228066, 'Victor Frankenstein', 2015, 'Eccentric scientist Victor Von Frankenstein creates a grotesque creature in an unorthodox scientific experiment.', 'https://image.tmdb.org/t/p/w500//iIF0y5Gq0XxRgddaWtVTqqHboWp.jpg', 1.13839, 'Drama,Science Fiction,Thriller'),
(395, 378373, 'Brothers of the Wind', 2015, 'The way of the eagle is to raise two chicks. The stronger is destined always to throw the weaker from the nest. Man also has his ways, often to hurt those closest to him.  Lukas suffers at the hands of a father who has withdrawn since the loss of his wife. Killed whilst rescuing the infant Lukas, the boy now carries the burden of her death.  Our eagleâ€™s story begins in the nest. The first-born chick pushes his weaker brother to a certain death on the forest floor. But fate intervenes and the chick is found by Lukas. Naming him Abel, Lukas cares for the creature in secret, finding a love and companionship denied to him at home. But when the day comes to release Abel back into the wild, will Lukas find his own release into a new life?', 'https://image.tmdb.org/t/p/w500//n7ghzx9azfBho8WNB02jqOlAm5P.jpg', 1.12808, 'Adventure,Drama,Family'),
(396, 291270, 'Anomalisa', 2015, 'A man crippled by the mundanity of his life experiences something out of the ordinary.', 'https://image.tmdb.org/t/p/w500//4DJ1zNr4Y6q7zQ27goEYla46VdO.jpg', 1.12524, 'Animation,Comedy,Drama,Romance'),
(397, 294963, 'Bone Tomahawk', 2015, 'During a shootout in a saloon, Sheriff Hunt injures a suspicious stranger. One of the villagers takes care of him in prison. One day they both disappear â€“ only the spear of a cannibal tribe is found. Hunt and a few of his men go in search of the prisoner and his nurse.', 'https://image.tmdb.org/t/p/w500//4MmTHpn2Y8emqvBgvOjufImUmKZ.jpg', 1.07335, 'Horror,Western,Adventure,Drama'),
(398, 241257, 'Regression', 2015, 'Minnesota, 1990. Detective Bruce Kenner (Ethan Hawke) investigates the case of young Angela (Emma Watson), who accuses her father, John Gray (David Dencik), of an unspeakable crime. When John unexpectedly and without recollection admits guilt, renowned psychologist Dr. Raines (David Thewlis) is brought in to help him relive his memories and what they discover unmasks a horrifying nationwide mystery.', 'https://image.tmdb.org/t/p/w500//luHpMTmU1ygtEgdOTSSj0i9nd8E.jpg', 1.06589, 'Horror,Mystery,Thriller'),
(399, 245698, 'Pawn Sacrifice', 2015, 'American chess champion Bobby Fischer prepares for a legendary match-up against Russian Boris Spassky.', 'https://image.tmdb.org/t/p/w500//lw6oQ70aLS2thMyUn0CPSYiUiau.jpg', 1.06306, 'Drama'),
(400, 353326, 'The Man Who Knew Infinity', 2015, 'Growing up poor in Madras, India, Srinivasa Ramanujan Iyengar earns admittance to Cambridge University during WWI, where he becomes a pioneer in mathematical theories with the guidance of his professor, G.H. Hardy.', 'https://image.tmdb.org/t/p/w500//v2X1BtkxaV8pzLbmM8a5gTdpg7B.jpg', 1.04652, 'Drama'),
(401, 346808, 'Momentum', 2015, 'When Alex, an infiltration expert with a secret past, accidentally reveals her identity during what should have been a routine heist, she quickly finds herself mixed up in a government conspiracy and entangled in a deadly game of cat-and-mouse with a master assassin and his team of killers.  Armed with her own set of lethal skills, Alex looks to exact revenge for her murdered friends while uncovering the truth.', 'https://image.tmdb.org/t/p/w500//rStxrJBaWs3oNQfnQn4LKzG1lQ9.jpg', 1.04192, 'Thriller,Action'),
(402, 250124, 'The Diary of a Teenage Girl', 2015, 'Minnie Goetze is a 15-year-old aspiring comic-book artist, coming of age in the haze of the 1970s in San Francisco. Insatiably curious about the world around her, Minnie is a pretty typical teenage girl. Oh, except that sheâ€™s sleeping with her motherâ€™s boyfriend.', 'https://image.tmdb.org/t/p/w500//5YlUrdYKuscD7pwf3yy9duVLbui.jpg', 1.03839, 'Drama,Romance'),
(403, 290637, 'Pay the Ghost', 2015, 'One year after his young son disappeared during a Halloween carnival, Mike Cole is haunted by eerie images and terrifying messages he canâ€™t explain. Together with his estranged wife, he will stop at nothing to unravel the mystery and find their sonâ€”and, in doing so, he unearths a legend that refuses to remain buried in the past.', 'https://image.tmdb.org/t/p/w500//iHG1QcxaRCiFIdSK1HZA6zOEFsl.jpg', 1.03682, 'Horror,Thriller'),
(404, 244458, 'The Voices', 2015, 'A mentally unhinged factory worker must decide whether to listen to his talking cat and become a killer, or follow his dog\'s advice to keep striving for normalcy.', 'https://image.tmdb.org/t/p/w500//weY5OVSFmxvA3D4lfyhgvugklEh.jpg', 1.02762, 'Horror,Thriller,Comedy,Crime'),
(405, 308504, 'Last Knights', 2015, 'When an evil emperor executes their leader, his band of knights â€“ bound by duty and honour â€“ embarks on a journey of vengeance that will not come to an end until they\'ve destroyed their mortal foe.', 'https://image.tmdb.org/t/p/w500//uGqlk7Hu8FRLVDcFZ16NxTy09ZE.jpg', 1.02144, 'Action,Adventure'),
(406, 314405, 'Il racconto dei racconti', 2015, 'A fantasy film with horror elements, \"The Tale of Tales\" is loosely inspired by the 17th century collection of fairy tales of the same name by Italian writer Giambattista Basile.', 'https://image.tmdb.org/t/p/w500//ryZsoaYmcEJsye6P5uo5thEjpqB.jpg', 1.00847, 'Romance,Fantasy,Horror'),
(407, 282984, 'Irrational Man', 2015, 'On a small town college campus, a philosophy professor in existential crisis gives his life new purpose when he enters into a relationship with his student.', 'https://image.tmdb.org/t/p/w500//ipAqhEWRzEuD6aXlAWIvEEF1KUe.jpg', 1.00705, 'Mystery,Drama'),
(408, 157843, 'Queen of the Desert', 2015, 'A chronicle of Gertrude Bell\'s life, a traveler, writer, archaeologist, explorer, cartographer, and political attachÃ© for the British Empire at the dawn of the twentieth century.', 'https://image.tmdb.org/t/p/w500//9WrxqWttzNiEgKGIm3mDteu6jmq.jpg', 0.973316, 'Drama,History'),
(409, 275601, 'Ricki and the Flash', 2015, 'Meryl Streep stars as Ricki Rendazzo, a guitar heroine who made a world of mistakes as she followed her dreams of rock-and-roll stardom. Returning home, Ricki gets a shot at redemption and a chance to make things right as she faces the music with her family.', 'https://image.tmdb.org/t/p/w500//3sssz04D3lstpdPZXczEs8sOEvT.jpg', 0.956096, 'Comedy,Drama,Music'),
(410, 290762, 'Miss You Already', 2015, 'The friendship between two life-long girlfriends is put to the test when one starts a family and the other falls ill.', 'https://image.tmdb.org/t/p/w500//cvA686C7O8MwXhFIaql4ui6eR0p.jpg', 0.953647, 'Comedy,Drama,Romance'),
(411, 251516, 'Kung Fury', 2015, 'During an unfortunate series of events, a friend of Kung Fury is assassinated by the most dangerous kung fu master criminal of all time, Adolf Hitler, a.k.a Kung FÃ¼hrer.  Kung Fury decides to travel back in time to Nazi Germany in order to kill Hitler and end the Nazi empire once and for all.', 'https://image.tmdb.org/t/p/w500//6Qam8Leycapwik947j6U3vcUbAv.jpg', 0.953046, 'Action,Comedy,Science Fiction,Fantasy'),
(412, 304372, 'The Perfect Guy', 2015, 'Leah Vaughn appears to have the ideal life. She enjoys a challenging, fast-paced career as a lobbyist; Dave, her longterm boyfriend loves her. And yet, at 36, she\'s ready to move to the next phase. Marriage and a family seem a logical and welcome step. Dave is not so sure. A bit commitment phobic, his misgivings lead to a painful break up.  Enter Carter Duncan, a handsome, charming stranger whose path keeps crossing with Leah\'s. Caring and solicitous of Leah and her family and friends, their relationship rapidly progresses. It seems Leah has met the perfect guy. But if it seems too good to be true... Soon Carter\'s protective nature morphs into something more sinister. It\'s clear Leah has to end this new relationship and when she does, her onetime lover becomes her ultimate enemy. It will take every bit of her cunning and resolve to escape and outwit him.', 'https://image.tmdb.org/t/p/w500//k1U3ROFFCVbu9H63lKYMbXEHeJI.jpg', 0.950793, 'Drama,Thriller'),
(413, 324807, 'A Bigger Splash', 2015, 'An American couple, Paul and Marianne, spend their vacation in Italy and experiences trouble when the wife invites a former lover and his teenage daughter to visit, which leads to jealousy and dangerous sexual scenarios.', 'https://image.tmdb.org/t/p/w500//1w2yROhq2Jgaot4hrUHlLcRlK6F.jpg', 0.938432, 'Crime,Drama,Mystery,Thriller'),
(414, 252512, 'While We\'re Young', 2015, 'An uptight documentary filmmaker and his wife find their lives loosened up a bit after befriending a free-spirited younger couple.', 'https://image.tmdb.org/t/p/w500//rdYXGeK3OZjBrd2R8A1sSS0Kxcq.jpg', 0.93762, 'Drama,Comedy'),
(415, 257091, 'Get Hard', 2015, 'When obscenely rich hedge-fund manager James is convicted of fraud and sentenced to a stretch in San Quentin, the judge gives him one month to get his affairs in order. Knowing that he won\'t survive more than a few minutes in prison on his own, James desperately turns to Darnell-- a black businessman who\'s never even had a parking ticket -- for help. As Darnell puts James through the wringer, both learn that they were wrong about many things, including each other.', 'https://image.tmdb.org/t/p/w500//rJPbS2cYOYhDCjT5NmW1Fm6gFl3.jpg', 0.927339, 'Comedy'),
(416, 228968, 'Kidnapping Mr. Heineken', 2015, 'The true story of the kidnapping of Freddy Heineken, the grandson of the founder of the Heineken brewery, and his driver. They were released after a ransom of 35 million Dutch guilders was paid.', 'https://image.tmdb.org/t/p/w500//6JAb9jQa4sONkutfqfR3I7LFpGd.jpg', 0.91704, 'Drama,Action,Crime,Thriller'),
(417, 347969, 'The Ridiculous 6', 2015, 'When his long-lost outlaw father returns, Tommy \"White Knife\" Stockburn goes on an adventure-filled journey across the Old West with his five brothers.', 'https://image.tmdb.org/t/p/w500//kPc80jywR5Nm2KIQjkY5i4VXSx4.jpg', 0.913085, 'Comedy,Western'),
(418, 237756, 'Kill Me Three Times', 2015, 'While on a seemingly routine job, a jaded hit man discovers that he\'s not the only one with his target in the crosshairs.', 'https://image.tmdb.org/t/p/w500//dfsDkaWN8jhoa4przuvP1S3woqm.jpg', 0.90686, 'Comedy,Thriller'),
(419, 293646, 'The 33', 2015, 'Based on a true story about the collapse at the mine in San Jose, Chile that  left 33 miners isolated underground for 69 days.', 'https://image.tmdb.org/t/p/w500//hpXkIuAlIlcNYACRE2MssxnHvZQ.jpg', 0.906036, 'History,Drama'),
(420, 245168, 'Suffragette', 2015, 'Based on true events about the foot soldiers of the early feminist movement who were forced underground to evade the State.', 'https://image.tmdb.org/t/p/w500//vETQNfswR1R7SOIpGuFDv66xfb7.jpg', 0.898296, 'Drama,History'),
(421, 311291, '45 Years', 2015, 'There is just one week until Kate Mercer\'s 45th wedding anniversary and the planning for the party is going well. But then a letter arrives for her husband. The body of his first love has been discovered, frozen and preserved in the icy glaciers of the Swiss Alps. By the time the party is upon them, five days later, there may not be a marriage left to celebrate.', 'https://image.tmdb.org/t/p/w500//8elIJYYXWq2HpcZ6TgVMC9EwTnn.jpg', 0.894477, 'Drama'),
(422, 301351, 'We Are Your Friends', 2015, 'Young Cole Carter dreams of hitting the big time as a Hollywood disc jockey, spending his days and nights hanging with buddies and working on the one track that will set the world on fire. Opportunity comes knocking when he meets James Reed, a charismatic DJ who takes the 23-year-old under his wing. Soon, his seemingly clear path to success gets complicated when he starts falling for his mentor\'s girlfriend, jeopardizing his new friendship and the future he seems destined to fulfill.', 'https://image.tmdb.org/t/p/w500//k8SfiPoh3zUkDpHOT22ATegS2FU.jpg', 0.880938, 'Drama,Music,Romance'),
(423, 248574, 'Barely Lethal', 2015, 'A 16-year-old international assassin yearning for a \"normal\" adolescence fakes her own death and enrolls as a senior in a suburban high school. She quickly learns that being popular can be more painful than getting water-boarded.', 'https://image.tmdb.org/t/p/w500//8emz9dKW8KKIqG8WcFG1lJbr2ub.jpg', 0.880268, 'Adventure,Action,Comedy'),
(424, 225728, 'Macbeth', 2015, 'Feature film adaptation of Shakespeare\'s Scottish play about General Macbeth whose ambitious wife urges him to use wicked means in order to gain power of the throne over the sitting king, Duncan.', 'https://image.tmdb.org/t/p/w500//a5NEpil29Uns1wEYF8k99qVgj1T.jpg', 0.874641, 'History,Drama,War'),
(425, 326425, 'Extraction', 2015, 'A former CIA operative is kidnapped by a group of terrorists. When his son learns there is no plan for his father to be saved, he launches his own rescue operation.', 'https://image.tmdb.org/t/p/w500//96FQG1MyR9mJFcvPBZAdfsVqaMO.jpg', 0.872149, 'Action,Thriller'),
(426, 342474, 'Jenny\'s Wedding', 2015, 'Jenny Farrell is getting married. But how will her straight-laced family react when they find out that the woman they thought was their daughterâ€™s roommate is actually her fiancÃ©e? As the old-fashioned Farrells attempt to come to terms with the prospect of a surprise daughter-in-law, they face a difficult choice: either adapt with the times or risk being left behind.', 'https://image.tmdb.org/t/p/w500//lAMXZ8BVCCfyfhCSsvQRLG6cwxK.jpg', 0.861179, 'Comedy,Drama'),
(427, 277217, 'Descendants', 2015, 'A present-day idyllic kingdom where the benevolent teenage son of King Adam and Queen Belle offers a chance of redemption for the troublemaking offspring of Disney\'s classic villains: Cruella De Vil (Carlos), Maleficent (Mal), the Evil Queen (Evvie) and Jafar (Jay).', 'https://image.tmdb.org/t/p/w500//65DkgHPSLVjgr6IYkpY9Aqqqid5.jpg', 0.848748, 'Music,Action,Adventure,Comedy,Family'),
(428, 207936, 'Tumbledown', 2015, 'A young woman struggles to move on with her life after the death of her husband, an acclaimed folk singer, when a brash New York writer forces her to confront her loss and the ambiguous circumstances of his death.', 'https://image.tmdb.org/t/p/w500//6Dg1MqdqAaoia58KaXSNETn3Qya.jpg', 0.843174, 'Music,Romance,Comedy'),
(429, 250734, 'Far from the Madding Crowd', 2015, 'A beautiful young woman maintains relationships with three very different men.', 'https://image.tmdb.org/t/p/w500//cr4cctBPv9qHDtjDps4wi0kqI7h.jpg', 0.842202, 'Romance,Drama'),
(430, 249688, 'The End of the Tour', 2015, 'The story of the five-day interview between Rolling Stone reporter David Lipsky and acclaimed novelist David Foster Wallace, which took place right after the 1996 publication of Wallace\'s groundbreaking epic novel, \'Infinite Jest.\'', 'https://image.tmdb.org/t/p/w500//1pt7dX0oaFxgPT02OiHZK3O0gbg.jpg', 0.836941, 'Drama'),
(431, 268238, 'The Second Best Exotic Marigold Hotel', 2015, 'As the Best Exotic Marigold Hotel has only a single remaining vacancy - posing a rooming predicament for two fresh arrivals - Sonny pursues his expansionist dream of opening a second hotel.', 'https://image.tmdb.org/t/p/w500//j4PARl3gDpv2K45YAv0tgocLW5K.jpg', 0.832487, 'Drama,Comedy'),
(432, 256962, 'Little Boy', 2015, 'An eight-year-old boy is willing to do whatever it takes to end World War II so he can bring his father home. The story reveals the indescribable love a father has for his little boy and the love a son has for his father.', 'https://image.tmdb.org/t/p/w500//lAU9pgq3niI6sFemcKm4FGGmrnW.jpg', 0.829111, 'Comedy,Drama,War'),
(433, 322456, 'LEGO DC Comics Super Heroes: Justice League vs. Bizarro League', 2015, 'Supermanâ€™s clone, Bizarro, has become an embarrassing problem. Chaos and destruction follow Bizarro everywhere as he always hears the opposite of what is said, says the opposite of what he means and does the opposite of what is right. And when the citizens of Metropolis keep confusing Bizarro with Superman, the Man of Steel decides itâ€™s time to find a new home for himâ€¦on another planet! Itâ€™s up to the Justice League to come to terms with their backward counterparts and team up with them to stop Darkseid and save the galaxy!', 'https://image.tmdb.org/t/p/w500//vgc2Qxd4f7On51sjzimLmbfO4Cf.jpg', 0.821443, 'Action,Adventure,Animation,Family'),
(434, 302528, 'Remember', 2015, 'With the aid of a fellow Auschwitz survivor and a hand-written letter, an elderly man with dementia goes in search of the person responsible for the death of his family.', 'https://image.tmdb.org/t/p/w500//x496Ip0weJYfsEX23eNyzG4MjXV.jpg', 0.820691, 'Drama,Thriller'),
(435, 222936, 'Aloha', 2015, 'A celebrated military contractor returns to the site of his greatest career triumphs and re-connects with a long-ago love while unexpectedly falling for the hard-charging Air Force watchdog assigned to him.', 'https://image.tmdb.org/t/p/w500//58Y4CjcRX8AtMNtI0AXu9H7iebP.jpg', 0.814206, 'Adventure,Comedy,Romance'),
(436, 316002, 'Accidental Love', 2015, 'A small town waitress gets a nail accidentally lodged in her head causing unpredictable behavior that leads her to Washington, DC.  Sparks fly when she meets a clueless young senator who takes up her cause - but what happens when love interferes with what you stand for?', 'https://image.tmdb.org/t/p/w500//znPsDmQVKW0BuBnaErIAPo49X3i.jpg', 0.813893, 'Romance,Comedy'),
(437, 365806, 'Halo: The Fall of Reach', 2015, 'Relive the origin of the legendary Master Chief and the Spartan program in this three-part animated adaptation of one of Halo\'s most beloved stories. Kidnapped as children and conscripted into a brutal military training and augmentation program, the Spartans were designed to be the ultimate weapon against chaos and insurgency - but when a dangerous alien alliance known as the Covenant declares war on humanity, the Spartans might be our only hope.', 'UNDEFINED', 0.810667, 'Action,Animation,Science Fiction'),
(438, 10317, 'Our Brand Is Crisis', 2015, 'A feature film based on the documentary \"Our Brand Is Crisis\", which focuses on the use of American political campaign strategies in South America.', 'https://image.tmdb.org/t/p/w500//oKZtQpdIKi3TPV4UqVuvkbRkokv.jpg', 0.795762, 'Drama,Comedy'),
(439, 334538, 'Into the Forest', 2015, 'In the not too distant future, two young women who live in a remote ancient forest discover the world around them is on the brink of an apocalypse. Informed only by rumor, they fight intruders, disease, loneliness &amp; starvation.', 'https://image.tmdb.org/t/p/w500//3xBUU6pYZPe9tqVH2R430y6psEm.jpg', 0.792471, 'Drama,Science Fiction'),
(440, 306947, 'The Invitation', 2015, 'Will and his new girlfriend Kira are invited to a dinner with old friends at the house of Willâ€™s ex Eden and her new partner David. Although the evening appears to be relaxed, Will soon gets a creeping suspicion that their charming host David is up to something.', 'https://image.tmdb.org/t/p/w500//4gxZW8AHg9kIOh5BgaSrq5gO1KB.jpg', 0.787969, 'Thriller'),
(441, 328901, 'The Benefactor', 2015, 'A newly married couple are forced to navigate the all-consuming interest of a powerful, mysterious, and possessive philanthropist.', 'https://image.tmdb.org/t/p/w500//rvUazZEuj1UBK58TIxXEsla2Phy.jpg', 0.781809, 'Drama'),
(442, 382517, 'Open Season: Scared Silly', 2015, 'The humans and animals believe a werewolf is on the loose, and former hunter Shaw uses the opportunity to re-open the season. Boog, Elliot, and Mr. Weenie have to face their fears and find the werewolf to get the season closed permanently.', 'https://image.tmdb.org/t/p/w500//tFD3HdVIXVbvVixIGhNmJBaqyAI.jpg', 0.773909, 'Animation,Comedy,Family,Adventure'),
(443, 310133, 'Cop Car', 2015, 'Two kids find themselves in the centre of a deadly game of cat and mouse after taking a sheriff\'s cruiser for a joy ride.', 'https://image.tmdb.org/t/p/w500//o1JBr2htdBNyEKeIwGGr8Bwh1Bn.jpg', 0.77107, 'Thriller'),
(444, 237584, 'Mojave', 2015, 'A suicidal artist goes into the desert, where he finds his doppelgÃ¤nger, a homicidal drifter.', 'https://image.tmdb.org/t/p/w500//eZLpBNG84wAI5c9XCQBa7w78ElX.jpg', 0.768138, 'Thriller'),
(445, 288036, 'Sleeping with Other People', 2015, 'Can two serial cheaters get a second chance at love? After a one-night stand in college, New Yorkers Lainey and Jake meet by chance twelve years later and discover they each have the same problem: because of their monogamy-challenged ways, neither can maintain a relationship. Determined to stay friends despite their mutual attraction, they make a pact to keep it platonic, a deal that proves easier said than done.', 'https://image.tmdb.org/t/p/w500//thYomS3wTYDTRZaM98ADMfBiDxm.jpg', 0.758133, 'Comedy'),
(446, 354110, 'Forsaken', 2015, 'John Henry returns to his hometown in hopes of repairing his relationship with his estranged father, but a local gang is terrorizing the town. John Henry is the only one who can stop them, however he has abandoned both his gun and reputation as a fearless quick-draw killer.', 'https://image.tmdb.org/t/p/w500//fbTpSiqGn6ImqSAyawHlLf7goat.jpg', 0.747541, 'Western,Drama'),
(447, 331781, 'Amy', 2015, 'A documentary on the life of Amy Winehouse, the immensely talented yet doomed songstress. We see her from her teen years, where she already showed her singing abilities, to her finding success and then her downward spiral into alcoholism and drugs.', 'https://image.tmdb.org/t/p/w500//qL0RepWSNUuZoeDXfyhqowVYhrn.jpg', 0.738404, 'Documentary,Music'),
(448, 253161, 'Madame Bovary', 2015, 'The classic story of Emma Bovary, the beautiful wife of a small-town doctor in 19th century France, who engages in extra marital affairs in an attempt to advance her social status.', 'https://image.tmdb.org/t/p/w500//jW0CRLVYOQm0HOh6fZXnW2JKxwF.jpg', 0.7299, 'Drama'),
(449, 312831, 'The Hallow', 2015, 'A family who moved into a remote mill house in Ireland finds themselves in a fight for survival with demonic creatures living in the woods.', 'https://image.tmdb.org/t/p/w500//sOT4KqFPlvxTeEwyHOcn8agJnsI.jpg', 0.719407, 'Fantasy,Horror'),
(450, 316322, 'Barbie in Princess Power', 2015, 'Barbie is Kara - a modern-day princess with a normal life. Kissed by a butterfly which gives her superpowers and allows her to become a Super Sparkle, she is ready to save the kingdom from evil - were it not for her jealous cousin who is also kissed by the butterfly and becomes her rival and nemesis. Watch as Super Sparkle and Dark Sparkle learn that together they can become a great team for good once they learn the power of friendship.', 'https://image.tmdb.org/t/p/w500//nCviAdChxibrKRZfvG7MZ2wsqdR.jpg', 0.714131, 'Family,Animation'),
(451, 301846, 'Howl', 2015, 'When passengers on a train are attacked by a creature, they must band together in order to survive until morning.', 'https://image.tmdb.org/t/p/w500//XcwP3VGTRVHjc4doNP8w1fdOJ7.jpg', 0.707355, 'Horror');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_production` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_production`, `id_movie`) VALUES
(10, 252),
(11, 252),
(12, 252),
(13, 252),
(14, 252),
(15, 253),
(16, 253),
(17, 254),
(18, 254),
(19, 254),
(20, 254),
(21, 255),
(22, 255),
(23, 255),
(24, 256),
(25, 256),
(26, 256),
(14, 256),
(27, 256),
(28, 257),
(29, 257),
(30, 257),
(31, 257),
(32, 257),
(33, 258),
(34, 258),
(35, 259),
(36, 259),
(37, 259),
(38, 259),
(39, 259),
(24, 260),
(40, 260),
(41, 261),
(42, 261),
(43, 261),
(44, 262),
(45, 262),
(46, 262),
(15, 263),
(47, 263),
(48, 263),
(49, 263),
(50, 264),
(51, 264),
(52, 264),
(44, 265),
(53, 265),
(54, 266),
(55, 266),
(56, 266),
(57, 267),
(58, 267),
(59, 267),
(35, 268),
(60, 268),
(61, 268),
(62, 268),
(63, 268),
(54, 269),
(41, 270),
(64, 270),
(65, 270),
(66, 270),
(67, 271),
(68, 271),
(69, 271),
(43, 271),
(70, 271),
(41, 272),
(71, 272),
(72, 272),
(73, 273),
(74, 273),
(75, 274),
(15, 274),
(49, 274),
(76, 274),
(77, 275),
(78, 275),
(79, 275),
(33, 276),
(80, 276),
(28, 276),
(33, 277),
(34, 277),
(81, 277),
(23, 277),
(82, 277),
(24, 278),
(26, 278),
(83, 278),
(35, 279),
(84, 279),
(39, 279),
(85, 279),
(86, 280),
(87, 280),
(31, 280),
(88, 280),
(89, 280),
(90, 281),
(91, 281),
(39, 281),
(92, 282),
(93, 282),
(94, 282),
(95, 282),
(96, 282),
(44, 283),
(26, 283),
(97, 283),
(98, 283),
(64, 283),
(24, 284),
(99, 284),
(100, 284),
(101, 285),
(11, 285),
(67, 285),
(102, 285),
(103, 285),
(44, 286),
(25, 286),
(104, 286),
(105, 287),
(106, 287),
(107, 287),
(108, 287),
(109, 288),
(94, 288),
(76, 288),
(41, 289),
(42, 289),
(110, 289),
(111, 290),
(112, 290),
(113, 290),
(114, 291),
(115, 291),
(116, 291),
(117, 291),
(75, 292),
(24, 292),
(12, 292),
(118, 292),
(119, 292),
(17, 293),
(120, 293),
(27, 293),
(121, 293),
(20, 293),
(24, 294),
(122, 294),
(12, 294),
(123, 294),
(124, 294),
(125, 295),
(49, 295),
(126, 295),
(113, 295),
(127, 296),
(128, 296),
(129, 296),
(130, 297),
(131, 297),
(35, 298),
(132, 298),
(102, 299),
(133, 300),
(69, 300),
(134, 300),
(135, 300),
(136, 300),
(137, 301),
(138, 301),
(139, 301),
(105, 301),
(140, 301),
(141, 302),
(52, 302),
(142, 302),
(143, 303),
(49, 303),
(24, 304),
(144, 304),
(145, 304),
(146, 304),
(147, 304),
(102, 305),
(125, 305),
(148, 305),
(39, 305),
(67, 306),
(149, 306),
(150, 306),
(151, 306),
(57, 307),
(152, 307),
(153, 307),
(154, 308),
(155, 308),
(69, 309),
(156, 309),
(157, 309),
(158, 309),
(159, 310),
(144, 310),
(160, 310),
(161, 310),
(162, 310),
(24, 311),
(163, 311),
(12, 311),
(69, 312),
(164, 312),
(165, 312),
(35, 313),
(84, 313),
(166, 313),
(167, 313),
(168, 313),
(169, 314),
(170, 314),
(171, 314),
(172, 314),
(173, 314),
(35, 315),
(174, 315),
(175, 315),
(176, 316),
(113, 316),
(177, 316),
(35, 317),
(178, 317),
(179, 317),
(39, 317),
(180, 318),
(181, 318),
(49, 318),
(182, 318),
(183, 318),
(184, 319),
(185, 319),
(186, 319),
(187, 319),
(75, 320),
(49, 320),
(188, 320),
(189, 320),
(24, 321),
(13, 321),
(14, 321),
(190, 321),
(191, 322),
(192, 322),
(193, 322),
(144, 323),
(146, 323),
(194, 323),
(195, 324),
(49, 325),
(168, 325),
(196, 325),
(113, 325),
(197, 326),
(198, 327),
(199, 328),
(200, 328),
(175, 328),
(15, 329),
(36, 329),
(201, 329),
(202, 329),
(203, 329),
(204, 330),
(205, 330),
(206, 330),
(207, 331),
(208, 331),
(209, 331),
(210, 331),
(211, 331),
(102, 332),
(91, 332),
(44, 333),
(212, 333),
(180, 334),
(213, 334),
(214, 334),
(215, 335),
(216, 335),
(217, 335),
(91, 336),
(218, 336),
(219, 336),
(220, 336),
(221, 336),
(75, 337),
(222, 337),
(223, 337),
(224, 338),
(111, 338),
(188, 338),
(39, 338),
(69, 339),
(225, 339),
(226, 339),
(227, 339),
(228, 339),
(36, 340),
(179, 340),
(229, 340),
(230, 340),
(17, 341),
(36, 341),
(231, 341),
(232, 342),
(233, 342),
(234, 342),
(235, 342),
(33, 343),
(236, 343),
(206, 343),
(237, 343),
(197, 344),
(238, 344),
(239, 344),
(225, 345),
(240, 345),
(241, 345),
(242, 345),
(243, 346),
(244, 346),
(245, 346),
(246, 346),
(247, 346),
(28, 347),
(102, 347),
(248, 347),
(249, 347),
(39, 347),
(250, 348),
(251, 348),
(252, 348),
(253, 349),
(214, 349),
(254, 349),
(255, 350),
(232, 350),
(256, 350),
(257, 350),
(191, 350),
(44, 351),
(53, 351),
(258, 351),
(259, 351),
(97, 351),
(41, 352),
(260, 352),
(261, 353),
(262, 353),
(263, 353),
(264, 353),
(265, 353),
(24, 354),
(266, 354),
(232, 354),
(267, 354),
(92, 355),
(268, 355),
(269, 355),
(270, 355),
(271, 355),
(49, 356),
(272, 356),
(273, 357),
(274, 357),
(201, 357),
(33, 358),
(275, 358),
(276, 358),
(277, 358),
(232, 359),
(278, 359),
(279, 360),
(280, 360),
(146, 360),
(147, 360),
(113, 360),
(241, 361),
(281, 361),
(282, 361),
(283, 361),
(24, 362),
(12, 362),
(284, 363),
(285, 363),
(286, 363),
(287, 363),
(288, 363),
(289, 364),
(290, 364),
(291, 364),
(292, 365),
(293, 365),
(294, 365),
(295, 366),
(296, 366),
(94, 366),
(297, 366),
(298, 366),
(92, 367),
(299, 367),
(24, 368),
(300, 369),
(33, 370),
(301, 370),
(302, 370),
(303, 370),
(304, 371),
(305, 371),
(306, 371),
(62, 372),
(12, 373),
(307, 374),
(308, 374),
(31, 374),
(309, 374),
(49, 375),
(310, 375),
(33, 376),
(232, 376),
(311, 377),
(52, 377),
(312, 377),
(313, 377),
(213, 378),
(314, 378),
(315, 378),
(261, 379),
(316, 379),
(256, 379),
(317, 379),
(170, 380),
(33, 381),
(318, 381),
(319, 381),
(320, 381),
(321, 381),
(80, 382),
(28, 382),
(32, 382),
(248, 383),
(49, 383),
(188, 383),
(322, 384),
(323, 384),
(194, 384),
(324, 385),
(325, 385),
(326, 385),
(327, 386),
(328, 386),
(329, 386),
(68, 387),
(330, 387),
(331, 387),
(61, 387),
(332, 387),
(130, 388),
(232, 388),
(75, 389),
(49, 389),
(188, 389),
(333, 389),
(204, 390),
(334, 391),
(335, 391),
(226, 391),
(336, 391),
(337, 391),
(338, 392),
(92, 393),
(339, 393),
(35, 394),
(125, 394),
(168, 394),
(39, 394),
(340, 395),
(341, 396),
(342, 397),
(343, 397),
(344, 397),
(58, 398),
(345, 398),
(346, 398),
(347, 398),
(94, 398),
(336, 399),
(348, 399),
(349, 399),
(350, 399),
(351, 400),
(352, 400),
(353, 400),
(354, 400),
(355, 400),
(356, 401),
(357, 401),
(358, 402),
(359, 402),
(95, 402),
(360, 403),
(361, 403),
(67, 404),
(285, 404),
(362, 404),
(363, 405),
(364, 405),
(262, 406),
(365, 406),
(366, 406),
(367, 406),
(264, 406),
(204, 407),
(368, 407),
(369, 408),
(370, 408),
(371, 408),
(372, 409),
(373, 409),
(201, 409),
(374, 410),
(375, 410),
(376, 411),
(274, 412),
(68, 413),
(377, 413),
(378, 413),
(379, 413),
(380, 413),
(122, 414),
(107, 414),
(236, 415),
(49, 415),
(381, 416),
(382, 416),
(383, 416),
(53, 417),
(384, 418),
(385, 418),
(386, 418),
(387, 418),
(149, 419),
(388, 419),
(389, 419),
(390, 419),
(391, 420),
(392, 420),
(52, 420),
(393, 421),
(144, 422),
(107, 423),
(323, 424),
(93, 424),
(394, 424),
(52, 424),
(194, 424),
(241, 425),
(395, 425),
(242, 425),
(396, 425),
(397, 426),
(398, 426),
(349, 426),
(399, 427),
(400, 428),
(401, 428),
(402, 428),
(403, 429),
(50, 429),
(92, 429),
(107, 430),
(86, 431),
(404, 431),
(405, 431),
(406, 432),
(407, 433),
(408, 434),
(409, 434),
(44, 435),
(410, 435),
(28, 435),
(97, 435),
(411, 435),
(183, 436),
(412, 437),
(413, 437),
(86, 438),
(414, 438),
(415, 439),
(401, 439),
(416, 440),
(417, 441),
(212, 442),
(418, 443),
(419, 443),
(420, 443),
(421, 443),
(422, 444),
(423, 444),
(424, 444),
(348, 444),
(128, 445),
(236, 445),
(256, 445),
(425, 446),
(426, 446),
(427, 446),
(428, 447),
(429, 447),
(430, 448),
(431, 448),
(432, 448),
(433, 449),
(434, 449),
(435, 449),
(436, 449),
(437, 449),
(438, 450),
(439, 451);

-- --------------------------------------------------------

--
-- Table structure for table `production`
--

CREATE TABLE `production` (
  `uid` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production`
--

INSERT INTO `production` (`uid`, `name`) VALUES
(10, 'Universal Studios'),
(11, 'Amblin Entertainment'),
(12, 'Legendary Pictures'),
(13, 'Fuji Television Network'),
(14, 'Dentsu'),
(15, 'Village Roadshow Pictures'),
(16, 'Kennedy Miller Productions'),
(17, 'Summit Entertainment'),
(18, 'Mandeville Films'),
(19, 'Red Wagon Entertainment'),
(20, 'NeoReel'),
(21, 'Lucasfilm'),
(22, 'Truenorth Productions'),
(23, 'Bad Robot'),
(24, 'Universal Pictures'),
(25, 'Original Film'),
(26, 'Media Rights Capital'),
(27, 'One Race Films'),
(28, 'Regency Enterprises'),
(29, 'Appian Way'),
(30, 'CatchPlay'),
(31, 'Anonymous Content'),
(32, 'New Regency Pictures'),
(33, 'Paramount Pictures'),
(34, 'Skydance Productions'),
(35, 'Twentieth Century Fox Film Corporation'),
(36, 'Scott Free Productions'),
(37, 'Mid Atlantic Films'),
(38, 'International Traders'),
(39, 'TSG Entertainment'),
(40, 'Illumination Entertainment'),
(41, 'Walt Disney Pictures'),
(42, 'Pixar Animation Studios'),
(43, 'Walt Disney Studios Motion Pictures'),
(44, 'Columbia Pictures'),
(45, 'Danjaq'),
(46, 'B24'),
(47, 'Dune Entertainment'),
(48, 'Anarchos Productions'),
(49, 'Warner Bros.'),
(50, 'DNA Films'),
(51, 'Universal Pictures International (UPI)'),
(52, 'Film4'),
(53, 'Happy Madison Productions'),
(54, 'Marvel Studios'),
(55, 'Prime Focus'),
(56, 'Revolution Sun Studios'),
(57, 'Double Feature Films'),
(58, 'The Weinstein Company'),
(59, 'FilmColony'),
(60, 'M6 Films'),
(61, 'Canal+'),
(62, 'EuropaCorp'),
(63, 'CinÃ©+'),
(64, 'Genre Films'),
(65, 'Beagle Pug Films'),
(66, 'Allison Shearmur Productions'),
(67, 'Studio Babelsberg'),
(68, 'StudioCanal'),
(69, 'Lionsgate'),
(70, 'Color Force'),
(71, 'Babieka'),
(72, 'A113'),
(73, 'Escape Artists'),
(74, 'Riche-Ludwig Productions'),
(75, 'New Line Cinema'),
(76, 'Flynn Picture Company'),
(77, 'Focus Features'),
(78, 'Trigger Street Productions'),
(79, 'Michael De Luca Productions'),
(80, 'Plan B Entertainment'),
(81, 'China Movie Channel'),
(82, 'TC Productions'),
(83, 'Fuzzy Door Productions'),
(84, 'Marv Films'),
(85, 'Cloudy Productions'),
(86, 'Participant Media'),
(87, 'Open Road Films'),
(88, 'Rocklin / Faust'),
(89, 'Entertainment One Features'),
(90, 'Gotham Group'),
(91, 'Temple Hill Entertainment'),
(92, 'BBC Films'),
(93, 'See-Saw Films'),
(94, 'FilmNation Entertainment'),
(95, 'Archer Gray'),
(96, 'AI-Film'),
(97, 'Sony Pictures Entertainment (SPE)'),
(98, 'Alpha Core'),
(99, 'Gold Circle Films'),
(100, 'Brownstone Productions'),
(101, 'DreamWorks SKG'),
(102, 'Fox 2000 Pictures'),
(103, 'Marc Platt Productions'),
(104, 'Scholastic Entertainment'),
(105, 'Element Pictures'),
(106, 'No Trace Camping'),
(107, 'A24'),
(108, 'Duperele Films'),
(109, 'Eden Rock Media'),
(110, 'Buena Vista'),
(111, 'Vertigo Entertainment'),
(112, 'Energy Entertainment'),
(113, 'RatPac-Dune Entertainment'),
(114, 'Wildgaze Films'),
(115, 'Irish Film Board'),
(116, 'Item 7'),
(117, 'Parallel Film Productions'),
(118, 'Cube Vision'),
(119, 'Broken Chair Flickz'),
(120, 'Atmosphere Entertainment MM'),
(121, 'Goldmann Pictures'),
(122, 'Scott Rudin Productions'),
(123, 'The Mark Gordon Company'),
(124, 'Management 360'),
(125, 'Davis Entertainment'),
(126, 'Wigram Productions'),
(127, 'Lakeshore Entertainment'),
(128, 'Sidney Kimmel Entertainment'),
(129, 'Sierra/Affinity'),
(130, 'Bazelevs Production'),
(131, 'Versus Pictures'),
(132, 'DreamWorks Animation'),
(133, 'Current Entertainment'),
(134, 'Sierra / Affinity'),
(135, 'SJ Heat Productions'),
(136, 'Silver State Production Services'),
(137, 'Haut et Court'),
(138, 'Eurimages'),
(139, 'Lemming Film'),
(140, 'Nederlands Fonds voor de Film'),
(141, 'Killer Films'),
(142, 'Number 9 Films'),
(143, 'Waverly Films'),
(144, 'Working Title Films'),
(145, 'Walden Media'),
(146, 'Cross Creek Pictures'),
(147, 'Free State Pictures'),
(148, 'Annapurna Pictures'),
(149, 'Alcon Entertainment'),
(150, 'DMG Entertainment'),
(151, 'Ehman Productions'),
(152, 'PeaPie Films'),
(153, '3 Arts Entertainment'),
(154, 'Endgame Entertainment'),
(155, 'Ram Bergman Productions'),
(156, 'Mad Chance'),
(157, 'OddLot Entertainment'),
(158, 'Huayi Brothers Media'),
(159, 'Pretty Pictures'),
(160, 'ArtÃ©mis Productions'),
(161, 'Le Tax Shelter du Gouvernement FÃ©dÃ©ral de Belgique'),
(162, 'Taxshelter. be'),
(163, 'Forward Pass'),
(164, 'Thunder Road Pictures'),
(165, 'Black Label Media'),
(166, 'Marvel Entertainment'),
(167, 'Constantin Film.'),
(168, 'Moving Picture Company (MPC)'),
(169, 'Parts and Labor'),
(170, 'RT Features'),
(171, 'Rooks Nest Entertainment'),
(172, 'Maiden Voyage Pictures'),
(173, 'Pulse Films'),
(174, 'Chernin Entertainment'),
(175, 'Feigco Entertainment'),
(176, 'Kramer & Sigman Films'),
(177, 'Zaftig Films'),
(178, 'Fox International Productions'),
(179, 'Infinite Frameworks Studios'),
(180, 'Imagine Entertainment'),
(181, 'Spring Creek Productions'),
(182, 'Roth Films'),
(183, 'K. JAM Media'),
(184, 'Nu Image Films'),
(185, 'Winkler Films'),
(186, 'Millennium Films'),
(187, 'Survivor Productions'),
(188, 'Metro-Goldwyn-Mayer (MGM)'),
(189, 'Chartoff-Winkler Productions'),
(190, 'Apatow Productions'),
(191, 'Entertainment One'),
(192, 'Moonlighting Films'),
(193, 'Raindog Films'),
(194, 'Anton Capital Entertainment (ACE)'),
(195, 'Furthur Films'),
(196, 'Berlanti Productions'),
(197, 'Arrowstorm Entertainment'),
(198, 'Indian Paintbrush'),
(199, 'Blue Sky Studios'),
(200, 'Twentieth Century Fox Animation'),
(201, 'LStar Capital'),
(202, 'The Cantillon Company'),
(203, 'The Shuman Company'),
(204, 'Sony Pictures'),
(205, 'Point Grey Pictures'),
(206, 'Good Universe'),
(207, 'Universum Film (UFA)'),
(208, 'Dragonfly Entertainment'),
(209, 'Black Bear Pictures'),
(210, 'Square One Entertainment'),
(211, 'Sobras International Pictures'),
(212, 'Sony Pictures Animation'),
(213, 'Groundswell Productions'),
(214, 'CBS Films'),
(215, 'TriStar Pictures'),
(216, 'Sony Pictures Entertainment'),
(217, 'ImageMovers'),
(218, 'Senator Film'),
(219, 'Freerunning'),
(220, 'Melbarken'),
(221, 'Saban Films'),
(222, 'BenderSpink'),
(223, 'David Dobkin Productions'),
(224, 'Ghost House Pictures'),
(225, 'Grindstone Entertainment Group'),
(226, 'Silver Reel'),
(227, 'Sly Predator'),
(228, 'Matt Baer Films'),
(229, 'Freedom Media'),
(230, 'Route One Entertainment'),
(231, 'Worldview Entertainment'),
(232, 'Blumhouse Productions'),
(233, 'Blue-Tongue Films'),
(234, 'STX Entertainment'),
(235, 'Ahimsa Films'),
(236, 'Gary Sanchez Productions'),
(237, 'Red Granite Pictures'),
(238, 'Camera 40 Productions'),
(239, 'Bellpond Films'),
(240, 'K5 International'),
(241, 'Emmett/Furla Films'),
(242, 'Aperture Entertainment'),
(243, 'Onyx Films'),
(244, 'Orange Studios'),
(245, 'CityMation'),
(246, 'On Entertainment'),
(247, 'Zippcast Films'),
(248, 'Sunswept Entertainment'),
(249, 'Bagdasarian Productions'),
(250, 'Amazon Studios'),
(251, 'Film Art Media'),
(252, 'Apollo Media'),
(253, 'Wonderland Sound and Vision'),
(254, 'Vast Entertainment'),
(255, 'Alliance Films'),
(256, 'IM Global'),
(257, 'Automatik Entertainment'),
(258, 'Sony Pictures Releasing'),
(259, 'Sony Pictures Home Entertainment'),
(260, 'Walt Disney Animation Studios'),
(261, 'Ingenious Media'),
(262, 'HanWay Films'),
(263, 'Scope Pictures'),
(264, 'Recorded Picture Company (RPC)'),
(265, 'Northern Ireland Screen'),
(266, 'Nuyorican Productions'),
(267, 'Smart Entertainment'),
(268, 'Isle of Man Film'),
(269, 'Shine Pictures'),
(270, 'Kudos Film and Television'),
(271, 'Pinewood Pictures'),
(272, 'Closest to the Hole Productions'),
(273, 'Miramax Films'),
(274, 'Screen Gems'),
(275, 'Oops Doughnuts Productions'),
(276, 'Broken Road Productions'),
(277, 'Brucks Entertainment'),
(278, 'Blinding Edge Pictures'),
(279, 'Infinitum Nihil'),
(280, 'Head Gear Films'),
(281, 'Silver Plane Films'),
(282, 'Mass Hysteria Entertainment'),
(283, 'Tri Vision Pictures'),
(284, 'Denver and Delilah Productions'),
(285, 'Mandalay Vision'),
(286, 'Exclusive Media Group'),
(287, 'Hugo Productions'),
(288, 'Cuatro Plus Films'),
(289, 'Bold Films'),
(290, 'Living Films'),
(291, 'Brothers Dowdle Productions'),
(292, 'Forest Whitaker\'s Significant Productions'),
(293, 'Revolt Films'),
(294, 'IamOTHER Entertainment'),
(295, 'Concorde Filmverleih'),
(296, 'Likely Story'),
(297, 'Circle of Confusion'),
(298, 'The Bridge Finance Company'),
(299, 'Origin Pictures'),
(300, 'Little Stranger'),
(301, 'MTV Films'),
(302, 'Platinum Dunes'),
(303, 'Insurge Pictures'),
(304, 'Premiere Picture'),
(305, 'Bill and Ben Productions'),
(306, 'GFM films'),
(307, 'Crime Scene Pictures'),
(308, 'Radius-TWC'),
(309, 'Vega, Baby!'),
(310, 'Iron Horse Entertainment (II)'),
(311, 'The New Zealand Film Commission'),
(312, 'See Saw Films'),
(313, 'DMC Films'),
(314, 'Inimitable Pictures'),
(315, 'ShivHans Pictures'),
(316, 'Gran Via Productions'),
(317, 'Route One Films'),
(318, 'Nickelodeon Movies'),
(319, 'Nickelodeon Animation Studios'),
(320, 'United Plankton Pictures'),
(321, 'Disruption Entertainment'),
(322, 'Aardman Animations'),
(323, 'Studio Canal'),
(324, 'Motlys'),
(325, 'Arte France CinÃ©ma'),
(326, 'Animal Kingdom'),
(327, 'Reposado Producciones'),
(328, 'TelevisiÃ³n EspaÃ±ola (TVE)'),
(329, 'Mediapro'),
(330, 'Silver Pictures'),
(331, 'TF1 Films Production'),
(332, 'Instituto de la CinematografÃ­a y de las Artes Audiovisuales (ICAA)'),
(333, 'Pacific Standard'),
(334, 'Palomar Pictures'),
(335, 'Lucky Hat Entertainment'),
(336, 'Material Pictures'),
(337, 'Zik Zak Kvikmyndir'),
(338, 'Raffaella Productions'),
(339, 'TriStar Productions'),
(340, 'Terra Mater Factual Studios'),
(341, 'Starburns Industries'),
(342, 'Caliber Media Company'),
(343, 'The Fyzz Facility'),
(344, 'Realbuilder Productions'),
(345, 'HimenÃ³ptero'),
(346, 'First Generation Films'),
(347, 'Mod Producciones'),
(348, 'MICA Entertainment'),
(349, 'PalmStar Media'),
(350, 'Gail Katz Productions'),
(351, 'Animus Films'),
(352, 'Edward R. Pressman Film'),
(353, 'Kreo Films FZ'),
(354, 'Xeitgeist Entertainment Group'),
(355, 'American Entertainment Investors'),
(356, 'Thaba Media'),
(357, 'Azari Media'),
(358, 'Caviar Films'),
(359, 'Cold Iron Pictures'),
(360, 'Voltage Films'),
(361, 'Midnight Kitchen Productions'),
(362, '1984 Private Defense Contractors'),
(363, 'Czech Anglo Productions'),
(364, 'Luka Productions'),
(365, 'Rai Cinema'),
(366, 'Le Pacte'),
(367, 'Fonds Eurimages du Conseil de l\'Europe'),
(368, 'Gravier Productions'),
(369, 'Benaroya Pictures'),
(370, 'H Films'),
(371, 'Raslan Company of America'),
(372, 'Columbia TriStar'),
(373, 'Clinica Estetico'),
(374, 'S Films'),
(375, 'New Sparta Films'),
(376, 'Laser Unicorns'),
(377, 'Ministero per i Beni e le AttivitÃ  Culturali (MiBAC)'),
(378, 'Frenesy Film Company'),
(379, 'Sensi Contemporanei Cinema e Audiovisivo'),
(380, 'Cota Film'),
(381, 'Umedia'),
(382, 'Informant Europe SPRL'),
(383, 'European Film Company'),
(384, 'Parabolic Pictures'),
(385, 'Stable Way Entertainment'),
(386, 'Cargo Films'),
(387, 'Media House Capital'),
(388, 'Phoenix Pictures'),
(389, 'Fabula'),
(390, 'Half Circle'),
(391, 'Ruby Films'),
(392, 'PathÃ©'),
(393, 'The Bureau'),
(394, 'Creative Scotland'),
(395, 'Oasis Films'),
(396, 'Twirly Films Limited'),
(397, 'MM Productions'),
(398, 'Merced Media Partners'),
(399, 'Walt Disney Television'),
(400, 'Echo Films'),
(401, 'Bron Studios'),
(402, 'Hahnscape'),
(403, 'Fox Searchlight Pictures'),
(404, 'Fox Searchlight'),
(405, 'Blueprint Pictures'),
(406, 'Metanoia Films'),
(407, 'Warner Bros. Animation'),
(408, 'Serendipity Point Films'),
(409, 'Egoli Tossell Film AG'),
(410, 'Vinyl Films'),
(411, 'RatPac Entertainment'),
(412, '343 Industries'),
(413, 'The Sequence Group'),
(414, 'Smokehouse Pictures'),
(415, 'Rhombus Media'),
(416, 'Pandastorm Pictures'),
(417, 'KSM'),
(418, 'Park Pictures'),
(419, 'Audax Films'),
(420, 'Dark Arts Film'),
(421, 'End Cue'),
(422, 'Atlas Independent'),
(423, 'Henceforth Pictures'),
(424, 'Highland Film Group'),
(425, 'Minds Eye Entertainment'),
(426, 'Panacea Entertainment'),
(427, 'Moving Pictures Media'),
(428, 'On The Corner Films'),
(429, 'Universal Music'),
(430, 'A Company Filmproduktionsgesellschaft'),
(431, 'Aleph Motion Pictures'),
(432, 'Aden Film'),
(433, 'Prescience'),
(434, 'Bord Scannan na hEireann / Irish Film Board'),
(435, 'Fantastic Films'),
(436, 'Altitude Film Entertainment'),
(437, 'Occupant Entertainment'),
(438, 'Mattel Playground Productions'),
(439, 'Starchild Pictures');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `uid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `job` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`uid`, `name`, `job`) VALUES
(1, 'Damien Chazelle', 'Director'),
(2, 'Christopher Nolan', 'Director'),
(3, 'Steven Spielberg', 'Director'),
(4, 'James Cameron', 'Director');

-- --------------------------------------------------------

--
-- Table structure for table `visualize`
--

CREATE TABLE `visualize` (
  `id_user` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work`
--

CREATE TABLE `work` (
  `id_staff` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wow_group`
--

CREATE TABLE `wow_group` (
  `uid` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `creator` int(11) NOT NULL,
  `group_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wow_group`
--

INSERT INTO `wow_group` (`uid`, `owner`, `creator`, `group_name`) VALUES
(1, 1, 1, 'Mon super pote'),
(2, 2, 3, 'La Famille');

-- --------------------------------------------------------

--
-- Table structure for table `wow_user`
--

CREATE TABLE `wow_user` (
  `uid` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `age` int(11) NOT NULL,
  `genre` char(1) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wow_user`
--

INSERT INTO `wow_user` (`uid`, `first_name`, `last_name`, `email`, `age`, `genre`, `password`) VALUES
(1, 'Alice', 'Bertrand', 'alice.bertrand@gmail.com', 18, 'F', 'aVkjfeFtgyio89.'),
(2, 'Bob', 'Dylan', 'bob.dylan@gmail.com', 52, 'H', 'dtfghUf8k7lzS.OUbct'),
(3, 'Charlie', 'Durand', 'charlie.durand@gmail.com', 52, 'A', 'zeljzef83dDQEjc7.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `be`
--
ALTER TABLE `be`
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indexes for table `belong`
--
ALTER TABLE `belong`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD KEY `product_ibfk_1` (`id_production`),
  ADD KEY `product_ibfk_2` (`id_movie`);

--
-- Indexes for table `production`
--
ALTER TABLE `production`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `visualize`
--
ALTER TABLE `visualize`
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indexes for table `work`
--
ALTER TABLE `work`
  ADD KEY `id_staff` (`id_staff`),
  ADD KEY `id_movie` (`id_movie`);

--
-- Indexes for table `wow_group`
--
ALTER TABLE `wow_group`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `owner` (`owner`),
  ADD KEY `creator` (`creator`);

--
-- Indexes for table `wow_user`
--
ALTER TABLE `wow_user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=452;

--
-- AUTO_INCREMENT for table `production`
--
ALTER TABLE `production`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wow_group`
--
ALTER TABLE `wow_group`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wow_user`
--
ALTER TABLE `wow_user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `be`
--
ALTER TABLE `be`
  ADD CONSTRAINT `be_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`uid`),
  ADD CONSTRAINT `be_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`uid`);

--
-- Constraints for table `belong`
--
ALTER TABLE `belong`
  ADD CONSTRAINT `belong_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `wow_user` (`uid`),
  ADD CONSTRAINT `belong_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `wow_group` (`uid`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_production`) REFERENCES `production` (`uid`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`uid`) ON DELETE CASCADE;

--
-- Constraints for table `visualize`
--
ALTER TABLE `visualize`
  ADD CONSTRAINT `visualize_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `wow_user` (`uid`),
  ADD CONSTRAINT `visualize_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`uid`);

--
-- Constraints for table `work`
--
ALTER TABLE `work`
  ADD CONSTRAINT `work_ibfk_1` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`uid`),
  ADD CONSTRAINT `work_ibfk_2` FOREIGN KEY (`id_movie`) REFERENCES `movie` (`uid`);

--
-- Constraints for table `wow_group`
--
ALTER TABLE `wow_group`
  ADD CONSTRAINT `wow_group_ibfk_1` FOREIGN KEY (`owner`) REFERENCES `wow_user` (`uid`),
  ADD CONSTRAINT `wow_group_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `wow_user` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

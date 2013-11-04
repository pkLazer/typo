Feature: merging articles
  As an admin
  I would like to be able to merge articles
  So that they can be merged into one article

Background: adding articles and users
  Given the following users exist:
  | login    | password | email | profile_id  | name     | state  |
  | nonadmin | abcd1234 | a@b.c | 2           | nonadmin | active |
  | anadmin  | xyz567   | x@y.z | 3           | anadmin  | active |

  Given the following articles exist:
  | id | title         | author   | body    | published |
  | 1  | Test Article  | nonadmin | content | true      |
  | 2  | Other Article | nonadmin | other   | true      |
  | 3  | Legit Article | anadmin  | legit   | true      |

Scenario: A non-admin cannot merge two articles
  Given the blog is set up
  And I am logged into the admin panel
  When I follow "All Articles"
  When I follow "Test Article"
  Then I should see "Merge With This Article"


Scenario: When articles are merged, the merged article should contain the text of both previous articles
  Given articles "1" and "3" were merged
  #And I am logged into the admin panel
  Then I should see "Test Article"
  When I follow "Test Article"
  Then I should see "content"
  And I should see "legit"

#Scenario: merged articles should have one author

#Scenario: merged articles should containt the comments from both articles

#Scenario: the resulting merge should have the title of one of the merged articles

<?php

use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\MinkExtension\Context\MinkContext as MinkExtension;

/**
 * Defines application features from the specific context.
 */
class WebContext extends RawDrupalContext implements SnippetAcceptingContext {

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct() {
    // Do something?
  }

  /**
   * Check that there are more than or = to a number of elements on a page.
   *
   * @Then /^I should see "([^"]*)" or more "([^"]*)" elements$/
   */
  public function iShouldSeeOrMoreElements($num, $element) {

    $container = $this->getSession()->getPage();
    $nodes = $container->findAll('css', $element);

    if (intval($num) > count($nodes)) {
      $message = sprintf('%d elements less than %s "%s" found on the page, but should be %d.', count($nodes), $selectorType, $selector, $count);
      throw new ExpectationException($message, $this->session);
    }
  }

  /**
   * This works for the Goutte driver.
   *
   * @Then /^save the HTML page to tmp$/
   */
  public function save_the_html_page_to_tmp() {

    $html_data = $this->getSession()->getDriver()->getContent();
    $file_and_path = '/tmp/behat_page.html';
    file_put_contents($file_and_path, $html_data);
  }

  /**
   * @When I plug a random email into the :field field
   */
  public function randomEmail($field) {
    $t = time();
    $randomString = $t . '@example.com';
    // Use the Mink Extension step definition.
    $this->getSession()->getPage()->fillField($field, $randomString);
  }

  /**
   * @When I plug a random name into the :field field
   */
  public function randomName($field) {
    $t = time();
    $randomString = 'BehatName-' . $t;
    // Use the Mink Extension step definition.
    $this->getSession()->getPage()->fillField($field, $randomString);
  }

  /**
   * @When I plug a random phone number into the :field field
   */
  public function randomPhone($field) {
    $length = 10;
    $chr = '0123456789';
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
      $randomString .= $chr[rand(0, strlen($chr) - 1)];
    }
    // Use the Mink Extension step definition.
    $this->getSession()->getPage()->fillField($field, $randomString);
  }

  /**
   * @When I plug lorem ipsum into the :field field
   */
  public function generateLoremIpsum($field) {
    $randomString = '';
    $lipsum = simplexml_load_file('http://www.lipsum.com/feed/xml?amount=1&what=paras&start=0')->lipsum;
    $randomString = (string) $lipsum;
    // Use the Mink Extension step definition.
    $this->getSession()->getPage()->fillField($field, $randomString);
  }

}

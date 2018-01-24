<?php

/**
 * @file
 * Contains \OpenEDUSubContext.
 */

use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Drupal\DrupalExtension\Context\DrupalSubContextBase;
use Behat\Behat\Context\SnippetAcceptingContext;

/**
 * Sub context for OpenEDU step definitions.
 */
class OpenEDUSubContext extends DrupalSubContextBase implements SnippetAcceptingContext {

  /**
   * The Mink context.
   *
   * @var \Drupal\DrupalExtension\Context\MinkContext
   */
  protected $minkContext;

  /**
   * Pre-scenario hook.
   *
   * @BeforeScenario
   */
  public function gatherContexts(BeforeScenarioScope $scope) {
    $environment = $scope->getEnvironment();
    $this->minkContext = $environment->getContext('Drupal\DrupalExtension\Context\MinkContext');
  }

  /**
   * Wait x amount of seconds.
   *
   * @When I wait :seconds second(s)
   */
  public function iWaitSeconds($seconds) {
    $this->getSession()->wait($seconds * 1000);
  }

  /**
   * Hover element based on css selector.
   *
   * @Then I hover over :selector
   */
  public function iHoverOver($selector) {
    $session = $this->getSession();
    $text = $session->getPage()->find('css', $selector);
    if (!$text) {
      throw new Exception($selector . " could not be found!");
    }
    else {
      $text->mouseOver();
    }
  }

  /**
   * Click element based on css selector.
   *
   * @Then I click on :button
   */
  public function iClickOn($button) {
    $session = $this->getSession();
    $text = $session->getPage()->find('css', $button);
    if (!$text) {
      throw new Exception($button . " could not be found!");
    }
    else {
      $text->click();
    }
  }

}

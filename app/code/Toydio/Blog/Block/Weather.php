<?php
declare(strict_types=1);

namespace Toydio\Blog\Block;


use Magento\Framework\View\Element\Template;
use Toydio\Blog\Model\WeatherFactory;

class Weather extends Template
{

    private $weatherFactory;

    /**
     * Weather constructor.
     * @param Template\Context $context
     * @param WeatherFactory $weatherFactory
     * @param array $data
     */
    public function __construct(
        Template\Context $context,
        WeatherFactory $weatherFactory,
        array $data = []
    )
    {
        parent::__construct($context, $data);
        $this->weatherFactory = $weatherFactory;
    }


    public function getWeatherInformation()
    {
        return $this->weatherFactory->create()->getWeatherResponse();
    }
    
    public function getForcastInformation($city_id)
    {
        return $this->weatherFactory->create()->getForcast($city_id);
    }
}
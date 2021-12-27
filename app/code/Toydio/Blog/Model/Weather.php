<?php
declare(strict_types=1);

namespace Toydio\Blog\Model;


use Magento\Framework\App\Request\Http;
use Magento\Framework\HTTP\Client\CurlFactory;
use Magento\Framework\Json\Helper\Data as JsonHelper;

class Weather
{
    const REQUEST_TIMEOUT = 2000;

    const END_POINT_URL = 'api.openweathermap.org/data/2.5/weather?q=hanoi';

    const API_KEY = "f31efe1131c96d6b5adae34a6b1db2fa";

    private $response;

        /**
     * @var CurlFactory
     */
    private $curlFactory;

    /**
     * @var Http
     */
    private $http;

    /**
     * @var JsonHelper
     */
    private $jsonHelper;

    /**
     * Exchange constructor.
     *
     * @param CurlFactory $curlFactory
     * @param Http $http
     * @param JsonHelper $jsonHelper
     */
    public function __construct(
        CurlFactory $curlFactory,
        Http $http,
        JsonHelper $jsonHelper
    )
    {
        $this->curlFactory = $curlFactory;
        $this->http = $http;
        $this->jsonHelper = $jsonHelper;
    }
    
    public function getWeatherResponse()
    {
        if(!$this->response){
            $this->response = (object) $this->getResponseFromEndPoint();
        }
        return $this->response;
    }

    private function getResponseFromEndPoint()
    {
        return $this->jsonHelper->jsonDecode($this->getResponse());
    }

    private function getResponse()
    {
        /** @var \Magento\Framework\HTTP\Client\Curl $client */
        $client = $this->curlFactory->create();
        $client->setTimeout(self::REQUEST_TIMEOUT);
        $client->get(
            self::END_POINT_URL . '&APPID=' . self::API_KEY
        );
        return $client->getBody();
    }
    
    function getForcast($city_id) {
        $array_json = "http://api.openweathermap.org/data/2.5/forecast?id=" . $city_id . "&appid=" . self::API_KEY;
        $json = file_get_contents($array_json);
        $obj = json_decode($json);
        return $obj;
    }
}
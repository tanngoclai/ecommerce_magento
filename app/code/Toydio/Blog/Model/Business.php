<?php
declare(strict_types=1);

namespace Toydio\Blog\Model;


use Magento\Framework\App\Request\Http;
use SimpleXMLElement;
use Magento\Framework\HTTP\Client\CurlFactory;
use Magento\Framework\Json\Helper\Data as JsonHelper;

class Business
{
    const REQUEST_TIMEOUT = 2000;

    const END_POINT_URL = 'https://vnexpress.net/rss/kinh-doanh.rss';

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
     * Business constructor.
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

    public function getBusinessResponse()
    {
        if(!$this->response){
            $this->response = (object) $this->getResponseFromEndPoint();
        }
        return $this->response;
    }

    private function getResponseFromEndPoint()
    {
        return $this->getResponse();
    }

    private function getResponse()
    {
        $response = file_get_contents(self::END_POINT_URL);
        return $response;
    }
}
<?php
declare(strict_types=1);

namespace Toydio\Blog\Model;


use Magento\Framework\App\Request\Http;
use SimpleXMLElement;
use Magento\Framework\HTTP\Client\CurlFactory;
use Magento\Framework\Json\Helper\Data as JsonHelper;

class Exchange
{
    const REQUEST_TIMEOUT = 2000;

    const END_POINT_URL = 'https://portal.vietcombank.com.vn/Usercontrols/TVPortal.TyGia/pXML.aspx';

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

    public function getExchangerateResponse()
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
    
    function parse_xml($xml_str) {
        $items = array();
        $xml_doc = new SimpleXMLElement($xml_str);

        foreach ($xml_doc->item as $item) {
            $items []= $item->Exrate;
        }

        return $items;
    }
}
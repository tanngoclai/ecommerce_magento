<?php
declare(strict_types=1);

namespace Toydio\Blog\Block;

use Magento\Framework\View\Element\Template;
use Toydio\Blog\Model\BusinessFactory;

class Business extends Template
{
    private $businessFactory;

    /**
     * WeatherBlock constructor.
     * @param Template\Context $context
     * @param BusinessFactory $businessFactory
     * @param array $data
     */
    public function __construct(
        Template\Context $context,
        BusinessFactory $businessFactory,
        array $data = []
    )
    {
        parent::__construct($context, $data);
        $this->businessFactory = $businessFactory;
    }

    public function getBusinessInformation()
    {
        return $this->businessFactory->create()->getBusinessResponse();
    }
}
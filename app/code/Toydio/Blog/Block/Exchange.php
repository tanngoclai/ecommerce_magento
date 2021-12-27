<?php
declare(strict_types=1);

namespace Toydio\Blog\Block;

use Magento\Framework\View\Element\Template;
use Toydio\Blog\Model\ExchangeFactory;

class Exchange extends Template
{
    private $exchangeFactory;

    /**
     * Exchange constructor.
     * @param Template\Context $context
     * @param ExchangeFactory $exchangeFactory
     * @param array $data
     */
    public function __construct(
        Template\Context $context,
        ExchangeFactory $exchangeFactory,
        array $data = []
    )
    {
        parent::__construct($context, $data);
        $this->exchangeFactory = $exchangeFactory;
    }

    public function getExchangerateInformation()
    {
        return $this->exchangeFactory->create()->getExchangerateResponse();
    }
}
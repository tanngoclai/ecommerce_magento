FROM php:7.4.1-fpm

RUN apt-get update && apt-get install -y \
    apt-utils \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    libcurl4-openssl-dev \
    git unzip cron \
    --no-install-recommends \
    && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install bcmath gd intl libxml mbstring openssl pcre pdo_mysql soap sockets sodium xmlwriter xsl zip 

RUN docker-php-configure \
        gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN echo "memory_limit=2048M" > /usr/local/etc/php/conf.d/magento.ini \
    && echo "realpath_cache_size=2M" >> /usr/local/etc/php/conf.d/magento.ini \
    && echo "opcache.max_accelerated_files=200000" >> /usr/local/etc/php/conf.d/magento.ini \
    && echo "opcache.memory_consumption=256M" >> /usr/local/etc/php/conf.d/magento.ini \
    && echo "zlib.output_compression=1" >> /usr/local/etc/php/conf.d/magento.ini
    
# Install Composer
RUN curl -sS https://getcomposer.org/download/2.1.9/composer.phar \
    && chmod a+x composer.phar \
    && mv composer.phar /usr/local/bin/composer

# Create user magento
RUN useradd -m -s /bin/bash magento \
    && usermod -a -G www-data magento

RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

ADD ./php-custom.ini $PHP_INI_DIR/conf.d/

CMD ["php-fpm"]

EXPOSE 9000
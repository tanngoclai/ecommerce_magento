Copy toàn bộ file và thư mục trong folder docker này ra ngoài (folder mẹ của cái repo này)

Chạy:
docker-compose up
docker-compose exec phpfpm bash
bin/magento setup:config:set --backend-frontname=admin --db-host=mysql --db-name=mydatabase --db-user=myuser --db-password=test123
bin/magento setup:install --elasticsearch-host='elasticsearch' --elasticsearch-port=9200
bin/magento admin:user:create --admin-user='admin' --admin-password='test123' --admin-email='admin@admin.com' --admin-firstname='Admin' --admin-lastname='Admin'

Xong vào thử http://127.0.0.1/admin
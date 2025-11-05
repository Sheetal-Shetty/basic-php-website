pipeline {
    agent any

    stages {
        stage('Lint'){
            steps{
                script {
                    sh 'php -l *.php'
                }
            }

        }
        stage('Deploy Website') {
            steps {
                script {
                    sh '''
                    DEST_DIR="/var/www/html/basicphp"
                    APACHE_CONF="/etc/apache2/sites-available/000-default.conf"

                    echo "Creating directory if not exists..."
                    sudo mkdir -p "$DEST_DIR"

                    echo "Copying files from workspace to $DEST_DIR ..."
                    sudo rsync -av --delete "$WORKSPACE"/ "$DEST_DIR"/

                    echo "Updating Apache DocumentRoot ..."
                    sudo sed -i "s|DocumentRoot .*|DocumentRoot $DEST_DIR|g" "$APACHE_CONF"

                    echo "Restarting Apache2..."
                    sudo systemctl restart apache2

                    echo "✅ Deployment complete. Site is served from $DEST_DIR"
                    '''
                }
            }
        }
    }
}

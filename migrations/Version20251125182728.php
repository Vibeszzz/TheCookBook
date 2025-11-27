<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251125182728 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ingredients (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE ratings (id INT AUTO_INCREMENT NOT NULL, rating INT NOT NULL, created_at DATETIME NOT NULL, recipe_ratings_id INT DEFAULT NULL, user_ratings_id INT DEFAULT NULL, INDEX IDX_CEB607C9DC026E2C (recipe_ratings_id), INDEX IDX_CEB607C9321B2EA3 (user_ratings_id), PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE ratings ADD CONSTRAINT FK_CEB607C9DC026E2C FOREIGN KEY (recipe_ratings_id) REFERENCES recipe (id)');
        $this->addSql('ALTER TABLE ratings ADD CONSTRAINT FK_CEB607C9321B2EA3 FOREIGN KEY (user_ratings_id) REFERENCES user (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ratings DROP FOREIGN KEY FK_CEB607C9DC026E2C');
        $this->addSql('ALTER TABLE ratings DROP FOREIGN KEY FK_CEB607C9321B2EA3');
        $this->addSql('DROP TABLE ingredients');
        $this->addSql('DROP TABLE ratings');
    }
}

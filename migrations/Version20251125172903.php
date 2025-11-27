<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20251125172903 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE categories (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(100) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE recipe_tags (recipe_id INT NOT NULL, tags_id INT NOT NULL, INDEX IDX_10A7CEF959D8A214 (recipe_id), INDEX IDX_10A7CEF98D7B4FB4 (tags_id), PRIMARY KEY (recipe_id, tags_id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('CREATE TABLE tags (id INT AUTO_INCREMENT NOT NULL, name VARCHAR(255) NOT NULL, PRIMARY KEY (id)) DEFAULT CHARACTER SET utf8mb4');
        $this->addSql('ALTER TABLE recipe_tags ADD CONSTRAINT FK_10A7CEF959D8A214 FOREIGN KEY (recipe_id) REFERENCES recipe (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE recipe_tags ADD CONSTRAINT FK_10A7CEF98D7B4FB4 FOREIGN KEY (tags_id) REFERENCES tags (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE recipe ADD categories_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE recipe ADD CONSTRAINT FK_DA88B137A21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id)');
        $this->addSql('CREATE INDEX IDX_DA88B137A21214B7 ON recipe (categories_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE recipe_tags DROP FOREIGN KEY FK_10A7CEF959D8A214');
        $this->addSql('ALTER TABLE recipe_tags DROP FOREIGN KEY FK_10A7CEF98D7B4FB4');
        $this->addSql('DROP TABLE categories');
        $this->addSql('DROP TABLE recipe_tags');
        $this->addSql('DROP TABLE tags');
        $this->addSql('ALTER TABLE recipe DROP FOREIGN KEY FK_DA88B137A21214B7');
        $this->addSql('DROP INDEX IDX_DA88B137A21214B7 ON recipe');
        $this->addSql('ALTER TABLE recipe DROP categories_id');
    }
}

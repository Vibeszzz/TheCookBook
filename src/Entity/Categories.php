<?php

namespace App\Entity;

use App\Repository\CategoriesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoriesRepository::class)]
class Categories
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 100)]
    private ?string $name = null;

    /**
     * @var Collection<int, Recipe>
     */
    #[ORM\OneToMany(targetEntity: Recipe::class, mappedBy: 'categories')]
    private Collection $categoryRecipes;

    public function __construct()
    {
        $this->categoryRecipes = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): static
    {
        $this->name = $name;

        return $this;
    }

    /**
     * @return Collection<int, Recipe>
     */
    public function getCategoryRecipes(): Collection
    {
        return $this->categoryRecipes;
    }

    public function addCategoryRecipe(Recipe $categoryRecipe): static
    {
        if (!$this->categoryRecipes->contains($categoryRecipe)) {
            $this->categoryRecipes->add($categoryRecipe);
            $categoryRecipe->setCategories($this);
        }

        return $this;
    }

    public function removeCategoryRecipe(Recipe $categoryRecipe): static
    {
        if ($this->categoryRecipes->removeElement($categoryRecipe)) {
            // set the owning side to null (unless already changed)
            if ($categoryRecipe->getCategories() === $this) {
                $categoryRecipe->setCategories(null);
            }
        }

        return $this;
    }
}

<?php

namespace App\Entity;

use App\Repository\RatingsRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: RatingsRepository::class)]
class Ratings
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\ManyToOne(inversedBy: 'ratings')]
    private ?Recipe $recipeRatings = null;

    #[ORM\ManyToOne(inversedBy: 'ratings')]
    private ?User $userRatings = null;

    #[ORM\Column]
    private ?int $rating = null;

    #[ORM\Column]
    private ?\DateTimeImmutable $createdAt = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getRecipeRatings(): ?Recipe
    {
        return $this->recipeRatings;
    }

    public function setRecipeRatings(?Recipe $recipeRatings): static
    {
        $this->recipeRatings = $recipeRatings;

        return $this;
    }

    public function getUserRatings(): ?User
    {
        return $this->userRatings;
    }

    public function setUserRatings(?User $userRatings): static
    {
        $this->userRatings = $userRatings;

        return $this;
    }

    public function getRating(): ?int
    {
        return $this->rating;
    }

    public function setRating(int $rating): static
    {
        $this->rating = $rating;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeImmutable $createdAt): static
    {
        $this->createdAt = $createdAt;

        return $this;
    }
}

<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Entity\Comments;
use App\Entity\Recipe;
use App\Form\CategoryFormType;
use App\Form\RecipeFormType;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;

final class HomeController extends AbstractController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',
        ]);
    }

    #[Route('/categories', name: 'app_categories')]
    public function categories(EntityManagerInterface $entityManager): Response
    {
        $categories = $entityManager->getRepository(Categories::class)->findAll();

        return $this->render('home/categories.html.twig', [
            'categories' => $categories,
        ]);
    }

    #[Route('/recipes', name: 'app_recipes')]
    public function recipes(Request $request, EntityManagerInterface $entityManager): Response
    {
        $recipes = $entityManager->getRepository(Recipe::class)->findAll();
        $categories = $entityManager->getRepository(Categories::class)->findAll();

        return $this->render('home/recipes.html.twig', [
            'recipes' => $recipes,
            'categories' => $categories,
        ]);
    }

    #[Route('/make/recipes', name: 'app_make_recipe')]
    public function makeRecipes(Request $request, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(RecipeFormType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $recipe = $form->getData();
            $recipe->setUserRecipe($this->getUser());
            $totalTime = $recipe->getPrepTimeMin() + $recipe->getCookTimeMin();
            $recipe->setTotalTimeMin($totalTime);
            $recipe->setCreatedAt(new \DateTimeImmutable());
            $recipe->setUpdatedAt(new \DateTimeImmutable());
            $entityManager->persist($recipe);
            $entityManager->flush();

            $this->addFlash('success', 'Het boek is toegevoegd');

            return $this->redirectToRoute('app_recipes');
        }

        return $this->render('home/make_recipes.html.twig', [
            'form' => $form,
        ]);
    }

    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    #[Route('/show/recipe/{recipe}', name: 'app_show_recipe')]
    public function showRecipe(EntityManagerInterface $entityManager ,Recipe $recipe): Response
    {
        $recipes = $entityManager->getRepository(Recipe::class)->find($recipe);
        return $this->render('home/show_recipe.html.twig', [
            'recipe' => $recipes,
        ]);
    }
}

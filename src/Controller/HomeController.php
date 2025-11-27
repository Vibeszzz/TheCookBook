<?php

namespace App\Controller;

use App\Entity\Categories;
use App\Entity\Comments;
use App\Entity\Recipe;
use App\Form\CategoryFormType;
use App\Form\PasswordResetFormType;
use App\Form\RecipeFormType;
use App\Form\UploadProfilePictureFormType;
use App\Repository\RecipeRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Http\Attribute\IsGranted;
use Symfony\Component\String\Slugger\SluggerInterface;

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

            // Calculate total time
            $totalTime = $recipe->getPrepTimeMin() + $recipe->getCookTimeMin();
            $recipe->setTotalTimeMin($totalTime);

            $recipe->setCreatedAt(new \DateTimeImmutable());
            $recipe->setUpdatedAt(new \DateTimeImmutable());

            // Handle uploaded image
            $imageFile = $form->get('images')->getData(); // 'images' is the FileType in the form
            if ($imageFile) {
                $newFilename = uniqid() . '.' . $imageFile->guessExtension();
                $imageFile->move(
                    $this->getParameter('recipes_directory'), // make sure this exists in config/services.yaml
                    $newFilename
                );
                $recipe->setImages($newFilename);
            }

            $entityManager->persist($recipe);
            $entityManager->flush();

            $this->addFlash('success', 'Het recept is toegevoegd');

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

    #[Route('/profile', name: 'app_profile')]
    public function profile(Request $request, EntityManagerInterface $entityManager, SluggerInterface $slugger): Response
    {
        $form = $this->createForm(UploadProfilePictureFormType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $file = $form->get('profilePicture')->getData();

            if ($file) {
                $originalFilename = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename.'-'.uniqid().'.'.$file->guessExtension();

                try {
                    $file->move(
                        $this->getParameter('profile_pictures_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    $this->addFlash('error', 'Failed to upload profile picture');
                }

                $user = $this->getUser();
                $user->setProfilePicture($newFilename);
                $entityManager->flush();

                $this->addFlash('success', 'Profile picture updated!');
                return $this->redirectToRoute('app_profile');
            }
        }

        return $this->render('home/profile.html.twig', [
            'form' => $form->createView(),
        ]);
    }

    #[Route('/home/profile/change-password', name: 'app_change_password')]
    public function changePassword(Request $request, EntityManagerInterface $entityManager, UserPasswordHasherInterface $passwordHasher): Response
    {
        $user = $this->getUser();
        if (!$user) {
            throw $this->createAccessDeniedException();
        }

        $form = $this->createForm(PasswordResetFormType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $plainPassword = $form->get('plainPassword')->getData();

            // Hash and set the new password
            $hashedPassword = $passwordHasher->hashPassword($user, $plainPassword);
            $user->setPassword($hashedPassword);

            $entityManager->persist($user);
            $entityManager->flush();

            $this->addFlash('success', 'Wachtwoord succesvol gewijzigd.');

            return $this->redirectToRoute('app_profile');
        }

        return $this->render('home/change_password.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}

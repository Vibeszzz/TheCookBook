<?php

namespace App\Controller;

use App\Entity\Comments;
use App\Form\CommentFormType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class CommentController extends AbstractController
{
    #[Route('/comments', name: 'app_comments')]
    public function comments(EntityManagerInterface $entityManager): Response
    {
        $comments = $entityManager->getRepository(Comments::class)->findAll();

        return $this->render('comment/index.html.twig',[
            'comments' => $comments,
        ]);
    }

    #[Route('/make/comment', name: 'app_make_comment')]
    public function newComment(Request $request, EntityManagerInterface $entityManager): Response
    {
        $form = $this->createForm(CommentFormType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $comment = $form->getData();
            $comment->setUserComments($this->getUser());
            $comment->setCreatedAt(new \DateTimeImmutable());
            $entityManager->persist($comment);
            $entityManager->flush();

            $this->addFlash('success', 'Het boek is toegevoegd');

            return $this->redirectToRoute('app_comments');
        }

        return $this->render('comment/new_comment.html.twig',[
            'form' => $form,
        ]);
    }
}

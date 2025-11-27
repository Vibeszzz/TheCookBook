<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Recipe;
use App\Entity\Tags;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class RecipeFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title')
            ->add('description')
            ->add('prepTimeMin')
            ->add('cookTimeMin')
            ->add('servings')
            ->add('difficulty', ChoiceType::class, [
                'choices'  => [
                    'Easy' => 'Easy',
                    'Medium' => 'Medium',
                    'Hard' => 'Hard',
                ],
            ])
            ->add('images', FileType::class, [
                'label' => 'Recipe Image',
                'mapped' => false,        // not automatically stored in entity
                'required' => false,      // optional
                'attr' => ['accept' => 'image/*'],
            ])
            ->add('categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'name',
            ])
            ->add('recipeTags', EntityType::class, [
                'class' => Tags::class,
                'choice_label' => 'name',
                'multiple' => true,
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Recipe::class,
        ]);
    }
}

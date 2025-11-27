<?php

namespace App\Form;

use App\Entity\Categories;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ResetType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class CategoryFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('category', EntityType::class, [
                'class' => Categories::class,        // The entity class
                'choice_label' => 'name',            // Display the 'name' property in dropdown
                'placeholder' => 'Select a category',// Optional placeholder
                'required' => true,                  // Make it required
                'attr' => [
                    'class' => 'rounded border-gray-300 p-2 w-full' // Optional Tailwind styling
                ],
            ])
        ->add('find', SubmitType::class, [
        'label' => 'Find',
        'attr' => [
            'class' => 'px-4 py-2 bg-green-500 text-white rounded-lg hover:bg-green-600 transition'
        ]
    ])
        ->add('reset', ResetType::class, [
            'label' => 'Reset',
            'attr' => [
                'class' => 'px-4 py-2 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400 transition'
            ]
        ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Categories::class,
        ]);
    }
}

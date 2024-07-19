<?php

namespace App\DataFixtures;

use App\Entity\Category;
use App\Entity\Item;
use App\Entity\Review;
use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i = 0; $i < 5; $i++) {
            //USER
            $user = new User();
            $hash = password_hash('test', PASSWORD_BCRYPT);
            $user
                ->setEmail('test' . $i . '@gmail.com')
                ->setPassword($hash)
                ->setFirstname('firstuser_' . $i)
                ->setLastname('lastuser_' . $i);
            $manager->persist($user);


            //CATEGORY
            $category = new Category();
            $category->setName('category_' . $i);
            $manager->persist($category);


            //ITEM
            $item = new Item();
            $item
                ->setTitle('item_' . $i)
                ->setDescription('Je suis une description d\'item')
                ->setAuthor('author_' . $i)
                ->setAuthorDescription('Je suis une description d\'auteur')
                ->setCategory($category)
                ->setAverageReview(3)
                ->setImage('assets/images/picsum.png')
                ->setCreationDate(new \DateTime());
            $manager->persist($item);

            //REVIEW
            $review = new Review();
            $review
                ->setItem($item)
                ->setUser($user)
                ->setNote(3);
            $manager->persist($review);

        }

        $manager->flush();
    }
}

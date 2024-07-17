<?php

namespace App\DataFixtures;

use App\Entity\User;
use App\Entity\Category;
use App\Entity\Item;
use App\Entity\Review;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class AppFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        for ($i = 0; $i < 20; $i++) {
            //USER
            $user = new User();
            $user->setEmail('test'.$i.'@gmail.com');
            $hash = password_hash('test', PASSWORD_BCRYPT);
            $user->setPassword($hash);
            $user->setFirstname('firstuser_'.$i);
            $user->setLastname('lastuser_'.$i);
            $manager->persist($user);


            //CATEGORY
            $category = new Category();
            $category->setName('category_'.$i);
            $manager->persist($category);


            //ITEM
            $item = new Item();
            $item->setTitle('item_'.$i);
            $item->setDescription('Je suis une description d\'item');
            $item->setAuthor('author_'.$i);
            $item->setAuthorDescription('Je suis une description d\'auteur');
            $item->setCategory($category);
            $manager->persist($item);

            //REVIEW
            $review = new Review();
            $review->setItem($item);
            $review->setUser($user);
            $review->setNote(3);
            $manager->persist($review);

        }

        $manager->flush();
    }
}

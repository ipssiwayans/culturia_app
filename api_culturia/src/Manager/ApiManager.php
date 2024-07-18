<?php

namespace App\Manager;

use App\Entity\Category;
use App\Entity\Item;
use App\Entity\Review;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;

class ApiManager
{
    private EntityManagerInterface $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    // Item

    public function getItemsByCategory(int $categoryId): array
    {
        $items = $this->entityManager->getRepository(Item::class)->findBy(['category' => $categoryId]);
        $itemArr = [];
        foreach ($items as $item) {
            $itemArr[] = [
                'id' => $item->getId(),
                'category_id' => $item->getCategory()->getId(),
                'title' => $item->getTitle(),
                'author' => $item->getAuthor(),
                'description' => $item->getDescription(),
                'author_description' => $item->getAuthorDescription(),
            ];
        }

        return $itemArr;
    }

    public function addNewItem(array $data): void
    {

        if ($data['category_id']) {
            $category = $this->entityManager->getRepository(Category::class)->find($data['category_id']);
        }
        $item = new Item();
        $item
            ->setCategory($category ?? null)
            ->setTitle($data['title'])
            ->setAuthor($data['author'] ?? null)
            ->setAuthorDescription($data['author_description'] ?? null)
            ->setDescription($data['description'] ?? null);

        $this->entityManager->persist($item);
        $this->entityManager->flush();

    }

    public function getTopRatedItems($categoryId): array
    {
        $category = $this->entityManager->getRepository(Category::class)->find($categoryId);


        $items = $this->entityManager->getRepository(Item::class)->findBy(['category' => $category], ['average_review' => 'DESC'], limit: 5);

        $itemsArr = [];
        foreach ($items as $item) {
            $itemsArr[] = [
                'id' => $item->getId(),
                'category_id' => $item->getCategory()->getId(),
                'title' => $item->getTitle(),
                'author' => $item->getAuthor(),
                'description' => $item->getDescription(),
                'author_description' => $item->getAuthorDescription(),
                'average_review' => $item->getAverageReview(),
            ];
        }

        return $itemsArr;
    }

    public function getAllReviews(): array
    {
        $reviews = $this->entityManager->getRepository(Review::class)->findAll();
        $reviewArr = [];
        foreach ($reviews as $review) {
            $reviewArr[] = [
                'id' => $review->getId(),
                'item_id' => $review->getItem()->getId(),
                'user_id' => $review->getUser()->getId(),
                'note' => $review->getNote(),
            ];
        }

        return $reviewArr;

    }

    // Category

    public function getAllItems(): array
    {
        $items = $this->entityManager->getRepository(Item::class)->findAll();
        $itemArr = [];

        foreach ($items as $item) {
            $itemArr[] = [
                'id' => $item->getId(),
                'category_id' => $item->getCategory()->getId(),
                'title' => $item->getTitle(),
                'author' => $item->getAuthor(),
                'description' => $item->getDescription(),
                'author_description' => $item->getAuthorDescription(),
            ];
        }

        return $itemArr;
    }

    // User

    public function getAllCategories(): array
    {
        $categories = $this->entityManager->getRepository(Category::class)->findAll();
        $categoryArr = [];
        foreach ($categories as $category) {
            $categoryArr[] = [
                'id' => $category->getId(),
                'name' => $category->getName(),
            ];
        }

        return $categoryArr;

    }

    // Review

    public function getAllUsers(): array
    {
        $users = $this->entityManager->getRepository(User::class)->findAll();
        $userArr = [];
        foreach ($users as $user) {
            $userArr[] = [
                'id' => $user->getId(),
                'firstname' => $user->getFirstname(),
                'lastname' => $user->getLastname(),
                'email' => $user->getEmail(),
                'password' => $user->getPassword(),
            ];
        }

        return $userArr;

    }

    public function addReview(int $itemId, mixed $userId, int $note): void
    {
        $item = $this->entityManager->getRepository(Item::class)->find($itemId);
        if (!empty($userId)) {
            $user = $this->entityManager->getRepository(User::class)->find($userId);
        } else {
            $user = null;
        }


        $userReview = $this->entityManager->getRepository(Review::class)->findOneBy(['item' => $item, 'user' => $user]);
        if ($userReview) {
            $userReview->setNote($note);
        } else {
            $review = new Review();
            $review->setItem($item);
            $review->setUser($user);
            $review->setNote($note);
            $this->entityManager->persist($review);
        }

        $this->entityManager->flush();

        $this->updateItemAverageReview($item);

    }

    private function updateItemAverageReview($item): void
    {

        $reviews = $this->entityManager->getRepository(Review::class)->findBy(['item' => $item]);
        $average = array_reduce($reviews, function ($carry, $review) {
                return $carry + $review->getNote();
            }, 0) / count($reviews);

        $item->setAverageReview($average);

        $this->entityManager->persist($item);
        $this->entityManager->flush();
    }
}
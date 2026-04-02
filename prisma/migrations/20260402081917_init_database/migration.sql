-- CreateTable
CREATE TABLE "users" (
    "user_id" SERIAL NOT NULL,
    "nickname" VARCHAR(50) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "is_pro" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("user_id")
);

-- CreateTable
CREATE TABLE "posts" (
    "post_id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "posts_pkey" PRIMARY KEY ("post_id")
);

-- CreateTable
CREATE TABLE "GameReview" (
    "review_id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "post_id" INTEGER NOT NULL,

    CONSTRAINT "GameReview_pkey" PRIMARY KEY ("review_id")
);

-- CreateTable
CREATE TABLE "comments" (
    "comment_id" SERIAL NOT NULL,
    "post_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "comment_text" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "comments_pkey" PRIMARY KEY ("comment_id")
);

-- CreateTable
CREATE TABLE "tags" (
    "tag_id" SERIAL NOT NULL,
    "tag_name" VARCHAR(50) NOT NULL,

    CONSTRAINT "tags_pkey" PRIMARY KEY ("tag_id")
);

-- CreateTable
CREATE TABLE "post_tags" (
    "post_id" INTEGER NOT NULL,
    "tag_id" INTEGER NOT NULL,

    CONSTRAINT "post_tags_pkey" PRIMARY KEY ("post_id","tag_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_nickname_key" ON "users"("nickname");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "tags_tag_name_key" ON "tags"("tag_name");

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GameReview" ADD CONSTRAINT "GameReview_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("user_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "comments" ADD CONSTRAINT "comments_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "posts"("post_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post_tags" ADD CONSTRAINT "post_tags_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tags"("tag_id") ON DELETE CASCADE ON UPDATE CASCADE;

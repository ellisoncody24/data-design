ALTER DATABASE cellison CHARACTER SET utf8 COLLATE utf8_unicode_ci;







drop table if exists itemOrder;
drop table if exists `order`;
drop table if exists item;
drop table if exists user;


create table user(
                     userId binary(16) not null,
                     userName varchar(32),
                     userShippingInfo varchar(255),
                     primary key(userId)
);

create table item(
                    itemId binary(32) not null,
                    itemQuantity varchar(32) not null,
                    index (itemId),
                    primary key(itemId)
);

create table `order`(
                        orderId binary(16) not null,
                        orderUserId binary(16) not null,
                        orderDate datetime(6) not null,
                        index (orderUserId),
                        foreign key(orderUserId) references user(userId),
                        primary key(orderId)
);

create table itemOrder(
                           itemOrderItemId binary(16),
                           itemOrderOrderId binary(16),
                           foreign key(itemOrderItemId) references item(itemId),
                           foreign key(itemOrderOrderId) references `order`(orderId)
);
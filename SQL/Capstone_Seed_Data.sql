USE [Capstone];
GO

set identity_insert [UserProfile] on
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (1, 'Foo', 'Foo', 'Barington', 'foo@bar.com', 'https://robohash.org/numquamutut.png?size=150x150&set=set1', 'abcnibyohfhukxngaegjxxzionyt');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (2, 'rdo1', 'Red', 'Do', 'rdo1@timesonline.co.ukx', 'https://robohash.org/nisiautemet.png?size=150x150&set=set1', 'vhbgqyeqelhgkohutnoglbdohssl');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (3, 'aotton2', 'Arnold', 'Otton', 'aotton2@ow.lyx', 'https://robohash.org/molestiaemagnamet.png?size=150x150&set=set1', 'wqhvgdjxjqkqecuridpvjtwpoacc');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (4, 'agrzeskowski3', 'Aharon', 'Grzeskowski', 'agrzeskowski3@fc2.comx', 'https://robohash.org/doloremfugiatrerum.png?size=150x150&set=set1', 'exsjcqvnhydjofznqmtvecekcgno');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (5, 'ryakushkev4', 'Rosana', 'Yakushkev', 'ryakushkev4@weibo.comx', 'https://robohash.org/deseruntutipsum.png?size=150x150&set=set1', 'djwoicosfnhexpmmsnukgcsbnqod');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (6, 'tfigiovanni5', 'Tobi', 'Figiovanni', 'tfigiovanni5@baidu.comx', 'https://robohash.org/quiundedignissimos.png?size=150x150&set=set1', 'xiybslspeizewvkixqubnqjlwamz');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (7, 'gteanby6', 'Giuseppe', 'Teanby', 'gteanby6@craigslist.orgx', 'https://robohash.org/hicnihilipsa.png?size=150x150&set=set1', 'lzxmysyzqrmcwjzxsyrkbczhspup');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (8, 'cvanderweedenburg7', 'Cristabel', 'Van Der Weedenburg', 'cvanderweedenburg7@wikimedia.orgx', 'https://robohash.org/quidemearumtenetur.png?size=150x150&set=set1', 'jqqyiksxkocmhphkylikwcehuvky');
insert into UserProfile (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId) values (9, 'ecornfoot8', 'Emmaline', 'Cornfoot', 'ecornfoot8@cargocollective.comx', 'https://robohash.org/blanditiismaioresest.png?size=150x150&set=set1', 'smzswoscvmfpvugpmgvkflihdmka');
set identity_insert [UserProfile] off

set identity_insert [Class] on
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (1, 'Biology', '2021-01-05', '2021-05-25', 1);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (2, 'Chemistry', '2021-01-05', '2021-05-25', 1);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (3, 'Anatomy', '2021-01-05', '2021-05-25', 1);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (4, 'Psychology', '2021-01-05', '2021-05-25', 1);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (5, 'Environmental Science', '2021-01-05', '2021-05-25', 1);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (6, 'Programming', '2021-01-05', '2021-05-25', 2);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (7, 'Robotics', '2021-01-05', '2021-05-25', 2);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (8, 'Physics', '2021-01-05', '2021-05-25', 2);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (9, 'Writing', '2021-01-05', '2021-05-25', 2);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (10, 'English', '2021-01-05', '2021-05-25', 2);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (11, 'Speaking', '2021-01-05', '2021-05-25', 3);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (12, 'Spanish', '2021-01-05', '2021-05-25', 4);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (13, 'Chinese', '2021-01-05', '2021-05-25', 5);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (14, 'History', '2021-01-05', '2021-05-25', 6);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (15, 'Religion', '2021-01-05', '2021-05-25', 7);
insert into Class (Id, "Name", "Begin", "End", TeacherId) values (16, 'Algebra', '2021-01-05', '2021-05-25', 8);
set identity_insert [Class] off

set identity_insert [Student] on
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (1, 'Foo', 'Foo', 'Barington', 'foo@bar.com', 'https://robohash.org/numquamutut.png?size=150x150&set=set1', 'abcnibyohfhukxtghegjxxzionyt', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (2, 'bluedol', 'Blue', 'Do', 'blueidol@timesonline.co.ukx', 'https://robohash.org/nisiautemet.png?size=150x150&set=set1', 'vhbgqyeqelhgkohutjky7bdohssl', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (3, 'abatch1996', 'Arnie', 'Batch', 'abatch24@ow.lyx', 'https://robohash.org/molestiaemagnamet.png?size=150x150&set=set1', 'wqhvgdjxjqkqecuridsdfvypoacc', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (4, 'nevheart', 'Nevea', 'Grondowskild', 'nevgrondowskild@fc2.comx', 'https://robohash.org/doloremfugiatrerum.png?size=150x150&set=set1', 'exsjcqvnh6yjofznqmtvecekcgno', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (5, 'rosebaby666', 'Rosalind', 'Yakushkev', 'ryakushkev4@weibo.comx', 'https://robohash.org/deseruntutipsum.png?size=150x150&set=set1', 'djwoicosfnhexp9oknukgcsbnqod', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (6, 'tmaccoolshortz', 'Tony', 'MacGuireson', 'tmac@baidu.comx', 'https://robohash.org/quiundedignissimos.png?size=150x150&set=set1', 'xiybslspeizewvkixqubnjhgwamz', 1);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (7, 'gbpie', 'Giuseppe', 'Beans', 'gbeans@craigslist.orgx', 'https://robohash.org/hicnihilipsa.png?size=150x150&set=set1', 'lzfghuyzqrmcwjzxsyrkbczhspup', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (8, 'vanscoy2000', 'Cristabel', 'VanScoy', 'crisVS@wikimedia.orgx', 'https://robohash.org/quidemearumtenetur.png?size=150x150&set=set1', 'lzfghuyzqrmcwjzxsyrkfjguwn6p', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (9, 'maryyy', 'Mary', 'Frost', 'MaryFrost@cargocollective.comx', 'https://robohash.org/blanditiismaioresest.png?size=150x150&set=set1', 'smzswoscvmfpvug345tgflihdmka', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (10, 'food', 'Food', 'Bard', 'food@bard.com', 'https://robohash.org/numquamutut.png?size=150x150&set=set1', 'abcnibyjdutmkxngaegjxxzionyt', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (11, 'rugle', 'Red', 'Ugle', 'rugle@theint.co.ukx', 'https://robohash.org/nisiautemet.png?size=150x150&set=set1', 'asqwertqelhgkohutnoglbdohssl', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (12, 'battsman', 'Aaron', 'Battenstall', 'aaron@ow.lyx', 'https://robohash.org/molestiaemagnamet.png?size=150x150&set=set1', 'wqhvgdjxjqkloipyidpvjtwpoacc', 2);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (13, 'OGMacie', 'Mage', 'Grinella', 'macie@fc2.comx', 'https://robohash.org/doloremfugiatrerum.png?size=150x150&set=set1', 'exsjcqvnhydjofznqmwdrfekcgno', 3);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (14, 'thecooldude69', 'Fred', 'Figs', 'ff_trisckster@baidu.comx', 'https://robohash.org/quiundedignissimos.png?size=150x150&set=set1', '6tghbdspeizewvkixqubnqjlwamz', 4);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (15, 'mmmkay', 'Mark', 'Kazinski', 'mkayyy@craigslist.orgx', 'https://robohash.org/hicnihilipsa.png?size=150x150&set=set1', 'lzxmysyzqrmcdfrtyyrkbczhspup', 4);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (16, 't3eddyb3ar', 'Teddy', 'Daexter', 'teddy-bear@wikimedia.orgx', 'https://robohash.org/quidemearumtenetur.png?size=150x150&set=set1', 'pppyiksxkocmhphkylikwcehuvky', 5);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (17, 'choochoo', 'Tommy', 'Tank', 'thomasthetankengine@cargocollective.comx', 'https://robohash.org/blanditiismaioresest.png?size=150x150&set=set1', 'smzswoscvmeeeugpmgvkflihdmka', 6);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (18, 'tman007', 'Thumper', 'Cryptid', 'thumps@cargocollective.comx', 'https://robohash.org/blanditiismaioresest.png?size=150x150&set=set1', 'smzswoscvmfpvugpmgvhhhihdmka', 7);
insert into Student (Id, Username, FirstName, LastName, Email, ProfileImage, FirebaseId, ClassId) values (19, 'beadbae99', 'Boo', 'Bead', 'boscovc@cargocollective.comx', 'https://robohash.org/blanditiismaioresest.png?size=150x150&set=set1', 'smzswoscvmfpvugpmgvkflihllop', 8);
set identity_insert [Student] off

set identity_insert [Assignment] on
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (1, 'Classification of Life Worksheet', 'Answer the questions. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 2021-08-03, 1);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (2, 'Fish Identification', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 2021-08-01, 1);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (3, 'Crossword', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 2021-07-02, 1);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (4, 'Study Guide', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.

Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.

Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 2021-07-09, 1);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (5, 'empower 24/7 systems', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.', 2021-07-15, 2);

insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values  (6, 'benchmark web-enabled paradigms', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.

Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.

Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.','2020-01-19', 2);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (7, 'productize turn-key convergence', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', '2020-06-25', 2);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (8, 'drive front-end portals', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.', '2020-04-14', 2);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (9, 'exploit e-business e-services', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2019-07-23', 3);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (10, 'incentivize virtual models', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.

Sed ante. Vivamus tortor. Duis mattis egestas metus.

Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', '2019-10-13', 3);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (11, 'syndicate cross-media paradigms', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', '2019-09-11', 3);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (12, 'evolve sticky web-readiness', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2019-07-28', 4);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (13, 'monetize mission-critical supply-chains', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', '2019-12-19', 4);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (14, 'synergize seamless supply-chains', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.', '2020-01-17', 4);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (15, 'reintermediate transparent models', 'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', '2020-01-18', 5);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (16, 'grow frictionless e-tailers', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.

Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.

Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2020-06-29', 6);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (17, 'synthesize transparent niches', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', '2020-04-10', 7);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (18, 'streamline sticky e-commerce', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.

Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.

In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2020-05-04', 8);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (19, 'architect next-generation e-business', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', '2020-03-21', 9);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values (20, 'transition next-generation networks', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', '2020-05-01', 10);
insert into Assignment (Id, "Name", Instructions, DueDate, ClassId) values  (21, 'harness wireless synergies', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.

Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2020-01-24', 11);
set identity_insert [Assignment] off

set identity_insert [StudentAssignment] on
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (1, 1, 100, 'Great job', 1, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (2, 1, 99, 'Great job', 2, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (3, 1, 100, 'Great job', 3, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (4, 1, 95, 'Great job', 4, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (5, 1, 90, 'Good job', 5, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (6, 1, 50, 'Could be better', 6, 1);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (7, 1, 95, 'Great job', 1, 2);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (8, 1, 86, 'Great job', 2, 2);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (9, 1, 100, 'Great job', 3, 2);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (10, 1, 92, 'Great job', 4, 2);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (11, 1, 76, 'Good job', 5, 2);
insert into StudentAssignment (Id, Submitted, Grade, Feedback, StudentId, AssignmentId) values (12, 1, 55, 'Could be better', 6, 2);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (13, 0, 1, 3);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (14, 0, 2, 3);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (15, 0, 3, 3);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (16, 0, 4, 3);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (17, 0, 5, 3);
insert into StudentAssignment (Id, Submitted, StudentId, AssignmentId) values (18, 0, 6, 3);
set identity_insert [StudentAssignment] off

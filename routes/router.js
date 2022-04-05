import productsController from '../controllers/productsController.js';
import favorisController from '../controllers/favorisController.js';
import commentsController from '../controllers/commentsController.js';
import securityController2 from '../controllers/securityController2.js';
import adminController from '../controllers/adminController.js';
import userController2 from '../controllers/userController2.js';
import infosController from '../controllers/infosController.js';
import filterController from '../controllers/filterController.js';

import securityController from '../controllers/securityController.js';


export const setupRoutes = (app) => {
    app.use('/products', productsController);
    app.use('/favoris', favorisController);
    app.use('/comments', commentsController);
    app.use('/security2', securityController2);
    app.use('/user2', userController2);
    app.use('/admin', adminController);
    app.use('/infos', infosController);
    app.use('/filter', filterController);

    app.use('/security', securityController);

    // ... les autres routes ...
}
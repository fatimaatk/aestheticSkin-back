import productsController from '../controllers/productsController.js';
import favorisController from '../controllers/favorisController.js';
import commentsController from '../controllers/commentsController.js';
import securityController from '../controllers/securityController.js';
import adminController from '../controllers/adminController.js';
import userController from '../controllers/userController.js';
import infosController from '../controllers/infosController.js';


export const setupRoutes = (app) => {
    app.use('/products', productsController);
    app.use('/favoris', favorisController);
    app.use('/comments', commentsController);
    app.use('/security', securityController);
    app.use('/admin', adminController);
    app.use('/user', userController);
    app.use('/infos', infosController);
    // ... les autres routes ...
}
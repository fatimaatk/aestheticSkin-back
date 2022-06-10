import productsController from '../controllers/productsController.js';
import favorisController from '../controllers/favorisController.js';
import commentsController from '../controllers/commentsController.js';
import securityController from '../controllers/securityController.js';
import adminController from '../controllers/adminController.js';
import infosController from '../controllers/infosController.js';
import userController from '../controllers/userController.js';
import filterController from '../controllers/filterController.js';
import textureController from '../controllers/textureController.js';
import categoryController from '../controllers/categoryController.js';
import descriptionController from '../controllers/descriptionController.js';
import contenanceController from '../controllers/contenanceController.js';
import priceController from '../controllers/priceController.js';
import ingredientsController from '../controllers/ingredientController.js';
import imageController from '../controllers/imageController.js';
import accountController from '../controllers/accountController.js';



export const setupRoutes = (app) => {
    app.use('/products', productsController);
    app.use('/favoris', favorisController);
    app.use('/comments', commentsController);
    app.use('/security', securityController);
    app.use('/admin', adminController);
    app.use('/infos', infosController);
    app.use('/user', userController);
    app.use('/filter', filterController);
    app.use('/textures', textureController);
    app.use('/categories', categoryController)
    app.use('/description', descriptionController);
    app.use('/contenance', contenanceController);
    app.use('/price', priceController);
    app.use('/ingredients', ingredientsController);
    app.use('/images', imageController)
    app.use('/accounts', accountController)
}
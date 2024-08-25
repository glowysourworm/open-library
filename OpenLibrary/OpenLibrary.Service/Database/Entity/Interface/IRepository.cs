namespace OpenLibrary.Service.Database.Entity.Interface
{
    /// <summary>
    /// Describes a repository for use with an un-related database, such as old library systems.
    /// </summary>
    /// <typeparam name="T">Entity Type</typeparam>
    public interface IRepository<T>
    {
        /// <summary>
        /// Adds new entity to the collection
        /// </summary>
        /// <param name="entity">Entity instance for the collection</param>
        /// <param name="createAndMap">Entity is treated as a simple visitor. Instead, a new object is created from the DbContext, then the data is mapped over using the current mapping utility.</param>
        void Add(T entity, bool createAndMap = false);

        /// <summary>
        /// Updates the database collection corresponding to the entity type, and uses the entity data to update the corresponding entity of that collection.
        /// </summary>
        /// <param name="entity">Entity as simple visitor, or attached instance</param>
        void Update(T entity);
    }
}

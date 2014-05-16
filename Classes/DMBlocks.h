typedef void (^DMCallback)();
typedef void (^DMErrorCallback)(NSError* error);
typedef void (^DMAsyncTask)(DMCallback done);
typedef void (^DMTask)(id value);
typedef void (^DMIndexedTask)(NSUInteger index, id value);
typedef void (^DMKeyedTask)(id key, id value);
typedef id (^DMTransform)(id value);
typedef id (^DMMemoizedTransform)(id memo, id value);
typedef BOOL (^DMPredicate)(id value);
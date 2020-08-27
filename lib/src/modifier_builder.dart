part of mongo_dart_query;

ModifierBuilder get modify => ModifierBuilder();

class ModifierBuilder {
  Map<String, dynamic> map = {};

  toString() => "ModifierBuilder($map)";

  void _updateOperation(String operator, Map<String, dynamic> values) {
	  Map<String, dynamic> opMap = map[operator] as Map<String, dynamic>;
	  if (opMap == null) {
		  opMap = <String, dynamic>{};
		  map[operator] = opMap;
	  }
	  for (var value in values.entries)
	    opMap[value.key] = value.value;
  }

  ModifierBuilder inc(String fieldName, value) {
    _updateOperation('\$inc', {fieldName: value});
    return this;
  }

  ModifierBuilder min(String fieldName, value) {
    _updateOperation('\$min', {fieldName: value});
    return this;
  }

  ModifierBuilder max(String fieldName, value) {
    _updateOperation('\$max', {fieldName: value});
    return this;
  }

  ModifierBuilder rename(String oldName, String newName) {
    _updateOperation('\$rename', {oldName: newName});
    return this;
  }

  ModifierBuilder set(String fieldName, value) {
    _updateOperation('\$set', {fieldName: value});
    return this;
  }

  ModifierBuilder setOnInsert(String fieldName, value) {
	  _updateOperation('\$setOnInsert', {fieldName: value});
	  return this;
  }

  ModifierBuilder setAllOnInsert(Map<String, dynamic> values) {
	  _updateOperation('\$setOnInsert', values);
	  return this;
  }

  ModifierBuilder unset(String fieldName) {
    _updateOperation('\$unset', {fieldName: 1});
    return this;
  }

  ModifierBuilder push(String fieldName, value) {
    _updateOperation('\$push', {fieldName: value});
    return this;
  }

  ModifierBuilder pushAll(String fieldName, List values) {
    _updateOperation('\$push', {fieldName: {'\$each': values}});
    return this;
  }

  ModifierBuilder pull(String fieldName, value) {
    _updateOperation('\$pull', {fieldName: value});
    return this;
  }

  ModifierBuilder pullAll(String fieldName, List values) {
    _updateOperation('\$pullAll', {fieldName: values});
    return this;
  }

  ModifierBuilder addToSet(String fieldName, value) {
    _updateOperation('\$addToSet', {fieldName: value});
    return this;
  }

  ModifierBuilder addAllToSet(String fieldName, List values) {
	  _updateOperation('\$addToSet', {fieldName: {'\$each': values}});
	  return this;
  }

  ModifierBuilder popFirst(String fieldName) {
    _updateOperation('\$pop', {fieldName: -1});
    return this;
  }

  ModifierBuilder popLast(String fieldName) {
    _updateOperation('\$pop', {fieldName: 1});
    return this;
  }
}
